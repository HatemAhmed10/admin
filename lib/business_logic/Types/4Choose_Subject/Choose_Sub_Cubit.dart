import 'dart:ui';

import 'package:admin/data/models/1Type/4Choose-Subject/SubjectModel.dart';
import 'package:bloc/bloc.dart';
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
    try {
      var subjectsBox = Hive.box<SubjectModel>(kSubjectBox);
      await subjectsBox.add(subject);
      emit(AddSubjectSuccess());
    } catch (e) {
      emit(AddSubjectFailure(e.toString()));
    }
  }

  List<SubjectModel> subject = [
    // SubjectModel(title: "aas", subTitle: "sa", color: 1)
  ];
  fetchAllSubjects() {
    var subjectsBox = Hive.box<SubjectModel>(kSubjectBox);
    subject = subjectsBox.values.toList();
    print("Tomas");

    emit(SubjectsSuccess());
  }

  int currentIndex = 0;
  bool isActive = false;
  void changeactive(int index) {
    currentIndex = index;
    isActive = currentIndex == index;
    emit(ChangeActiveState());
  }
}
