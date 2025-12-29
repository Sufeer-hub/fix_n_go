import 'package:fixn_go/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class OnboardingScreen1ViewModel extends BaseViewModel {
  final _navigationService = NavigationService();

  void onNext() {
    _navigationService.navigateToOnboardingScreen2View();
  }

  void onSkip() {
    _navigationService.replaceWithLoginView();
  }
}
