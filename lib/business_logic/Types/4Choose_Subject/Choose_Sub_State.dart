abstract class Choose_Subj_States {}

class ChooseSubjInitialState extends Choose_Subj_States {}

class AddSubjectLoading extends Choose_Subj_States {}

class AddSubjectSuccess extends Choose_Subj_States {}

class AddSubjectFailure extends Choose_Subj_States {
  final String errMessage;

  AddSubjectFailure(this.errMessage);
}

class SubjectsLoadingSuccess extends Choose_Subj_States {}

class SubjectsSuccess extends Choose_Subj_States {}

class ChangeActiveState extends Choose_Subj_States {}

class AddSubjectSuccessState extends Choose_Subj_States {}

class AddSubjectErrorState extends Choose_Subj_States {}
