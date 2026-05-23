import 'package:cloud_firestore/cloud_firestore.dart';
import '../../core/constants/app_constants.dart';

class ItemModel {
  final String id;
  final String ad;
  final String ikon;
  final String categoryId;
  final bool aktif;
  final StokDurumu stokDurumu;
  final int hatirlatmaPeriyodu; // gün cinsinden
  final DateTime? sonHatirlatma;
  final DateTime? siradakiHatirlatma;
  final String? notlar;
  final String ekleyenUid;
  final String ekleyenAd;
  final DateTime createdAt;
  final DateTime updatedAt;
  // Market entegrasyonu için hazır (v1'de UI'da yok, v2'de açılacak)
  final List<String> marketTags;
  final bool marketTrackingEnabled;

  const ItemModel({
    required this.id,
    required this.ad,
    required this.ikon,
    required this.categoryId,
    this.aktif = true,
    this.stokDurumu = StokDurumu.var_,
    required this.hatirlatmaPeriyodu,
    this.sonHatirlatma,
    this.siradakiHatirlatma,
    this.notlar,
    required this.ekleyenUid,
    required this.ekleyenAd,
    required this.createdAt,
    required this.updatedAt,
    this.marketTags = const [],
    this.marketTrackingEnabled = false,
  });

  factory ItemModel.fromMap(Map<String, dynamic> map, String id) {
    return ItemModel(
      id: id,
      ad: (map['ad'] as String?) ?? '',
      ikon: (map['ikon'] as String?) ?? '📦',
      categoryId: (map['categoryId'] as String?) ?? 'diger',
      aktif: (map['aktif'] as bool?) ?? true,
      stokDurumu: StokDurumu.fromKey((map['stokDurumu'] as String?) ?? 'var'),
      hatirlatmaPeriyodu: (map['hatirlatmaPeriyodu'] as int?) ?? 7,
      sonHatirlatma: (map['sonHatirlatma'] as Timestamp?)?.toDate(),
      siradakiHatirlatma: (map['siradakiHatirlatma'] as Timestamp?)?.toDate(),
      notlar: map['notlar'] as String?,
      ekleyenUid: (map['ekleyenUid'] as String?) ?? '',
      ekleyenAd: (map['ekleyenAd'] as String?) ?? '',
      createdAt: (map['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
      updatedAt: (map['updatedAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
      marketTags: List<String>.from((map['marketTags'] as List?) ?? []),
      marketTrackingEnabled: (map['marketTrackingEnabled'] as bool?) ?? false,
    );
  }

  Map<String, dynamic> toMap() => {
        'ad': ad,
        'ikon': ikon,
        'categoryId': categoryId,
        'aktif': aktif,
        'stokDurumu': stokDurumu.key,
        'hatirlatmaPeriyodu': hatirlatmaPeriyodu,
        'sonHatirlatma': sonHatirlatma != null ? Timestamp.fromDate(sonHatirlatma!) : null,
        'siradakiHatirlatma': siradakiHatirlatma != null ? Timestamp.fromDate(siradakiHatirlatma!) : null,
        'notlar': notlar,
        'ekleyenUid': ekleyenUid,
        'ekleyenAd': ekleyenAd,
        'createdAt': Timestamp.fromDate(createdAt),
        'updatedAt': Timestamp.fromDate(updatedAt),
        'marketTags': marketTags,
        'marketTrackingEnabled': marketTrackingEnabled,
      };

  ItemModel copyWith({
    String? ad,
    String? ikon,
    String? categoryId,
    bool? aktif,
    StokDurumu? stokDurumu,
    int? hatirlatmaPeriyodu,
    DateTime? sonHatirlatma,
    DateTime? siradakiHatirlatma,
    String? notlar,
    DateTime? updatedAt,
    List<String>? marketTags,
    bool? marketTrackingEnabled,
  }) =>
      ItemModel(
        id: id,
        ad: ad ?? this.ad,
        ikon: ikon ?? this.ikon,
        categoryId: categoryId ?? this.categoryId,
        aktif: aktif ?? this.aktif,
        stokDurumu: stokDurumu ?? this.stokDurumu,
        hatirlatmaPeriyodu: hatirlatmaPeriyodu ?? this.hatirlatmaPeriyodu,
        sonHatirlatma: sonHatirlatma ?? this.sonHatirlatma,
        siradakiHatirlatma: siradakiHatirlatma ?? this.siradakiHatirlatma,
        notlar: notlar ?? this.notlar,
        ekleyenUid: ekleyenUid,
        ekleyenAd: ekleyenAd,
        createdAt: createdAt,
        updatedAt: updatedAt ?? DateTime.now(),
        marketTags: marketTags ?? this.marketTags,
        marketTrackingEnabled: marketTrackingEnabled ?? this.marketTrackingEnabled,
      );

  /// Bir sonraki hatırlatma zamanını hesaplar
  DateTime computeNextReminder({DateTime? fromDate}) {
    final base = fromDate ?? DateTime.now();
    return base.add(Duration(days: hatirlatmaPeriyodu));
  }
}
