// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

import 'dart:convert';

CategoryModel categoryModelFromJson(String str) => CategoryModel.fromJson(json.decode(str));

String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
  final String? docId;
  final String? name;
  final int? createdAt;

  CategoryModel({
    this.docId,
    this.name,
    this.createdAt,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    docId: json["docID"],
    name: json["name"],
    createdAt: json["createdAt"],
  );

  Map<String, dynamic> toJson() => {
    "docID": docId,
    "name": name,
    "createdAt": createdAt,
  };
}
