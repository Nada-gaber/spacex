import 'package:spacex/core/utils/shared_preferences.dart';

class MyStrings {
  static String token = MySharedPreferences.getString('token');
  static bool isFirstTimeToOpenApp = MySharedPreferences.getBool('isFirstTimeToOpenApp');
}