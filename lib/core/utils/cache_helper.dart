import 'dart:convert';

import 'package:spacex/core/utils/shared_preferences.dart';
import 'package:spacex/features/home/data/models/launch_pad_model.dart';
import 'package:spacex/features/home/data/models/rocket_model.dart';
import 'package:spacex/features/home/data/models/user_model.dart';

class CacheHelper {
  static cacheRocketsData(List<Rocket> rockets) async {
    String encodeJsonData = json.encode(
      rockets
          .map(
            (rockets) => rockets.toJson(),
          )
          .toList(),
    );
    await MySharedPreferences.setString(
      'cachedRockets',
      encodeJsonData,
    );
  }

  static Future<List<Rocket>> getCachedRocketsData() async {
    final cachedRockets = MySharedPreferences.getString('cachedRockets');
    List<Rocket> rockets = [];
    if (cachedRockets.isNotEmpty) {
      List decodeJsonData = json.decode(cachedRockets);
      rockets = decodeJsonData
          .map(
            (jsonRockets) => Rocket.fromJson(jsonRockets),
          )
          .toList();
    }
    return rockets;
  }

  static cacheLaunchPadData(List<LaunchPad> launchPads) async {
    String encodeJsonData = json.encode(
      launchPads
          .map(
            (launchPads) => launchPads.toJson(),
          )
          .toList(),
    );
    await MySharedPreferences.setString(
      'cachedLaunchPads',
      encodeJsonData,
    );
  }

  static Future<List<LaunchPad>> getCachedLaunchPadData() async {
    final cachedLaunchPads = MySharedPreferences.getString('cachedLaunchPads');
    List<LaunchPad> launchPads = [];
    if (cachedLaunchPads.isNotEmpty) {
      List decodeJsonData = json.decode(cachedLaunchPads);
      launchPads = decodeJsonData
          .map(
            (jsonLaunchPads) => LaunchPad.fromJson(jsonLaunchPads),
          )
          .toList();
    }
    return launchPads;
  }

  static cacheProfileData(UserModel userModel) async {
    String encodeJsonData = json.encode(userModel.toMap());
    await MySharedPreferences.setString(
      'cachedProfileData',
      encodeJsonData,
    );
  }

  static Future<UserModel?> getCachedProfileData() async {
    final cachedPosts = MySharedPreferences.getString('cachedProfileData');
    UserModel? userModel;
    if (cachedPosts.isNotEmpty) {
      Map<String, dynamic> decodeJsonData = json.decode(cachedPosts);
      userModel = UserModel.fromJson(decodeJsonData);
    }
    return userModel;
  }
}
