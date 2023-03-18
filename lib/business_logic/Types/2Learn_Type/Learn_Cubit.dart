import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

import 'Lern_State.dart';

class Learn_Cubit extends Cubit<Learn_States> {
  Learn_Cubit() : super(LearnInitialState());

  static Learn_Cubit get(context) => BlocProvider.of(context);

  late VideoPlayerController controller;
  String? x;
// https://firebasestorage.googleapis.com/v0/b/learn-app-be9eb.appspot.com/o/bee.mp4?alt=media&token=68b0bb71-fa1f-4d66-a721-3e500f4873bc
  void PlayVideo() {
    controller = VideoPlayerController.network(
        'https://firebasestorage.googleapis.com/v0/b/learn-app-be9eb.appspot.com/o/beetle.mp4?alt=media&token=170d2921-c20f-4623-ad4d-e0538bb54388')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        // setState(() {
        //   print("Goood");
        // });
      });

    // Duration durationOfVideo = controller.value.duration;
    // var duration = Duration(
    //     milliseconds: controller.value.position.inMilliseconds.round());
    // x = [duration.inMinutes, duration.inSeconds]
    //     .map((seg) => seg.remainder(60).toString().padLeft(2, '0'))
    //     .join(':');
    emit(PlayVideoState());
  }
}
