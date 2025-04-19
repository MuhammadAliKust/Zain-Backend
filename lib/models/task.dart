// To parse this JSON data, do
//
//     final taskModel = taskModelFromJson(jsonString);

import 'dart:convert';

TaskModel taskModelFromJson(String str) => TaskModel.fromJson(json.decode(str));

class TaskModel {
  final String? docId;
  final String? title;
  final String? description;
  final String? priorityName;
  final String? priorityID;
  final int? createdAt;
  final bool? isCompleted;
  final String? image;
  final String? userID;

  TaskModel({
    this.docId,
    this.title,
    this.description,
    this.priorityName,
    this.userID,
    this.priorityID,
    this.createdAt,
    this.isCompleted,
    this.image,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
        docId: json["docID"],
        title: json["title"],
        description: json["description"],
        createdAt: json["createdAt"],
        isCompleted: json["isCompleted"],
        priorityName: json["priorityName"],
        priorityID: json["priorityID"],
    userID: json["userID"],
        image: json["image"],
      );

  Map<String, dynamic> toJson(String taskID) => {
        "docID": taskID,
        "title": title,
        "description": description,
        "createdAt": createdAt,
        "isCompleted": isCompleted,
        "priorityName": priorityName,
        "priorityID": priorityID,
        "userID": userID,
        "image": image,
      };
}
