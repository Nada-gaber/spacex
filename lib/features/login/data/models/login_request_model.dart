class LoginRequestModel {
  late final String email;
  late final String password;

  LoginRequestModel(dynamic obj) {
    email = obj['email'];
    password = obj['password'];
  }
}