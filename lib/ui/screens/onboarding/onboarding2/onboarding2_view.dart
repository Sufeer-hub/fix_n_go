import 'package:fixn_go/constants/app_colors.dart';
import 'package:fixn_go/constants/assets.gen.dart';
import 'package:fixn_go/ui/screens/onboarding/onboarding2/onboarding2_view_model.dart';
import 'package:fixn_go/ui/widgets/onboardingwidgets.dart';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class OnboardingScreen2View extends StatelessWidget {
  const OnboardingScreen2View({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OnboardingScreen2ViewModel>.reactive(
      viewModelBuilder: () => OnboardingScreen2ViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          backgroundColor: const Color(0xFFF9F9F7),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  /// Skip
                  OnboardingSkipButton(onPressed: viewModel.onSkip),

                  const SizedBox(height: 80),

                  /// Image
                  OnboardingImage(image: Assets.images.onboarding2),

                  const SizedBox(height: 100),

                  /// Title
                  const OnboardingTitle(title: "Multiple service\ncategories"),

                  const SizedBox(height: 40),

                  /// Subtitle
                  const OnboardingSubtitle(
                    subtitle:
                        "From leaking taps to flickering lights, find\nverified experts for every corner of your home.",
                  ),

                  const Spacer(),

                  /// Indicators + Next
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          _Indicator(),
                          _Indicator(isActive: true),
                          _Indicator(),
                          _Indicator(),
                        ],
                      ),

                      OnboardingNextButton(onPressed: viewModel.onNext),
                    ],
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _Indicator extends StatelessWidget {
  final bool isActive;
  const _Indicator({this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 6),
      height: 8,
      width: isActive ? 24 : 8,
      decoration: BoxDecoration(
        color: isActive ? Palette.onboardingyellow : Palette.onboardinggrey,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
