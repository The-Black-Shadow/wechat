// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyD3sBb4xUvYaHKo6kO2JM0aWPZg5zKqvv8',
    appId: '1:299559202951:web:8ca81933bd0bcc858c0822',
    messagingSenderId: '299559202951',
    projectId: 'wechat-93a62',
    authDomain: 'wechat-93a62.firebaseapp.com',
    storageBucket: 'wechat-93a62.appspot.com',
    measurementId: 'G-6BPDYPE8E3',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA55eJECL6-X2Nox9MWjFmFcIfDiTuxovY',
    appId: '1:299559202951:android:92e8979172be26388c0822',
    messagingSenderId: '299559202951',
    projectId: 'wechat-93a62',
    storageBucket: 'wechat-93a62.appspot.com',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyD3sBb4xUvYaHKo6kO2JM0aWPZg5zKqvv8',
    appId: '1:299559202951:web:55fc307819e752398c0822',
    messagingSenderId: '299559202951',
    projectId: 'wechat-93a62',
    authDomain: 'wechat-93a62.firebaseapp.com',
    storageBucket: 'wechat-93a62.appspot.com',
    measurementId: 'G-9M8NH196YL',
  );
}