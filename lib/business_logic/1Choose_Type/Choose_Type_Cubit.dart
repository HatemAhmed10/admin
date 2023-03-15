import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/styles/assets_manager.dart';
import 'Choose_Type_State.dart';

class Choose_Type_Cubit extends Cubit<Choose_Type_States> {
  Choose_Type_Cubit() : super(ChooseTypeInitialState());

  static Choose_Type_Cubit get(context) => BlocProvider.of(context);

  int current = 0;

  List<AssetImage> Type_Images = [
    const AssetImage(ImageAssets.News_Image),
    const AssetImage(ImageAssets.Learn_Image),
    const AssetImage(ImageAssets.Quiz_Image),
  ];
  final List<dynamic> Type_Content = [
    {
      'title': 'Add News ',
      'description': '',
    },
    {
      'title': 'Add Learn ',
      'description': '',
    },
    {
      'title': 'Add Quiz ',
      'description': '',
    },
  ];

  void changeCardIndex(int index) {
    current = index;
    emit(AppChooseTypeState());
  }
}
