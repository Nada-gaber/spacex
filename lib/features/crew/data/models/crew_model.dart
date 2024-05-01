class CrewModel {
  final String name;
  final String image;
  final String agency;
  final String wikipedia;
  final String id;

  CrewModel({
    required this.name,
    required this.image,
    required this.agency,
    required this.wikipedia,
    required this.id,
  });

  factory CrewModel.fromJson(Map<String, dynamic> json) {
    return CrewModel(
      name: json['name'],
      image: json['image'],
      agency: json['agency'],
      wikipedia: json['wikipedia'],
      id: json['id'],
    );
  }
}
