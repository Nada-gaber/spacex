class UserModel {
  final String name;
  final String? email;
  final String image;
  final String? token;

  const UserModel({
    required this.name,
    this.email,
    required this.image,
    this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      image: json['image'],
      token: json['token'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'image': image,
      'token': token,
    };
  }
}
