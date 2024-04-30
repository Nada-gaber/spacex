class CrewModel {
  final String name;
  final String image;
  final String agency;
  final String wikipedia;

  CrewModel({
    required this.name,
    required this.image,
    required this.agency,
    required this.wikipedia,
  });

  factory CrewModel.fromJson(Map<String, dynamic> json) {
    return CrewModel(
      name: json['name'],
      image: json['image'],
      agency: json['agency'],
      wikipedia: json['wikipedia'],
    );
  }
}
