import 'package:fixn_go/app/app.locator.dart';
import 'package:fixn_go/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class OnboardingScreen3ViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  void onNext() {
    _navigationService.navigateToOnboardingScreen4View();
  }

  void onSkip() {
    _navigationService.navigateToLoginView();
  }
}
