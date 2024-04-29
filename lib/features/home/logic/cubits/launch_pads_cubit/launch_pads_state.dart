part of 'launch_pads_cubit.dart';

@immutable
abstract class LaunchPadsState {}

class LaunchPadsInitial extends LaunchPadsState {}

class LaunchPadsLoadedSuccess extends LaunchPadsState {
  final List<LaunchPad> allLaunchPads;

  LaunchPadsLoadedSuccess(this.allLaunchPads);
}

class LaunchPadsLoadedFailure extends LaunchPadsState {
  final String errorMessage;

  LaunchPadsLoadedFailure(this.errorMessage);
}

class LaunchPadsLoading extends LaunchPadsState {}
