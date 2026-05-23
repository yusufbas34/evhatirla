import 'package:cloud_firestore/cloud_firestore.dart';
import '../../core/constants/app_constants.dart';

class HouseholdModel {
  final String id;
  final String ad;
  final String ownerId;
  final List<String> members; // uid'ler
  final Map<String, String> memberRoles; // uid -> role key
  final Map<String, String> memberNames; // uid -> display name (cache)
  final String? inviteCode;
  final DateTime? inviteExpiresAt;
  final DateTime createdAt;

  const HouseholdModel({
    required this.id,
    required this.ad,
    required this.ownerId,
    required this.members,
    required this.memberRoles,
    required this.memberNames,
    this.inviteCode,
    this.inviteExpiresAt,
    required this.createdAt,
  });

  factory HouseholdModel.fromMap(Map<String, dynamic> map, String id) {
    return HouseholdModel(
      id: id,
      ad: (map['ad'] as String?) ?? 'Evim',
      ownerId: (map['ownerId'] as String?) ?? '',
      members: List<String>.from((map['members'] as List?) ?? []),
      memberRoles: Map<String, String>.from((map['memberRoles'] as Map?) ?? {}),
      memberNames: Map<String, String>.from((map['memberNames'] as Map?) ?? {}),
      inviteCode: map['inviteCode'] as String?,
      inviteExpiresAt: (map['inviteExpiresAt'] as Timestamp?)?.toDate(),
      createdAt: (map['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toMap() => {
        'ad': ad,
        'ownerId': ownerId,
        'members': members,
        'memberRoles': memberRoles,
        'memberNames': memberNames,
        'inviteCode': inviteCode,
        'inviteExpiresAt': inviteExpiresAt != null ? Timestamp.fromDate(inviteExpiresAt!) : null,
        'createdAt': Timestamp.fromDate(createdAt),
      };

  UyeRolu getUserRole(String uid) => UyeRolu.fromKey(memberRoles[uid] ?? 'member');

  bool isOwner(String uid) => ownerId == uid;
  bool isMember(String uid) => members.contains(uid);
}
