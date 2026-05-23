import 'package:cloud_firestore/cloud_firestore.dart';
import '../../core/constants/app_constants.dart';

class HistoryModel {
  final String id;
  final String itemId;
  final String itemAd;
  final String tamamlayanUid;
  final String tamamlayanAd;
  final BildirimAksiyon aksiyon;
  final int? erteleMinutes; // erteleme ise dakika
  final DateTime tamamlamaZamani;

  const HistoryModel({
    required this.id,
    required this.itemId,
    required this.itemAd,
    required this.tamamlayanUid,
    required this.tamamlayanAd,
    required this.aksiyon,
    this.erteleMinutes,
    required this.tamamlamaZamani,
  });

  factory HistoryModel.fromMap(Map<String, dynamic> map, String id) {
    return HistoryModel(
      id: id,
      itemId: (map['itemId'] as String?) ?? '',
      itemAd: (map['itemAd'] as String?) ?? '',
      tamamlayanUid: (map['tamamlayanUid'] as String?) ?? '',
      tamamlayanAd: (map['tamamlayanAd'] as String?) ?? '',
      aksiyon: BildirimAksiyon.values.firstWhere(
        (e) => e.key == (map['aksiyon'] as String?),
        orElse: () => BildirimAksiyon.tamamlandi,
      ),
      erteleMinutes: map['erteleMinutes'] as int?,
      tamamlamaZamani: (map['tamamlamaZamani'] as Timestamp?)?.toDate() ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toMap() => {
        'itemId': itemId,
        'itemAd': itemAd,
        'tamamlayanUid': tamamlayanUid,
        'tamamlayanAd': tamamlayanAd,
        'aksiyon': aksiyon.key,
        'erteleMinutes': erteleMinutes,
        'tamamlamaZamani': Timestamp.fromDate(tamamlamaZamani),
      };
}
