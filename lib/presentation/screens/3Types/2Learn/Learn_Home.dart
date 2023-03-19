import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../business_logic/Types/2Learn_Type/Learn_Cubit.dart';
import '../../../../business_logic/Types/2Learn_Type/Lern_State.dart';
import 'package:video_player/video_player.dart';

import '../../../../shared/styles/colors.dart';

class Learn_Home_Screen extends StatelessWidget {
  const Learn_Home_Screen(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.numberImage});

  final String title;
  final String subtitle;
  final int numberImage;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Learn_Cubit(),
      child: BlocBuilder<Learn_Cubit, Learn_States>(
        builder: (context, state) {
          Learn_Cubit cubit = Learn_Cubit.get(context);

          return Scaffold(
            appBar: AppBar(
              title: Text(title.toString()),
            ),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: ColorManager.defaultColor,
              fixedColor: Colors.white,
              type: BottomNavigationBarType.fixed,
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeIndex(index);
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.photo,
                  ),
                  label: 'Add Photo',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.video_call,
                  ),
                  label: 'Add Video',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.picture_as_pdf,
                  ),
                  label: 'Add PDF',
                ),
              ],
            ),
            body: ConditionalBuilder(
              // condition: state is! AppGetDatabaseLoadingState,
              condition: 5 > 2,

              builder: (context) => cubit.screensState(
                  index: cubit.currentIndex,
                  Title: title,
                  SubTitle: subtitle,
                  numberImage: numberImage),
              fallback: (context) => Center(child: CircularProgressIndicator()),
            ),
          );
        },
      ),
    );
  }
}
