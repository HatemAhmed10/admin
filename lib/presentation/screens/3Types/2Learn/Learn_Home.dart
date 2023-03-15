import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../business_logic/Types/2Learn_Type/Learn_Cubit.dart';
import '../../../../business_logic/Types/2Learn_Type/Lern_State.dart';

class Learn_Home_Screen extends StatelessWidget {
  const Learn_Home_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Learn_Cubit(),
      child: BlocBuilder<Learn_Cubit, Learn_States>(
        builder: (context, state) {
          Learn_Cubit cubit = Learn_Cubit.get(context);

          return Scaffold(
            appBar: AppBar(
              title: Text("Add Learn"),
            ),
          );
        },
      ),
    );
  }
}
