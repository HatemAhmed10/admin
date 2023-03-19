abstract class Quiz_States {}

class QuizInitialState extends Quiz_States {}

/// work with test
///
class ChoisAnserState extends Quiz_States {}

// Result Calculation
class DeleteDataToanyQuestionState extends Quiz_States {}

// Update Firebase
class AddDataToanyQuestionState extends Quiz_States {}

// ranking the first
class ChangeCounterQuestionState extends Quiz_States {}

////////////////////////////////////////////////////////////////////////////////////
/// Test
class AppChangeBottomNavBarState extends Quiz_States {}

class AddPostSuccessState extends Quiz_States {}

class AddPostErrorState extends Quiz_States {
  AddPostErrorState(error);
}

class AddPostLoadingState extends Quiz_States {}

class AddPostSuccessState2 extends Quiz_States {}

class AddPostErrorState2 extends Quiz_States {
  AddPostErrorState2(error);
}
