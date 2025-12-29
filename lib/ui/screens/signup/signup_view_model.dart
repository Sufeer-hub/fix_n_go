import 'package:firebase_auth/firebase_auth.dart';
import 'package:fixn_go/app/app.router.dart';
import 'package:fixn_go/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SignupViewModel extends BaseViewModel {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final NavigationService _navigationService = locator<NavigationService>();

  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  String? nameError;
  String? emailError;
  String? passwordError;
  String? confirmPasswordError;

  // ---------------- TOGGLES ----------------

  void togglePassword() {
    obscurePassword = !obscurePassword;
    notifyListeners();
  }

  void toggleConfirmPassword() {
    obscureConfirmPassword = !obscureConfirmPassword;
    notifyListeners();
  }

  // ---------------- VALIDATION ----------------

  bool validate({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  }) {
    nameError = name.isEmpty ? "Name is required" : null;
    emailError = (!email.contains('@') || !email.contains('.'))
        ? "Enter a valid email"
        : null;
    passwordError = password.length < 6 ? "Min 6 characters" : null;
    confirmPasswordError = password != confirmPassword
        ? "Passwords do not match"
        : null;

    notifyListeners();

    return nameError == null &&
        emailError == null &&
        passwordError == null &&
        confirmPasswordError == null;
  }

  // ---------------- SIGNUP ----------------

  Future<void> signup({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    if (!validate(
      name: name,
      email: email,
      password: password,
      confirmPassword: confirmPassword,
    ))
      return;

    setBusy(true);
    clearErrors();

    try {
      /// Create user
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );

      /// 🔥 SAVE NAME TO FIREBASE
      await credential.user!.updateDisplayName(name.trim());
      await credential.user!.reload();

      /// Go to login or home
      _navigationService.replaceWithLoginView();
    } on FirebaseAuthException catch (e) {
      setError(e.message ?? "Signup failed");
    } finally {
      setBusy(false);
    }
  }

  // ---------------- NAVIGATION ----------------

  void goToLogin() {
    _navigationService.replaceWithLoginView();
  }
}
