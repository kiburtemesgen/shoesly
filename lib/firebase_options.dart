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
    apiKey: 'AIzaSyCU6n2nDeXtEWUqQ5DlakfcjvRnLxVoiUM',
    appId: '1:862476175762:web:ec14889836bb61d0ac994b',
    messagingSenderId: '862476175762',
    projectId: 'note-ddd-bd9f1',
    authDomain: 'note-ddd-bd9f1.firebaseapp.com',
    databaseURL: 'https://note-ddd-bd9f1-default-rtdb.firebaseio.com',
    storageBucket: 'note-ddd-bd9f1.appspot.com',
    measurementId: 'G-GLSR5EZ24B',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA9FdDL30S58xWvKbYVIu3dXFkacrZ568I',
    appId: '1:862476175762:android:b854dfd354321560ac994b',
    messagingSenderId: '862476175762',
    projectId: 'note-ddd-bd9f1',
    databaseURL: 'https://note-ddd-bd9f1-default-rtdb.firebaseio.com',
    storageBucket: 'note-ddd-bd9f1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCNVleC_jynF7vPa3Mz5re96FsYXhvW7_k',
    appId: '1:862476175762:ios:b17535c728eb4f15ac994b',
    messagingSenderId: '862476175762',
    projectId: 'note-ddd-bd9f1',
    databaseURL: 'https://note-ddd-bd9f1-default-rtdb.firebaseio.com',
    storageBucket: 'note-ddd-bd9f1.appspot.com',
    androidClientId: '862476175762-04lrvvn4hpssm05j724cs4gujp7gq1ib.apps.googleusercontent.com',
    iosClientId: '862476175762-a751cgmi8pqn7it8r3h9vr4vu5at6206.apps.googleusercontent.com',
    iosBundleId: 'com.example.priorSoft',
  );
}
