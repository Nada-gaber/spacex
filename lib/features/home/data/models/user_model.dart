class UserModel {
  final String name;
  final String image;
  final String token;

  const UserModel({
    required this.name,
    required this.image,
    required this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      image: json['image'],
      token: json['token'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'image': image,
      'token': token,
    };
  }
}
