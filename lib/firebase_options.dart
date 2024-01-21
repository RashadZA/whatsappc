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
    apiKey: 'AIzaSyA8d_zqNRiMTCe18-VEL4Ij3wd_5xuPm8s',
    appId: '1:346056294363:web:25a091db7865fe45ef31fe',
    messagingSenderId: '346056294363',
    projectId: 'whatsappc-63e98',
    authDomain: 'whatsappc-63e98.firebaseapp.com',
    storageBucket: 'whatsappc-63e98.appspot.com',
    measurementId: 'G-PK1HTV3SLN',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDnNvOu92R67mxIYJd3QZw-a0Vo_aYhIN4',
    appId: '1:346056294363:android:5976e02e4b8f4218ef31fe',
    messagingSenderId: '346056294363',
    projectId: 'whatsappc-63e98',
    storageBucket: 'whatsappc-63e98.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCek4uvyJbIBFnRAlmrwlmAB8iUedokFW8',
    appId: '1:346056294363:ios:e25306b703f99086ef31fe',
    messagingSenderId: '346056294363',
    projectId: 'whatsappc-63e98',
    storageBucket: 'whatsappc-63e98.appspot.com',
    iosBundleId: 'com.example.whatsappc',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCek4uvyJbIBFnRAlmrwlmAB8iUedokFW8',
    appId: '1:346056294363:ios:398893ee091568e3ef31fe',
    messagingSenderId: '346056294363',
    projectId: 'whatsappc-63e98',
    storageBucket: 'whatsappc-63e98.appspot.com',
    iosBundleId: 'com.example.whatsappc.RunnerTests',
  );
}
