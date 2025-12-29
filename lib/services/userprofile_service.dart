import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserProfileService {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  String get _uid => _auth.currentUser!.uid;

  DocumentReference get _userDoc => _firestore.collection('users').doc(_uid);

  /// Create or Update Profile
  Future<void> saveProfile({
    required String name,
    required String phone,
    required double ratePerHour,
    required int experience,
    required List<String> skills,
    required String about,
    String? profileImage,
  }) async {
    await _userDoc.set({
      'name': name,
      'phone': phone,
      'ratePerHour': ratePerHour,
      'experience': experience,
      'skills': skills,
      'about': about,
      'profileImage': profileImage,
      'updatedAt': FieldValue.serverTimestamp(),
      'createdAt': FieldValue.serverTimestamp(),
    }, SetOptions(merge: true)); // 🔥 keeps same user
  }

  /// Get Profile
  Future<Map<String, dynamic>?> getProfile() async {
    final snapshot = await _userDoc.get();
    if (!snapshot.exists) return null;
    return snapshot.data() as Map<String, dynamic>;
  }

  /// Add Skill
  Future<void> addSkill(String skill) async {
    await _userDoc.update({
      'skills': FieldValue.arrayUnion([skill]),
    });
  }

  /// Remove Skill
  Future<void> removeSkill(String skill) async {
    await _userDoc.update({
      'skills': FieldValue.arrayRemove([skill]),
    });
  }
}
