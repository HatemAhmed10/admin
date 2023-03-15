import 'package:flutter_bloc/flutter_bloc.dart';

import 'Quiz_State.dart';

class Quiz_Cubit extends Cubit<Quiz_States> {
  Quiz_Cubit() : super(QuizInitialState());

  static Quiz_Cubit get(context) => BlocProvider.of(context);
}
