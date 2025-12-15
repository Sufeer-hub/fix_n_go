import 'package:fix_n_go/ui/screens/login/login_model.dart';
import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';

import '../../tools/blur_background.dart';

class Loginview extends StatelessWidget {
  const Loginview({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<Loginviewmodel>.reactive(
      viewModelBuilder: () {
        return Loginviewmodel();
      },
      builder: (BuildContext context, Loginviewmodel viewModel, Widget? child) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              loginform(context, viewModel),
              if (viewModel.isBusy)
                Positioned.fill(
                  child: BlurBackground(
                    blur: 8, // adjust blur amount
                    child: Container(
                      color: Color(0x33000000),
                      child: const Center(child: CircularProgressIndicator()),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

Widget loginform(BuildContext context, Loginviewmodel viewModel) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: viewModel.formKey,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            spacing: 25,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Login',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 30),

              TextFormField(
                controller: viewModel.emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  return viewModel.validateEmail(value);
                },
              ),
              TextFormField(
                controller: viewModel.passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  return viewModel.validatePassword(value);
                },
              ),

              SizedBox(height: 30),

              // Login Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    bool status = await viewModel.login();
                    if (status) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Login Successful!')),
                      );
                    }
                  },
                  child: Text('Login'),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
