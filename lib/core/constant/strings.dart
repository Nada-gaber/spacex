import 'package:spacex/core/utils/shared_preferences.dart';

class MyStrings {
  static String token = MySharedPreferences.getString('token');
  static bool isFirstTimeToOpenApp =
      MySharedPreferences.getBool('isFirstTimeToOpenApp');
  static const appId = "036c698bfdce4bacb304e275fa4c1c58";
  static const tokenAgora =
      "007eJxTYHj+Z91Sy4IHpwKack/cffuvaf5KSXmLb6++Z4iVPeS7tN9TgcHA2CzZzNIiKS0lOdUkKTE5ydjAJNXI3DQt0STZMNnU4kG3d1pDICNDDpcPKyMDBIL4bAzFBYnJqRUMDADbZiPI";
  static const channel = "spacex";
}
