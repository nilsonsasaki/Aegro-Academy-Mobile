class DatabaseSeedModel {
  final String id;
  final String name;
  final String manufacturer;
  final String manufacturedAt;
  final String expiresIn;
  final String createdAt;
  final String userId;
  String? lastUpdated;
  bool wasUploaded;

  DatabaseSeedModel({
    required this.id,
    required this.name,
    required this.manufacturer,
    required this.manufacturedAt,
    required this.expiresIn,
    required this.createdAt,
    required this.userId,
    this.lastUpdated,
    this.wasUploaded = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'manufacturer': manufacturer,
      'manufacturedAt': manufacturedAt,
      'expiresIn': expiresIn,
      'createdAt': createdAt,
      'userId': userId,
      'lastUpdated': lastUpdated,
      'wasUploaded': wasUploaded ? 1 : 0,
    };
  }

  DatabaseSeedModel.fromMap(Map<String, dynamic> seedMap)
      : id = seedMap['id'],
        name = seedMap['name'],
        manufacturer = seedMap['manufacturer'],
        manufacturedAt = seedMap['manufacturedAt'],
        expiresIn = seedMap['expiresIn'],
        createdAt = seedMap['createdAt'],
        userId = seedMap['userId'],
        lastUpdated = seedMap['lastUpdated'],
        wasUploaded = (seedMap['wasUploaded'] == 1) ? true : false;
}
