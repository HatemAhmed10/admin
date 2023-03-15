import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../business_logic/Types/3Quiz_Type/Quiz_Cubit.dart';
import '../../../../business_logic/Types/3Quiz_Type/Quiz_State.dart';

class Quiz_Home_Screen extends StatelessWidget {
  const Quiz_Home_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Quiz_Cubit(),
      child: BlocBuilder<Quiz_Cubit, Quiz_States>(
        builder: (context, state) {
          Quiz_Cubit cubit = Quiz_Cubit.get(context);

          return Scaffold(
            appBar: AppBar(
              title: Text("Add Quiz"),
            ),
          );
        },
      ),
    );
  }
}
