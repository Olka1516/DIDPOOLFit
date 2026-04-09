import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: 'AIzaSyCNHEnjo4DNqzQXsA9MvrED7i9L09TWRU0',
    appId: '1:40317865995:web:b903e289b444259adf770e',
    messagingSenderId: '40317865995',
    projectId: 'didpoolfit-e424e',
    authDomain: 'didpoolfit-e424e.firebaseapp.com',
    storageBucket: 'didpoolfit-e424e.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBygZzBIw-J3DxWkJhOOe9MwAtzC3RPYzQ',
    appId: '1:40317865995:android:266a3b298167be3adf770e',
    messagingSenderId: '40317865995',
    projectId: 'didpoolfit-e424e',
    storageBucket: 'didpoolfit-e424e.firebasestorage.app',
  );
}
