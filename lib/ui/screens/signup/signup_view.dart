import 'package:fixn_go/constants/app_colors.dart';
import 'package:fixn_go/gen/assets.gen.dart';
import 'package:fixn_go/ui/screens/signup/signup_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SignupView extends StatelessWidget {
  SignupView({super.key});

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignupViewModel>.reactive(
      viewModelBuilder: () => SignupViewModel(),
      builder: (context, vm, _) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                /// Top Image
                Stack(
                  children: [
                    Assets.images.login.image(),
                    const Positioned(
                      left: 80,
                      top: 35,
                      child: Text(
                        "Create Account",
                        style: TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _label("Full Name"),
                      inputField(
                        controller: nameController,
                        icon: Icons.person_outlined,
                        hint: "username",
                      ),
                      if (vm.nameError != null) _error(vm.nameError!),

                      _label("Email Address"),
                      _email(
                        controller: emailController,
                        icon: Icons.mail_outline,
                      ),
                      if (vm.emailError != null) _error(vm.emailError!),

                      _label("Password"),
                      _passwordInput(
                        controller: passwordController,
                        obscure: vm.obscurePassword,
                        onToggle: vm.togglePassword,
                      ),
                      if (vm.passwordError != null) _error(vm.passwordError!),

                      _label("Confirm Password"),
                      _passwordInput(
                        controller: confirmPasswordController,
                        obscure: vm.obscureConfirmPassword,
                        onToggle: vm.toggleConfirmPassword,
                      ),
                      if (vm.confirmPasswordError != null)
                        _error(vm.confirmPasswordError!),

                      const SizedBox(height: 36),

                      /// Sign Up Button
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
                          onPressed: vm.isBusy
                              ? null
                              : () => vm.signup(
                                  name: nameController.text,
                                  email: emailController.text,
                                  password: passwordController.text,
                                  confirmPassword:
                                      confirmPasswordController.text,
                                ),
                          child: vm.isBusy
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : const Text(
                                  "Sign Up",
                                  style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.white,
                                  ),
                                ),
                        ),
                      ),

                      const SizedBox(height: 32),

                      Center(
                        child: GestureDetector(
                          onTap: vm.goToLogin,
                          child: const Text(
                            "Already have an account? Login",
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _label(String text) => Padding(
    padding: const EdgeInsets.only(top: 20, bottom: 8),
    child: Text(text, style: const TextStyle(fontWeight: FontWeight.w600)),
  );

  Widget inputField({
    required TextEditingController controller,
    required IconData icon,
    required String hint,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Icon(icon),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _email({
    required TextEditingController controller,
    required IconData icon,
  }) => TextField(
    controller: controller,
    decoration: InputDecoration(
      hintText: "eg:mail@gmai.com",
      prefixIcon: Icon(icon),
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none,
      ),
    ),
  );

  Widget _passwordInput({
    required TextEditingController controller,
    required bool obscure,
    required VoidCallback onToggle,
  }) => TextField(
    controller: controller,
    obscureText: obscure,
    decoration: InputDecoration(
      hintText: "enter your password",
      prefixIcon: const Icon(Icons.lock_outline),
      suffixIcon: IconButton(
        icon: Icon(obscure ? Icons.visibility_off : Icons.visibility),
        onPressed: onToggle,
      ),
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none,
      ),
    ),
  );

  Widget _error(String text) => Padding(
    padding: const EdgeInsets.only(top: 6),
    child: Text(text, style: const TextStyle(color: Colors.red, fontSize: 13)),
  );
}
