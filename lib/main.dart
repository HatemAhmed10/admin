import 'package:admin/data/models/1Type/4Choose-Subject/SubjectModel.dart';
import 'package:admin/presentation/screens/3Types/4Choose_Subject/Choose_Subject.dart';
import 'package:admin/presentation/widgets/3Types/4Choose_Subject/4SubjectList.dart';
import 'package:admin/presentation/widgets/Test/test.dart';
import 'package:admin/shared/components/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:admin/presentation/screens/1Splash_Screen/splash_view.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import 'firebase_options.dart';

void main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(SubjectModelAdapter());
  await Hive.openBox<SubjectModel>(kSubjectBox);

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(brightness: Brightness.dark, fontFamily: 'Poppins'),
      // home: SplashView(),
      home: SplashView(),
    );
  }
}
