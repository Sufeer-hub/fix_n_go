// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_database/firebase_database.dart';

// class WorkerProfileService {
//   final _db = FirebaseDatabase.instance.ref();
//   final _auth = FirebaseAuth.instance;

//   String get _uid => _auth.currentUser!.uid;

//   DatabaseReference get _workerRef => _db.child('workers').child(_uid);
//   DatabaseReference get _workersRef => _db.child('workers');

//   /// Save / Update profile (current user)
//   Future<void> saveProfile({
//     required String fullName,
//     required String phone,
//     required double ratePerHour,
//     required int experience,
//     required List<String> skills,
//     required String about,
//   }) async {
//     await _workerRef.set({
//       "uid": _uid,
//       "fullName": fullName,
//       "phone": phone,
//       "ratePerHour": ratePerHour,
//       "experience": experience,
//       "skills": {
//         for (var skill in skills) skill: true, // KEY-VALUE PAIR
//       },
//       "about": about,
//       "rating": 4.5,
//       "distance": 2.0,
//       "isAvailable": true,
//       "profileImage":
//           "https://images.unsplash.com/photo-1603415526960-f7e0328c63b1",
//       "updatedAt": DateTime.now().toIso8601String(),
//     });
//   }

//   /// Fetch profile (current user)
//   Future<Map<String, dynamic>?> getProfile() async {
//     final snapshot = await _workerRef.get();
//     if (!snapshot.exists) return null;
//     return Map<String, dynamic>.from(snapshot.value as Map);
//   }

//   /// ✅ FETCH ALL WORKERS (ALL USERS)
//   Future<List<Map<String, dynamic>>> fetchAllWorkers() async {
//     final snapshot = await _workersRef.get();
//     if (!snapshot.exists) return [];

//     final data = Map<String, dynamic>.from(snapshot.value as Map);

//     return data.entries.map((e) {
//       final worker = Map<String, dynamic>.from(e.value);
//       worker['uid'] = e.key;
//       return worker;
//     }).toList();
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class WorkerProfileService {
  final _db = FirebaseDatabase.instance.ref();
  final _auth = FirebaseAuth.instance;

  String get _uid => _auth.currentUser!.uid;

  DatabaseReference get _workerRef => _db.child('workers').child(_uid);
  DatabaseReference get _workersRef => _db.child('workers');

  Future<void> saveProfile({
    required String fullName,
    required String profession,
    required String phone,
    required double ratePerHour,
    required int experience,
    required List<String> skills,
    required String about,
    String? profileImageUrl,
  }) async {
    await _workerRef.set({
      "uid": _uid,
      "fullName": fullName,
      "profession": profession,
      "phone": phone,
      "ratePerHour": ratePerHour,
      "experience": experience,
      "skills": {for (var skill in skills) skill: true},
      "about": about,
      "ratingAvg": 0,
      "ratingCount": 0,
      "isAvailable": true,
      "profileImage": profileImageUrl ?? "https://via.placeholder.com/150",
      "updatedAt": DateTime.now().toIso8601String(),
    });
  }

  /// Update only profile image (NO DATA LOSS)
  Future<void> updateProfileImage(String imageUrl) async {
    await _workerRef.update({
      "profileImage": imageUrl,
      "updatedAt": DateTime.now().toIso8601String(),
    });
  }

  /// Fetch profile (current user)
  Future<Map<String, dynamic>?> getProfile() async {
    final snapshot = await _workerRef.get();
    if (!snapshot.exists) return null;
    return Map<String, dynamic>.from(snapshot.value as Map);
  }

  /// Fetch all workers
  Future<List<Map<String, dynamic>>> fetchAllWorkers() async {
    final snapshot = await _workersRef.get();
    if (!snapshot.exists) return [];

    final data = Map<String, dynamic>.from(snapshot.value as Map);

    return data.entries.map((e) {
      final worker = Map<String, dynamic>.from(e.value);
      worker['uid'] = e.key;
      return worker;
    }).toList();
  }

  /// Fetch profile by worker UID (PUBLIC VIEW)
  Future<Map<String, dynamic>?> getProfileByUid(String uid) async {
    final snapshot = await _workersRef.child(uid).get();
    if (!snapshot.exists) return null;
    return Map<String, dynamic>.from(snapshot.value as Map);
  }

  Future<List<Map<String, dynamic>>> fetchWorkersByProfession(
    String profession,
  ) async {
    final snapshot = await _workersRef.get();
    if (!snapshot.exists) return [];

    final data = Map<String, dynamic>.from(snapshot.value as Map);

    return data.entries
        .map((e) {
          final worker = Map<String, dynamic>.from(e.value);
          worker['uid'] = e.key;
          return worker;
        })
        .where(
          (worker) =>
              (worker['profession'] ?? '').toString().toLowerCase() ==
              profession.toLowerCase(),
        )
        .toList();
  }
}
