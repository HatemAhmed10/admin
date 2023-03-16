import 'package:cloud_firestore/cloud_firestore.dart';

class NewsModel {
  String? id;
  String? Text;
  String? imageurl;
  Timestamp? date;

  NewsModel({
    this.id,
    this.Text,
    this.imageurl,
    this.date,
  });
  NewsModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];

    Text = json["Text"];
    imageurl = json["imageurl"];
    date = json["date"];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'Text': Text,
      'imageurl': imageurl,
      'date': date,
    };
  }
}
