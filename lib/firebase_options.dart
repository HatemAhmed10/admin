// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyC4V9eJRNAYg7Iv4uwBbFWWyxsfkfcYB6o',
    appId: '1:95521192834:web:3cfb6e7a75d3b998dbed9b',
    messagingSenderId: '95521192834',
    projectId: 'learn-app-be9eb',
    authDomain: 'learn-app-be9eb.firebaseapp.com',
    storageBucket: 'learn-app-be9eb.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDj2nqZc4d8uHDpeUqUSRlM2Jk7LNtbsi4',
    appId: '1:95521192834:android:09665e24a621681adbed9b',
    messagingSenderId: '95521192834',
    projectId: 'learn-app-be9eb',
    storageBucket: 'learn-app-be9eb.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDWQjSJ0AALFcH5H9DzBUnPv-SFwFJ3tyk',
    appId: '1:95521192834:ios:d8756d38e235c1cddbed9b',
    messagingSenderId: '95521192834',
    projectId: 'learn-app-be9eb',
    storageBucket: 'learn-app-be9eb.appspot.com',
    iosClientId: '95521192834-reviheon9rhvedeskr8bf7edfrqa5if5.apps.googleusercontent.com',
    iosBundleId: 'com.example.admin',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDWQjSJ0AALFcH5H9DzBUnPv-SFwFJ3tyk',
    appId: '1:95521192834:ios:d97a3dddf66fc998dbed9b',
    messagingSenderId: '95521192834',
    projectId: 'learn-app-be9eb',
    storageBucket: 'learn-app-be9eb.appspot.com',
    iosClientId: '95521192834-b3dngnlr40tme4i936jvdqbn505pnec5.apps.googleusercontent.com',
    iosBundleId: 'com.example.admin.RunnerTests',
  );
}
