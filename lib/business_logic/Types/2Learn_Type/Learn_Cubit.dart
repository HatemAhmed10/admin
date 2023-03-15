import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Lern_State.dart';

class Learn_Cubit extends Cubit<Learn_States> {
  Learn_Cubit() : super(LearnInitialState());

  static Learn_Cubit get(context) => BlocProvider.of(context);
}
