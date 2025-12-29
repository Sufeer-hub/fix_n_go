import 'package:fixn_go/constants/app_colors.dart';
import 'package:fixn_go/constants/assets.gen.dart';

import 'package:fixn_go/ui/screens/onboarding/onboarding4/onboarding4_view_model.dart';
import 'package:fixn_go/ui/widgets/onboardingwidgets.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class OnboardingScreen4View extends StatelessWidget {
  const OnboardingScreen4View({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OnboardingScreen4ViewModel>.reactive(
      viewModelBuilder: () => OnboardingScreen4ViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          backgroundColor: const Color(0xFFF9F9F7),
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  /// Skip
                  OnboardingSkipButton(onPressed: viewModel.onSkip),

                  SizedBox(height: 80),

                  /// Image
                  OnboardingImage(image: Assets.images.onboarding4),
                  SizedBox(height: 100),

                  /// Title
                  const OnboardingTitle(
                    title: "Easy booking &\ndirect contact",
                  ),

                  const SizedBox(height: 40),

                  /// Subtitle
                  const OnboardingSubtitle(
                    subtitle:
                        "Find the right expert, pick a time that works for you, and get the job done",
                  ),

                  const Spacer(),

                  /// Indicators + Next
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          _Indicator(),
                          _Indicator(),
                          _Indicator(),
                          _Indicator(isActive: true),
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
