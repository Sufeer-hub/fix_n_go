import 'package:fix_n_go/app/app.router.dart';
import 'package:fix_n_go/app/utils.dart';
import 'package:fix_n_go/models/User.dart';
import 'package:flutter/cupertino.dart';

import 'package:stacked/stacked.dart';

class Loginviewmodel extends BaseViewModel {
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  User? user;
  bool obscureText = true;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    formKey.currentState!.reset();
  }

  Future<bool> login() async {
    if (!formKey.currentState!.validate()) return false;
    setBusy(true); // show loader
    try {
      user = await apiservice.login(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      if (user != null) {
        await userservice.saveUser(user!);
        navigationService.navigateTo(
          Routes.homeview,
          arguments: HomeviewArguments(user: user!),
        );
        return true;
      }
    } catch (e) {
      debugPrint('Login error: $e');
    } finally {
      setBusy(false); // hide loader
    }
    return false;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter email';
    }
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }
}
