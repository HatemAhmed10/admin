import 'package:cloud_firestore/cloud_firestore.dart';

import '../4Choose-Subject/SubjectModel.dart';

class QuizModel {
  String? QuizId;
  int? QuizTime;
  String? Quiztitle;
  String? Quizdesc;
  Timestamp? date;
  List? QuizUsers;
  String? titleimage;
  String? subTitleimage;
  int? numberimage;

  List? Question;
  List<Map<String, List>>? Answer;
  List? correctAnswer;

  QuizModel({
    this.QuizId,
    this.QuizTime,
    this.Quiztitle,
    this.Quizdesc,
    this.date,
    this.QuizUsers,
    this.titleimage,
    this.subTitleimage,
    this.numberimage,
    this.Question,
    this.Answer,
    this.correctAnswer,
  });

  QuizModel.fromJson(Map<String, dynamic> json) {
    QuizId = json['QuizId'];
    QuizTime = json['QuizTime'];
    Quiztitle = json['Quiztitle'];
    Quizdesc = json['Quizdesc'];
    date = json['date'];
    QuizUsers = json['QuizUsers'];
    titleimage = json['titleimage'];
    subTitleimage = json['subTitleimage'];
    numberimage = json['numberimage'];

    Question = json['Question'];
    Answer = json['Answer'];
    correctAnswer = json['correctAnswer'];
  }

  Map<String, dynamic> toMap() {
    return {
      'QuizId': QuizId,
      'QuizTime': QuizTime,
      'Quiztitle': Quiztitle,
      'Quizdesc': Quizdesc,
      'date': date,
      'QuizUsers': QuizUsers,
      'titleimage': titleimage,
      'subTitleimage': subTitleimage,
      'numberimage': numberimage,
      'Question': Question,
      'Answer': Answer,
      'correctAnswer': correctAnswer,
    };
  }
}
