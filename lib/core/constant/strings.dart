import 'package:spacex/core/utils/shared_preferences.dart';

class MyStrings {
  static String token = MySharedPreferences.getString('token');
  static bool isFirstTimeToOpenApp =
      MySharedPreferences.getBool('isFirstTimeToOpenApp');
  static const appId = "036c698bfdce4bacb304e275fa4c1c58";
  static const tokenAgora =
            "007eJxTYNBfUfnj3KX1EaUHM7nSj3xy2bI5LKRE6rfGE/YuzkO8Ov4KDAbGZslmlhZJaSnJqSZJiclJxgYmqUbmpmmJJsmGyaYWjNK+aQ2BjAwP785lZGSAQBCfjaG4IDE5tYKBAQCuPyBt";

  static const channel = "spacex";
}
