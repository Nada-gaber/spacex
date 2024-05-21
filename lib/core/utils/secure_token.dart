import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const storage = FlutterSecureStorage();

Future<void> storeInitialToken() async {
  String token =
      "007eJxTYHj+Z91Sy4IHpwKack/cffuvaf5KSXmLb6++Z4iVPeS7tN9TgcHA2CzZzNIiKS0lOdUkKTE5ydjAJNXI3DQt0STZMNnU4kG3d1pDICNDDpcPKyMDBIL4bAzFBYnJqRUMDADbZiPI";
  await storage.write(key: 'agora_token', value: token);
}

Future<void> handleLoginOrConfig() async {
  await storeInitialToken();
}
