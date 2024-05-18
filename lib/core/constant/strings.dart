import 'package:spacex/core/utils/shared_preferences.dart';

class MyStrings {
  static String token = MySharedPreferences.getString('token');
  static bool isFirstTimeToOpenApp =
      MySharedPreferences.getBool('isFirstTimeToOpenApp');
  static const appId = "036c698bfdce4bacb304e275fa4c1c58";
  static const tokenAgora =
      "007eJxTYLA/mq/4+uA1qcMbz+Yny1u2bNhQ1ONsb2gxU05412YbvRAFBgNjs2QzS4uktJTkVJOkxOQkYwOTVCNz07REk2TDZFOL2wKeaQ2BjAxKX0UZGKEQxGdjKC5ITE6tYGAAAEU4HuI=";
  static const channel = "spacex";
 
}
