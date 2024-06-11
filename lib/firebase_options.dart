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
    apiKey: 'AIzaSyB0KUKgiOh0FNxDcg2DCx-9yy0fdQ2sV7Y',
    appId: '1:907854656760:web:33a6d553ba8d7a2262370d',
    messagingSenderId: '907854656760',
    projectId: 'p2-iris-sagastume',
    authDomain: 'p2-iris-sagastume.firebaseapp.com',
    storageBucket: 'p2-iris-sagastume.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC5RWNHnEFOT5RJ2MJbZlRJzSMC4ARHPAI',
    appId: '1:907854656760:android:1e7a021c21b7cd9562370d',
    messagingSenderId: '907854656760',
    projectId: 'p2-iris-sagastume',
    storageBucket: 'p2-iris-sagastume.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBTb2VQ7KXfLx1V4DUourm8obVcryZgJ3Q',
    appId: '1:907854656760:ios:f21b49accadd7ba462370d',
    messagingSenderId: '907854656760',
    projectId: 'p2-iris-sagastume',
    storageBucket: 'p2-iris-sagastume.appspot.com',
    iosBundleId: 'com.example.flutterApplication1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBTb2VQ7KXfLx1V4DUourm8obVcryZgJ3Q',
    appId: '1:907854656760:ios:f21b49accadd7ba462370d',
    messagingSenderId: '907854656760',
    projectId: 'p2-iris-sagastume',
    storageBucket: 'p2-iris-sagastume.appspot.com',
    iosBundleId: 'com.example.flutterApplication1',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyB0KUKgiOh0FNxDcg2DCx-9yy0fdQ2sV7Y',
    appId: '1:907854656760:web:c394dec9dd4f098562370d',
    messagingSenderId: '907854656760',
    projectId: 'p2-iris-sagastume',
    authDomain: 'p2-iris-sagastume.firebaseapp.com',
    storageBucket: 'p2-iris-sagastume.appspot.com',
  );
}
