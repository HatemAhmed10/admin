// import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../4Choose-Subject/SubjectModel.dart';

class PostModel {
  String? Id;
  int? QuizTime;

  String? title;
  String? dectitle;
  int? numberImage;

  String? desc;
  Timestamp? date;
  String? imageUrl;
  List? Users;
  SubjectModel? subjectModel;

  PostModel({
    this.Id,
    this.title,
    this.QuizTime,
    this.dectitle,
    this.numberImage,
    this.desc,
    this.date,
    this.imageUrl,
    this.Users,
  });

  PostModel.fromJson(Map<String, dynamic> json) {
    Id = json['Id'];
    QuizTime = json['QuizTime'];

    title = json['Title'];
    dectitle = json['dectitle'];
    numberImage = json['numberImage'];

    desc = json['desc'];
    date = json['date'];
    imageUrl = json['imageUrl'];
    Users = json['Users'];
  }

  Map<String, dynamic> toMap() {
    return {
      'Id': Id,
      'QuizTime': QuizTime,
      'Title': title,
      'dectitle': dectitle,
      'numberImage': numberImage,
      'desc': desc,
      'date': date,
      'imageUrl': imageUrl,
      'Users': Users,
    };
  }
}
