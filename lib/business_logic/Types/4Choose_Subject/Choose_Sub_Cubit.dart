import 'dart:ui';

import 'package:admin/data/models/1Type/4Choose-Subject/SubjectModel.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import '../../../shared/components/constants.dart';
import 'Choose_Sub_State.dart';

class Choose_Subj_Cubit extends Cubit<Choose_Subj_States> {
  Choose_Subj_Cubit() : super(ChooseSubjInitialState());

  static Choose_Subj_Cubit get(context) => BlocProvider.of(context);

  // Color color = const Color(0xffAC3931);
  addSubject(SubjectModel subject) async {
    // subject.color = color.value;
    emit(AddSubjectLoading());
    // try {
    // var subjectsBox = Hive.box<SubjectModel>(kSubjectBox);
    // await subjectsBox.add(subject);

    SubjectModel subjectModel = SubjectModel(
        title: subject.title, subTitle: subject.subTitle, color: subject.color);

    var FId = FirebaseFirestore.instance.collection('Subject').doc();

    FirebaseFirestore.instance
        .collection("Subject")
        .doc(FId.id)
        .set(subjectModel.toMap())
        .then((value) {
      emit(AddSubjectSuccessState());
    }).catchError((error) {
      emit(AddSubjectErrorState());
    });

    // emit(AddSubjectSuccess());
    // } catch (e) {
    //   emit(AddSubjectFailure(e.toString()));
    // }
  }

  List<SubjectModel> subject = [
    // SubjectModel(title: "aas", subTitle: "sa", color: 1)
  ];
  fetchAllSubjects() {
    // var subjectsBox = Hive.box<SubjectModel>(kSubjectBox);
    // subject = subjectsBox.values.toList();
    // print(subject.toString());
    emit(SubjectsLoadingSuccess());
    subject.clear();
    FirebaseFirestore.instance
        .collection('Subject')
        .snapshots()
        .listen((event) {
      subject.clear();

      event.docs.forEach((element) {
        subject.add(SubjectModel.fromJson(element.data()));
      });
      emit(SubjectsSuccess());
    });

    // emit(SubjectsSuccess());
  }

  int currentIndex = 0;
  bool isActive = false;
  void changeactive(int index) {
    currentIndex = index;
    isActive = currentIndex == index;
    emit(ChangeActiveState());
  }
}
