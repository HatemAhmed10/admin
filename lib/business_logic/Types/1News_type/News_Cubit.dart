import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'News_State.dart';

class News_Cubit extends Cubit<News_States> {
  News_Cubit() : super(NewsTypeInitialState());

  static News_Cubit get(context) => BlocProvider.of(context);
}
