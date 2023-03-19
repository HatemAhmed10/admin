import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

import '../../../presentation/screens/3Types/2Learn/1Screens/1Add_Photo.dart';
import '../../../presentation/screens/3Types/2Learn/1Screens/2Add_Video.dart';
import '../../../presentation/screens/3Types/2Learn/1Screens/3Add_PDF.dart';
import 'Lern_State.dart';

class Learn_Cubit extends Cubit<Learn_States> {
  Learn_Cubit() : super(LearnInitialState());

  static Learn_Cubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  String title = "";
  String subTitle = "";
  int numberImage = 0;

  List<String> AppBarTitle = ["Add Photo", "Add Viedo", "Add PDF"];

  Widget screensState(
      {required int index,
      required String Title,
      required String SubTitle,
      required int numberImage}) {
    List<Widget> screens = [
      AddPhoto_Screen(
          title: Title, subtitle: SubTitle, numberImage: numberImage),
      Add_Video_Screen(
          title: Title, subtitle: SubTitle, numberImage: numberImage),
      Add_PDF_Screen(
          title: Title, subtitle: SubTitle, numberImage: numberImage),
    ];

    return screens[index];
  }

  void changeIndex(
    int index,
  ) {
    currentIndex = index;
    emit(AppChangeBottomNavBarState());
  }

  //_____________________________________________________________________
}
