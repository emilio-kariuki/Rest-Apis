// ignore_for_file: unused_label

class ReadDataModel {
  String? name;
  String? email;

  ReadDataModel({required this.name, required this.email});

  ReadDataModel.fromJson(Map<String, dynamic>json) {
    name: json["name"];
    email: json["email"];
  }
}
