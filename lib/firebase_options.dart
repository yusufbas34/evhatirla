// ⚠️ BU DOSYA OTOMATIK OLARAK FlutterFire CLI TARAFINDAN ÜRETİLECEK
//
// Firebase Console'da proje oluşturduktan sonra şu komutları çalıştır:
//
// 1. flutterfire CLI kur (eğer yoksa):
//    dart pub global activate flutterfire_cli
//
// 2. Firebase'e bağlan:
//    flutterfire configure --project=evhatirla
//
// Bu komut bu dosyayı senin Firebase ayarlarınla otomatik dolduracak.
//
// Şimdilik placeholder olarak buradayız ki uygulama derlensin.

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) return web;
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      default:
        throw UnsupportedError('Bu platform desteklenmiyor');
    }
  }

  // ⬇️ FlutterFire configure komutu bu değerleri dolduracak
  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'PLACEHOLDER_API_KEY',
    appId: 'PLACEHOLDER_APP_ID',
    messagingSenderId: 'PLACEHOLDER_SENDER_ID',
    projectId: 'evhatirla',
    storageBucket: 'evhatirla.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'PLACEHOLDER_API_KEY',
    appId: 'PLACEHOLDER_APP_ID',
    messagingSenderId: 'PLACEHOLDER_SENDER_ID',
    projectId: 'evhatirla',
    storageBucket: 'evhatirla.appspot.com',
    iosBundleId: 'com.yusufbas.evhatirla',
  );

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'PLACEHOLDER_API_KEY',
    appId: 'PLACEHOLDER_APP_ID',
    messagingSenderId: 'PLACEHOLDER_SENDER_ID',
    projectId: 'evhatirla',
    authDomain: 'evhatirla.firebaseapp.com',
    storageBucket: 'evhatirla.appspot.com',
  );
}
