import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  /// Get Current Firebase User
  User? get currentUser => _auth.currentUser;

  /// Check Login Status
  bool isLoggedIn() {
    return _auth.currentUser != null;
  }

  /// Get User UID
  String? getUserId() {
    return _auth.currentUser?.uid;
  }

  /// Get Phone Number
  String? getPhoneNumber() {
    return _auth.currentUser?.phoneNumber;
  }

  /// Get ID Token
  Future<String?> getToken() async {
    return await _auth.currentUser?.getIdToken();
  }

  /// Phone Number Login (Send OTP)
  Future<void> sendOtp({
    required String phoneNumber,
    required Function(String verificationId) onCodeSent,
    required Function(String error) onError,
  }) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        onError(e.message ?? "Verification failed");
      },
      codeSent: (String verificationId, int? resendToken) {
        onCodeSent(verificationId);
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  /// Verify OTP & Login
  Future<void> verifyOtp({
    required String verificationId,
    required String smsCode,
  }) async {
    final credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: smsCode,
    );

    await _auth.signInWithCredential(credential);
  }

  /// Logout
  Future<void> logout() async {
    await _auth.signOut();
  }

  Future<String?> fetchUserName() async {
    final uid = _auth.currentUser?.uid;
    if (uid == null) return null;

    final doc = await _firestore.collection('users').doc(uid).get();
    return doc.data()?['name'];
  }

  String getUserName() {
    return _auth.currentUser?.displayName ?? "User";
  }
}
