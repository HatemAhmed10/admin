import 'package:cloud_firestore/cloud_firestore.dart';

class LearnModel {
  String? id;
  String? text;
  String? imageurl;
  String? videourl;
  String? pdfurl;
  String? titleSubject;
  String? subTitleSubject;
  int? numberOfImage;
  Timestamp? date;

  LearnModel({
    this.id,
    this.text,
    this.imageurl,
    this.videourl,
    this.pdfurl,
    this.titleSubject,
    this.subTitleSubject,
    this.numberOfImage,
    this.date,
  });
  LearnModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    text = json["text"];
    imageurl = json["imageurl"];
    videourl = json["videourl"];
    pdfurl = json["pdfurl"];
    titleSubject = json["titleSubject"];
    subTitleSubject = json["subTitleSubject"];
    numberOfImage = json["numberOfImage"];
    date = json["date"];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'text': text,
      'imageurl': imageurl,
      'videourl': videourl,
      'pdfurl': pdfurl,
      'titleSubject': titleSubject,
      'subTitleSubject': subTitleSubject,
      'numberOfImage': numberOfImage,
      'date': date,
    };
  }
}
