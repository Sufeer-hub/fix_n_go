import 'package:fixn_go/constants/app_colors.dart';
import 'package:fixn_go/constants/assets.gen.dart';
import 'package:fixn_go/ui/screens/login/loginviewmodel.dart';
import 'package:fixn_go/ui/tools/blur_background.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          backgroundColor: const Color(0xFFF7F8FA),
          body: Stack(
            children: [
              _body(context, viewModel),

              if (viewModel.isBusy)
                Positioned.fill(
                  child: BlurBackground(
                    blur: 80,
                    child: const Center(child: CircularProgressIndicator()),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  Widget _body(BuildContext context, LoginViewModel viewModel) {
    return SingleChildScrollView(
      child: Form(
        key: viewModel.formKey,
        child: Column(
          children: [
            /// Top Image
            Stack(
              children: [
                Assets.images.login.image(
                  height: 350,
                  width: 500,
                  fit: BoxFit.contain,
                ),
                const Positioned(
                  left: 118,
                  top: 35,
                  child: Text(
                    "Welcome!",
                    style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 32),

                  const Text(
                    "Email Address",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 8),

                  TextFormField(
                    controller: viewModel.emailController,
                    validator: viewModel.emailValidator,
                    decoration: _inputDecoration(
                      "hello@example.com",
                      Icons.email_outlined,
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    "Password",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 8),

                  TextFormField(
                    controller: viewModel.passwordController,
                    obscureText: viewModel.obscurePassword,
                    validator: viewModel.passwordValidator,
                    decoration: _inputDecoration(
                      "Enter your password",
                      Icons.lock_outline,
                      suffix: IconButton(
                        icon: Icon(
                          viewModel.obscurePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: viewModel.togglePassword,
                      ),
                    ),
                  ),

                  if (viewModel.errorMessage != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Text(
                        viewModel.errorMessage!,
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),

                  const SizedBox(height: 36),

                  /// Login Button
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Palette.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      onPressed: viewModel.login,
                      child: Text(
                        "Login",
                        style: TextStyle(fontSize: 22, color: Palette.white),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  /// Google Button
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: OutlinedButton.icon(
                      icon: Icon(Icons.g_mobiledata),
                      label: const Text("Continue with Google"),
                      onPressed: viewModel.loginWithGoogle,
                    ),
                  ),

                  const SizedBox(height: 32),

                  Center(
                    child: TextButton(
                      onPressed: viewModel.goToSignup,
                      child: RichText(
                        text: TextSpan(
                          text: "Don’t have an account? ",
                          style: TextStyle(color: Colors.grey),
                          children: [
                            TextSpan(
                              text: "Sign up",
                              style: TextStyle(
                                color: Palette.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(
    String hint,
    IconData icon, {
    Widget? suffix,
  }) {
    return InputDecoration(
      hintText: hint,
      prefixIcon: Icon(icon),
      suffixIcon: suffix,
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none,
      ),
    );
  }
}
