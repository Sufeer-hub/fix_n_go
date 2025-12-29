import 'package:firebase_auth/firebase_auth.dart';
import 'package:fixn_go/app/app.router.dart';
import 'package:fixn_go/ui/screens/login/loginview.dart';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ProfileViewModel extends BaseViewModel {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _navigationService = NavigationService();

  String userName = "Guest User";
  String email = "";
  String phone = "";

  /// Init
  void init() {
    final user = _auth.currentUser;

    if (user != null) {
      userName = user.displayName ?? "User";
      email = user.email ?? "";
      phone = user.phoneNumber ?? "";
    }

    notifyListeners();
  }

  /// First letter avatar
  String get avatarLetter {
    if (userName.isEmpty) return "U";
    return userName[0].toUpperCase();
  }

  /// Logout
  Future<void> logout(BuildContext context) async {
    await _auth.signOut();

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const LoginView()),
      (_) => false,
    );
  }

  void onclick() {
    _navigationService.navigateToAddProfessionView();
  }
}
