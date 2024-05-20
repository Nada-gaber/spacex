import 'package:spacex/core/utils/shared_preferences.dart';

class MyStrings {
  static String token = MySharedPreferences.getString('token');
  static bool isFirstTimeToOpenApp =
      MySharedPreferences.getBool('isFirstTimeToOpenApp');
  static const appId = "036c698bfdce4bacb304e275fa4c1c58";
  static const tokenAgora =
      "007eJxTYAj4c6/O4s7c1StYLr39NftJyZGYzSEu7mG6PG0c8sx9tScUGAyMzZLNLC2S0lKSU02SEpOTjA1MUo3MTdMSTZINk00tust90hoCGRk2W9swMTJAIIjPxlBckJicWsHAAADp/CC/";
  static const channel = "spacex";
}
