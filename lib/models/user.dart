// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) =>
    json.encode(data.toJson(data.docId.toString()));

class UserModel {
  final String? docId;
  final String? name;
  final String? phone;
  final String? address;
  final String? email;
  final int? createdAt;

  UserModel({
    this.docId,
    this.name,
    this.phone,
    this.address,
    this.email,
    this.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        docId: json["docID"],
        name: json["name"],
        phone: json["phone"],
        address: json["address"],
        createdAt: json["createdAt"],
    email: json["email"],
      );

  Map<String, dynamic> toJson(String docID) => {
        "docID": docID,
        "name": name,
        "phone": phone,
        "address": address,
        "createdAt": createdAt,
        "email": email,
      };
}
