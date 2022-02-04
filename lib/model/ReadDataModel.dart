class ReadDataModel {
  String? name;
  String? email;

  ReadDataModel({required this.name, required this.email});

  ReadDataModel.fromJson(json) {
    name:
    json["name"];
    email:
    json["email"];
  }
}
