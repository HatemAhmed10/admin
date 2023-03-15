import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../business_logic/Types/1News_type/News_Cubit.dart';
import '../../../../business_logic/Types/1News_type/News_State.dart';

class News_Home_Screen extends StatelessWidget {
  const News_Home_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => News_Cubit(),
      child: BlocBuilder<News_Cubit, News_States>(
        builder: (context, state) {
          News_Cubit cubit = News_Cubit.get(context);

          return Scaffold(
            appBar: AppBar(
              title: Text("Add News"),
            ),
          );
        },
      ),
    );
  }
}
