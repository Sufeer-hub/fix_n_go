import 'package:fix_n_go/app/app.router.dart';
import 'package:fix_n_go/app/utils.dart';
import 'package:stacked/stacked.dart';

class SplashViewModel extends BaseViewModel {
  init() async {
    var user = await userservice.getUser() ?? null;
    // code to navigate to  next screen
    Future.delayed(Duration(seconds: 3), () {
      user == null
          ? navigationService.navigateTo(Routes.onboardingView)
          : navigationService.navigateTo(Routes.onboardingView);
    });
  }
}
