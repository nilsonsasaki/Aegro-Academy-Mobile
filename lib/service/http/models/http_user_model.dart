class HttpUserModel {
  final String id;
  final String fullName;
  final String email;

  HttpUserModel(
      {required this.id, required this.fullName, required this.email});

  Map<String, dynamic> toJson() =>
      {'id': id, 'fullName': fullName, 'email': email};

  HttpUserModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        fullName = json['fullName'],
        email = json['email'];
}
