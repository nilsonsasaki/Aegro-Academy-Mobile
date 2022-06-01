class HttpSeedModel {
  final String id;
  final String name;
  final String manufacturer;
  final String manufacturedAt;
  final String expiresIn;
  final String createdAt;
  final String userId;

  HttpSeedModel({
    required this.id,
    required this.name,
    required this.manufacturer,
    required this.manufacturedAt,
    required this.expiresIn,
    required this.createdAt,
    required this.userId,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'manufacturer': manufacturer,
        'manufacturedAt': manufacturedAt,
        'expiresIn': expiresIn,
        'createdAt': createdAt,
        'userId': userId
      };

  HttpSeedModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        manufacturer = json['manufacturer'],
        manufacturedAt = json['manufacturedAt'],
        expiresIn = json['expiresIn'],
        createdAt = json['createdAt'],
        userId = json['userId'];
}
