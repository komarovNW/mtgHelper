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
        return ios;
      case TargetPlatform.macOS:
        return macos;
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
    apiKey: 'AIzaSyCsYtNlVqOmWEX2d-lDGEub5bxiwEK4F7c',
    appId: '1:1081559787647:web:2d4ddb5de0a99e8b57f74a',
    messagingSenderId: '1081559787647',
    projectId: 'samplemtghelper',
    authDomain: 'samplemtghelper.firebaseapp.com',
    storageBucket: 'samplemtghelper.firebasestorage.app',
    measurementId: 'G-ZQPMEM5ELZ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAZp7A1LezZG6wRFkKM1I3TgmUA-YqBTDU',
    appId: '1:1081559787647:android:1e9f594e59b6f94257f74a',
    messagingSenderId: '1081559787647',
    projectId: 'samplemtghelper',
    storageBucket: 'samplemtghelper.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyApbOgyMbc95RD2lwH4GvSPPIUlT5qaw8A',
    appId: '1:1081559787647:ios:39ababf41c4bb86157f74a',
    messagingSenderId: '1081559787647',
    projectId: 'samplemtghelper',
    storageBucket: 'samplemtghelper.firebasestorage.app',
    iosBundleId: 'com.mtgHelper.mtgHelper',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyApbOgyMbc95RD2lwH4GvSPPIUlT5qaw8A',
    appId: '1:1081559787647:ios:39ababf41c4bb86157f74a',
    messagingSenderId: '1081559787647',
    projectId: 'samplemtghelper',
    storageBucket: 'samplemtghelper.firebasestorage.app',
    iosBundleId: 'com.mtgHelper.mtgHelper',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCsYtNlVqOmWEX2d-lDGEub5bxiwEK4F7c',
    appId: '1:1081559787647:web:9b7f1511a3e6f6f557f74a',
    messagingSenderId: '1081559787647',
    projectId: 'samplemtghelper',
    authDomain: 'samplemtghelper.firebaseapp.com',
    storageBucket: 'samplemtghelper.firebasestorage.app',
    measurementId: 'G-VC0L0DX595',
  );
}
