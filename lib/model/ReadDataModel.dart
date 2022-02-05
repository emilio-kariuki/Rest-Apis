import 'dart:convert';

List<User> userFromJson(String str) => List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
    User({
        required this.name,
        required this.email,
    });

    String name;
    String email;

    factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        email: json["Email"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "Email": email,
    };
}
