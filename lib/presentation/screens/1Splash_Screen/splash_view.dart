import 'dart:async';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../business_logic/Types/4Choose_Subject/Choose_Sub_Cubit.dart';
import '../../../shared/components/1Tooles/5Custom_Navigate.dart';
import '../../../shared/styles/assets_manager.dart';
import '../../../shared/styles/colors.dart';
import '../2Choose_Type_Screen/Change_Type_Screen.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin {
  Timer? _timer;

  _startDelay() {
    _timer = Timer(const Duration(seconds: 2), _goNext);
  }

  _goNext() {
    navigateAndFinish(context, ChangeTypeScreen());
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
    // BlocProvider.of<Choose_Subj_Cubit>(context).fetchAllSubjects();
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<Choose_Subj_Cubit>(context).fetchAllSubjects();

    return Scaffold(
      // backgroundColor: ColorManager.primary,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 50,
            ),
            Expanded(
              flex: 4,
              child: FadeInDown(
                child: Container(
                  height: 350,
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 10),
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child:
                      Image(image: AssetImage(ImageAssets.Splash_Screen_Image)),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Expanded(
              flex: 1,
              child: FadeInUp(
                child: Text(
                  "معا للتفوق",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
