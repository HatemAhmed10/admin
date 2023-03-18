import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../business_logic/Types/2Learn_Type/Learn_Cubit.dart';
import '../../../../business_logic/Types/2Learn_Type/Lern_State.dart';
import 'package:video_player/video_player.dart';

class Learn_Home_Screen extends StatefulWidget {
  const Learn_Home_Screen(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.numberImage});

  final String title;
  final String subtitle;
  final int numberImage;

  @override
  State<Learn_Home_Screen> createState() => _Learn_Home_ScreenState();
}

class _Learn_Home_ScreenState extends State<Learn_Home_Screen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Learn_Cubit()..PlayVideo(),
      child: BlocBuilder<Learn_Cubit, Learn_States>(
        builder: (context, state) {
          Learn_Cubit cubit = Learn_Cubit.get(context);

          return Scaffold(
            appBar: AppBar(
              title: Text(cubit.x.toString()),
            ),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.yellow,
                  height: 500,
                  child: Column(
                    children: [
                      AspectRatio(
                        aspectRatio: cubit.controller.value.aspectRatio,
                        child: VideoPlayer(cubit.controller),
                      ),
                      MaterialButton(
                        onPressed: () {
                          setState(() {
                            cubit.controller.value.isPlaying
                                ? cubit.controller.pause()
                                : cubit.controller.play();
                          });
                        },
                        child: Text("Play"),
                      )
                    ],
                  ),
                ),
              ),
            ),
            // floatingActionButton: FloatingActionButton(
            //   onPressed: () {
            //     setState(() {
            //       cubit.controller.value.isPlaying
            //           ? cubit.controller.pause()
            //           : cubit.controller.play();
            //     });
            //   },
            //   child: Icon(
            //     cubit.controller.value.isPlaying
            //         ? Icons.pause
            //         : Icons.play_arrow,
            //   ),
            // ),
          );
        },
      ),
    );
  }

  // @override
  // void dispose() {
  //   super.dispose();
  //   controller.dispose();
  // }
}
