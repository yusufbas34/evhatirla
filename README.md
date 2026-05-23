# 🏠 EvHatırla

Ailelerin ev ihtiyaçlarını ortak takip ettiği, hatırlatma gönderen Flutter uygulaması.

## Özellikler

- 🔐 Email + Google ile giriş
- 👨‍👩‍👧 Çoklu kullanıcı (aile) — ortak liste, QR davet
- 📋 İhtiyaç listesi (varsayılan + özel ekleme)
- 🔔 Akıllı hatırlatmalar (günlük/haftalık/özel periyot)
- 🎯 Stok durumu (Var / Azaldı / Bitti)
- 📊 Geçmiş ve haftalık özet
- 🌙 Sessiz saatler
- 🏷️ Kategoriler (Mutfak, Banyo, Temizlik, vs.)
- 🛒 Market öneri altyapısı (v2'de açılacak)

## Stack

- **Frontend:** Flutter 3.24+ (Android · iOS · Web)
- **State:** Riverpod 2.x
- **Navigation:** go_router
- **Backend:** Firebase (Auth, Firestore, Cloud Messaging, Cloud Functions, Storage)
- **Build:** GitHub Actions (APK otomatik)

## Kurulum

### 1. Firebase projesini oluştur

1. https://console.firebase.google.com → Yeni proje oluştur (proje ID: `evhatirla`)
2. Authentication > Sign-in method'da **Email/Password** ve **Google**'ı aktif et
3. Firestore Database oluştur (production mode)
4. Cloud Messaging'i aktif et

### 2. FlutterFire CLI ile bağla

```bash
dart pub global activate flutterfire_cli
flutterfire configure --project=evhatirla
```

Bu komut `lib/firebase_options.dart` ve `android/app/google-services.json` dosyalarını otomatik oluşturur.

### 3. Bağımlılıkları yükle

```bash
flutter pub get
```

### 4. Çalıştır

```bash
flutter run
```

## GitHub Actions ile APK Build (Kurumsal PC için)

Kodunu GitHub'a push ettiğinde Actions otomatik APK üretir:

1. Repoya push et
2. GitHub > Actions sekmesinden işin tamamlanmasını bekle
3. **Artifacts** kısmından `evhatirla-release-apk` indir

Release oluşturmak için tag at:

```bash
git tag v1.0.0
git push origin v1.0.0
```

## Klasör Yapısı

```
lib/
├── core/           → Tema, sabitler, router, utils
├── data/           → Modeller, repository'ler, servisler
├── presentation/   → UI ekranları
└── providers/      → Riverpod state providers
```

## Geliştirme Yol Haritası

- [x] **Paket 1:** Proje iskeleti + tema + modeller ← *şu an*
- [ ] **Paket 2:** Firebase Auth + Google Sign-In
- [ ] **Paket 3:** Ev (Household) sistemi + QR davet
- [ ] **Paket 4:** İhtiyaç CRUD + filtreleme
- [ ] **Paket 5:** Bildirim sistemi + Cloud Functions
- [ ] **Paket 6:** Geçmiş + alışveriş özeti
- [ ] **Paket 7:** Market entegrasyonu (gizli altyapı)

---
© 2026 Yusuf Başaran
