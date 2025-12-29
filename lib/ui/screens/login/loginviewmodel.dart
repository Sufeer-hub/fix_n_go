import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:fixn_go/app/app.router.dart';
import 'package:fixn_go/app/utils.dart';

class LoginViewModel extends BaseViewModel {
  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  bool obscurePassword = true;
  String? errorMessage;

  // ---------------- Validators ----------------

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Email is required";
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Password is required";
    }
    return null;
  }

  // ---------------- Toggle Password ----------------

  void togglePassword() {
    obscurePassword = !obscurePassword;
    notifyListeners();
  }

  // ---------------- Email Login ----------------

  Future<void> login() async {
    if (!formKey.currentState!.validate()) return;

    setBusy(true);
    errorMessage = null;

    try {
      await _auth.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      navigationService.replaceWith(Routes.mainView);
    } on FirebaseAuthException catch (e) {
      errorMessage = _mapError(e.code);
      notifyListeners();
    } finally {
      setBusy(false);
    }
  }

  // ---------------- Google Login ----------------

  Future<void> loginWithGoogle() async {
    setBusy(true);
    errorMessage = null;

    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        setBusy(false);
        return;
      }

      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await _auth.signInWithCredential(credential);

      navigationService.replaceWith(Routes.mainView);
    } catch (e) {
      errorMessage = "Google login failed";
      notifyListeners();
    } finally {
      setBusy(false);
    }
  }

  // ---------------- Navigate to Signup ----------------

  void goToSignup() {
    navigationService.navigateTo(Routes.signupView);
  }

  // ---------------- Error Mapping ----------------

  String _mapError(String code) {
    switch (code) {
      case 'user-not-found':
        return "User not found";
      case 'wrong-password':
        return "Wrong password";
      case 'invalid-email':
        return "Invalid email";
      default:
        return "Login failed";
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
