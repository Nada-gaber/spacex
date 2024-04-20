class RegisterRequestModel {
  late final String name;
  late final String email;
  late final String password;

  RegisterRequestModel({
    required this.name,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'password': password,
    };
  }
}
