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
    apiKey: 'AIzaSyCxVA6AoJ-DRS-9iEDFZDQN92X8Rl8kjHE',
    appId: '1:28557884890:web:42349701aa361da6c294e3',
    messagingSenderId: '28557884890',
    projectId: 'ecommerce-d7adf',
    authDomain: 'ecommerce-d7adf.firebaseapp.com',
    storageBucket: 'ecommerce-d7adf.appspot.com',
    measurementId: 'G-09HYWR2KKL',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB0WF7gu6va3DpIA8qKLoCQiT2LISJLPyg',
    appId: '1:28557884890:android:9abd801161427981c294e3',
    messagingSenderId: '28557884890',
    projectId: 'ecommerce-d7adf',
    storageBucket: 'ecommerce-d7adf.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB_WwWD19cFKSQ_TasjPcnywnjuda8X7aI',
    appId: '1:28557884890:ios:e1fa2791d868d573c294e3',
    messagingSenderId: '28557884890',
    projectId: 'ecommerce-d7adf',
    storageBucket: 'ecommerce-d7adf.appspot.com',
    androidClientId: '28557884890-020d1c7fkooo7cg2g772q7v58lsl6q7r.apps.googleusercontent.com',
    iosClientId: '28557884890-3c3jn2b8am97tlggl7v67jidi7alnrnm.apps.googleusercontent.com',
    iosBundleId: 'com.example.store',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB_WwWD19cFKSQ_TasjPcnywnjuda8X7aI',
    appId: '1:28557884890:ios:e1fa2791d868d573c294e3',
    messagingSenderId: '28557884890',
    projectId: 'ecommerce-d7adf',
    storageBucket: 'ecommerce-d7adf.appspot.com',
    androidClientId: '28557884890-020d1c7fkooo7cg2g772q7v58lsl6q7r.apps.googleusercontent.com',
    iosClientId: '28557884890-3c3jn2b8am97tlggl7v67jidi7alnrnm.apps.googleusercontent.com',
    iosBundleId: 'com.example.store',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCxVA6AoJ-DRS-9iEDFZDQN92X8Rl8kjHE',
    appId: '1:28557884890:web:56d7662303d77d1dc294e3',
    messagingSenderId: '28557884890',
    projectId: 'ecommerce-d7adf',
    authDomain: 'ecommerce-d7adf.firebaseapp.com',
    storageBucket: 'ecommerce-d7adf.appspot.com',
    measurementId: 'G-5HX764MYE2',
  );

}