import 'package:fix_n_go/ui/screens/onboarding/onboarding_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

/* ---------------- ONBOARDING VIEW ---------------- */

class OnboardingView extends StatelessWidget {
  OnboardingView({super.key});

  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OnboardingViewModel>.reactive(
      viewModelBuilder: () => OnboardingViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          body: Column(
            children: [
              Expanded(
                child: PageView(
                  controller: _controller,
                  onPageChanged: model.updateIndex,
                  children: [
                    OnboardPage(
                      title: "Find trusted workers",
                      description: "Verified professionals are near you",
                      image: 'assets/images/workers.png',
                    ),
                    OnboardPage(
                      title: "Location based search ",
                      description:
                          "Instantly find workers available in your areas",
                      image: 'assets/images/map.jpeg',
                    ),
                    OnboardPage(
                      title: "Easy communication",
                      description: "call or chat directly and get the job done",
                      image: 'assets/images/map.jpeg',
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(20),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 42, 86, 44),
                    ),
                    onPressed: () => model.nextPage(_controller),
                    child: Text(
                      model.currentIndex == 2 ? "Get Started" : "Next",
                      style: const TextStyle(fontSize: 16),
                    ),
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

class OnboardPage extends StatelessWidget {
  final String title;
  final String description;
  final String image;

  const OnboardPage({
    super.key,
    required this.title,
    required this.description,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 36),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16, color: Colors.grey),
          ),
          SizedBox(height: 100),
          Image.asset(image, height: 200, width: 300, fit: BoxFit.fill),
          SizedBox(height: 40),
        ],
      ),
    );
  }
}
