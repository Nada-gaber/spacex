import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:spacex/core/constant/colors.dart';
import 'package:spacex/core/constant/strings.dart';
import 'package:spacex/features/streams/ui/widgets/channel_textfield.dart';

import '../widgets/error_agora.dart';
import '../widgets/join_channel.dart';
import '../widgets/remote_video_view.dart';

class AgoraStreaming extends StatefulWidget {
  const AgoraStreaming({super.key});

  @override
  State<AgoraStreaming> createState() => _AgoraStreamingState();
}

class _AgoraStreamingState extends State<AgoraStreaming> {
  final _channelNameController = TextEditingController();
  bool _useMicrophone = true;
  bool _useVideo = true;
  int? _remoteUid;
  bool _localUserJoined = false;
  late RtcEngine _engine;
  bool isWorking = false;
  final List<int> _remoteUsers = []; // List to store remote UIDs

  @override
  void initState() {
    super.initState();
    initAgora();
  }

  Future<void> initAgora() async {
    await [Permission.microphone, Permission.camera].request();

    _engine = createAgoraRtcEngine();
    await _engine.initialize(const RtcEngineContext(
      appId: MyStrings.appId,
      channelProfile: ChannelProfileType.channelProfileLiveBroadcasting,
    ));

    _engine.registerEventHandler(
      RtcEngineEventHandler(
        onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
          debugPrint("local user ${connection.localUid} joined");
          setState(() {
            _localUserJoined = true;
          });
        },
        onUserJoined: (RtcConnection connection, int remoteUid, int elapsed) {
          debugPrint("remote user $remoteUid joined");
          setState(() {
            _remoteUid = remoteUid;
          });
        },
        onUserOffline: (RtcConnection connection, int remoteUid,
            UserOfflineReasonType reason) {
          debugPrint("remote user $remoteUid left channel");
          setState(() {
            _remoteUid = null;
          });
        },
        onTokenPrivilegeWillExpire: (RtcConnection connection, String token) {
          debugPrint(
              '[onTokenPrivilegeWillExpire] connection: ${connection.toJson()}, token: $token');
        },
      ),
    );

    // Enable video based on user selection
    if (_useVideo) {
      await _engine.enableVideo();
      await _engine.startPreview();
    }

    // Enable microphone based on user selection
    if (_useMicrophone) {
      await _engine.enableAudio();
    }

    await _engine.setClientRole(role: ClientRoleType.clientRoleBroadcaster);
  }

  @override
  void dispose() {
    super.dispose();
    _dispose();
  }

  Future<void> _dispose() async {
    await _engine.leaveChannel();
    await _engine.release();
  }

  Future<void> _joinChannel() async {
    String channelName = _channelNameController.text;
    if (channelName.isEmpty) {
      return; // Handle empty channel name
    }
    await _engine.joinChannel(
      token: MyStrings.tokenAgora,
      channelId: channelName,
      uid: 0,
      options: const ChannelMediaOptions(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return isWorking
        ? const InvalidConfigWidget()
        : Scaffold(
            backgroundColor: AppColors.backgroundDarkBlue,
            appBar: AppBar(
              backgroundColor: AppColors.backgroundDarkBlue,
              title: const Text(
                'SpaceX Video Call',
                style: TextStyle(color: AppColors.textWhite),
              ),
            ),
            body: Stack(
              children: [
                // Channel name text field
                ChannelNameTextField(
                    textEditingController: _channelNameController),

                Center(
                  child: _localUserJoined
                      ? AgoraVideoView(
                          controller: VideoViewController(
                            rtcEngine: _engine,
                            canvas: const VideoCanvas(uid: 0),
                          ),
                        )
                      : const Align(
                          alignment: Alignment.topCenter, child: Text('')),
                ),
                // Microphone and video toggle buttons
                Positioned(
                  top: 50.0,
                  left: 20.0,
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          _useMicrophone ? Icons.mic : Icons.mic_off,
                          color: AppColors.textWhite,
                        ),
                        onPressed: () {
                          setState(() {
                            _useMicrophone = !_useMicrophone;
                            if (_useMicrophone) {
                              _engine.enableAudio();
                            } else {
                              _engine.disableAudio();
                            }
                          });
                        },
                      ),
                      const SizedBox(width: 10),
                      IconButton(
                        icon: Icon(
                          _useVideo ? Icons.videocam : Icons.videocam_off,
                          color: AppColors.textWhite,
                        ),
                        onPressed: () {
                          setState(() {
                            _useVideo = !_useVideo;
                            if (_useVideo) {
                              _engine.enableVideo();
                              _engine.startPreview();
                            } else {
                              _engine.disableVideo();
                              _engine.stopPreview();
                            }
                          });
                        },
                      ),
                    ],
                  ),
                ),

                // Join channel button
                JoinChannelButton(onPressed: _joinChannel),

                // Local and remote video views

                _remoteUid != null
                    ? SizedBox(
                        width: 100,
                        height: 150,
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: AgoraVideoView(
                            controller: VideoViewController.remote(
                              rtcEngine: _engine,
                              canvas: VideoCanvas(uid: _remoteUid!),
                              connection: const RtcConnection(channelId: ""),
                            ),
                          ),
                        ),
                      )
                    : const RemoteVideoView(),
              ],
            ),
          );
  }
}
