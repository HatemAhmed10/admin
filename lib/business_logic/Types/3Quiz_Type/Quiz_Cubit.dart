import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/1Type/3QuizModel/PostModel.dart';
import '../../../data/models/1Type/3QuizModel/QuestionModel.dart';
import '../../../data/models/1Type/4Choose-Subject/SubjectModel.dart';
import 'Quiz_State.dart';

class Quiz_Cubit extends Cubit<Quiz_States> {
  Quiz_Cubit() : super(QuizInitialState());

  static Quiz_Cubit get(context) => BlocProvider.of(context);

  ///  Work in Add Post Screen
//////////////////////////////////////////////////////////////
  /// 1 -  Work with Question Page
  String? FAnswer = null;
  // List FinalAnswer = [];
  void ChoiseAnswer(String index) {
    FAnswer = index;
    emit(ChoisAnserState());
  }

//////////////////////////////////////////////////////////////////
//2- work with Question
  int Counter = 1;
  List InputQuestion = [];
  List<Map<String, List>> InputAnswer = [];
  List InputCorrectAnswer = [];

  // delete Item
  void DeleteFromList() {
    InputQuestion.removeLast();
    InputAnswer.removeLast();
    InputCorrectAnswer.removeLast();
    Counter--;
    emit(DeleteDataToanyQuestionState());
  }

  void AddDateToList({
    required String question,
    required String answer1,
    required String answer2,
    required String answer3,
    required String correctAnswer,
  }) {
    InputQuestion.add(question.trim());
    InputAnswer.add({
      "Q${Counter.toString()}": [
        answer1.trim(),
        answer2.trim(),
        answer3.trim()
      ],
    });
    InputCorrectAnswer.add(correctAnswer.toUpperCase().trim());
    FAnswer = null;
    emit(AddDataToanyQuestionState());
  }

  void ChangeCounterQuestion() {
    Counter++;
    emit(ChangeCounterQuestionState());
  }

// /////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////
  /// 3- Add post Data
  ///
  void AddPost({
    required int QuizTime,
    required String Title,
    required String decTitle,
    required int numberImage,
    required String Desc,
    required Timestamp Date,
    required List FQuestion,
    required List<Map<String, List>>? FAnswer,
    required List? FcorrectAnswer,
  }) {
    emit(AddPostLoadingState());

    var FId = FirebaseFirestore.instance
        .collection('DataBase')
        .doc('Table')
        .collection('Posts')
        .doc();

    PostModel model = PostModel(
        Id: FId.id,
        QuizTime: QuizTime,
        title: Title,
        desc: Desc,
        date: Date,
        Users: [
          {"name": "", "degree": 0}
        ],
        // Users: [
        //   {"name": "Hatem2", "degree": 40},
        //   {"name": "saad2", "degree": 101},
        //   {"name": "ahmed2", "degree": 2100},
        //   {"name": "Hatedsadm2", "degree": 80},
        // ],
        imageUrl: "سيشسيشسيشس",
        dectitle: decTitle,
        numberImage: numberImage);

    // SubjectModel subjectModel =
    //     SubjectModel(title: Title, subTitle: decTitle, color: numberImage);

    // FirebaseFirestore.instance
    //     .collection("Subject")
    //     .doc(FId.id)
    //     .set(subjectModel.toMap())
    //     .then((value) {
    //   emit(AddPostSuccessState2());
    // }).catchError((error) {
    //   emit(AddPostErrorState2(error));
    // });

    FirebaseFirestore.instance
        .collection("Quizes")
        .doc(FId.id)
        .set(model.toMap())
        .then((value) {
      emit(AddPostSuccessState());
    }).catchError((error) {
      emit(AddPostErrorState(error));
    });

    QuestionModel questionModel = QuestionModel(
      Question: FQuestion,
      Answer: FAnswer,
      correctAnswer: FcorrectAnswer,
    );

    FirebaseFirestore.instance
        .collection("Quizes")
        .doc(FId.id)
        .collection("Question")
        .doc("Data")
        .set(questionModel.toMap())
        .then((value) {
      emit(AddPostSuccessState());
    }).catchError((error) {
      emit(AddPostErrorState(error));
    });
  }

  ////////////////////////////////////////////////////////////////
}
