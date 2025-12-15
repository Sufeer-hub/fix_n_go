import 'package:fix_n_go/services/database_service.dart';
import 'package:fix_n_go/ui/screens/home/home_view.dart';
import 'package:fix_n_go/ui/screens/login/login.dart';
import 'package:fix_n_go/ui/screens/onboarding/onboarding_screen.dart';
import 'package:fix_n_go/ui/screens/splash/splashview.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../services/api_services.dart';
import '../services/user_service.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: Splashview, initial: true),
    MaterialRoute(page: OnboardingView),
    MaterialRoute(page: Loginview),
    MaterialRoute(page: Homeview),
  ],
  dependencies: [
    LazySingleton(classType: ApiService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: UserService),
    LazySingleton(classType: DatabaseService),
  ],
)
class AppSetUp {}
