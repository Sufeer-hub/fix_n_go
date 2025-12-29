import 'package:fixn_go/constants/assets.gen.dart';
import 'package:fixn_go/ui/screens/splash/splashviewmodel.dart';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class Splashview extends StatelessWidget {
  const Splashview({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashViewModel>.reactive(
      onDispose: (model) {},
      onViewModelReady: (model) {
        model.init();
      },
      viewModelBuilder: () {
        return SplashViewModel();
      },
      builder:
          (BuildContext context, SplashViewModel viewModel, Widget? child) {
            return Scaffold(
              backgroundColor: Colors.white,
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Assets.images.logo.image(
                      height: 350,
                      width: 500,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            );
          },
    );
  }
}
