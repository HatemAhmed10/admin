abstract class Choose_Subj_States {}

class ChooseSubjInitialState extends Choose_Subj_States {}

class AddSubjectLoading extends Choose_Subj_States {}

class AddSubjectSuccess extends Choose_Subj_States {}

class AddSubjectFailure extends Choose_Subj_States {
  final String errMessage;

  AddSubjectFailure(this.errMessage);
}

class SubjectsSuccess extends Choose_Subj_States {}

class ChangeActiveState extends Choose_Subj_States {}
