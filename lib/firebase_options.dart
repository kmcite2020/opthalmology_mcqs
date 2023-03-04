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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAcno6UAgvpOPLS2LjN0vgoclILV-w2DFc',
    appId: '1:96219142067:web:470ed28c8bc1a71fd61dc6',
    messagingSenderId: '96219142067',
    projectId: 'opthalmology-mcqs-c7ef4',
    authDomain: 'opthalmology-mcqs-c7ef4.firebaseapp.com',
    storageBucket: 'opthalmology-mcqs-c7ef4.appspot.com',
    measurementId: 'G-N3S9S5Q627',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD9LYRCKWHrEaUS6qWaSa6BNabPCcLiqcM',
    appId: '1:96219142067:android:8eef6d332e6aaa9fd61dc6',
    messagingSenderId: '96219142067',
    projectId: 'opthalmology-mcqs-c7ef4',
    storageBucket: 'opthalmology-mcqs-c7ef4.appspot.com',
  );
}
