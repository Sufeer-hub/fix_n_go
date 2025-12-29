import 'package:fixn_go/app/app.router.dart';
import 'package:fixn_go/app/utils.dart';
import 'package:stacked/stacked.dart';

class SplashViewModel extends BaseViewModel {
  Future<void> init() async {
    await Future.delayed(const Duration(seconds: 2));

    if (userService.isLoggedIn()) {
      navigationService.replaceWith(Routes.mainView);
    } else {
      navigationService.replaceWith(Routes.onboardingScreen1View);
    }
  }
}
