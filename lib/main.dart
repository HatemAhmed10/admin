import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:admin/presentation/screens/1Splash_Screen/splash_view.dart';

import 'firebase_options.dart';

void main() async {
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
      home: SplashView(),
    );
  }
}
