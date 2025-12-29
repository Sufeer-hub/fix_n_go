import 'package:fixn_go/services/database_service.dart';
import 'package:fixn_go/services/userprofile_service.dart';
import 'package:fixn_go/services/worker_profile_service.dart';

import 'package:fixn_go/ui/screens/addprofession/addprofession_view.dart';

import 'package:fixn_go/ui/screens/homescreen/homeview.dart';
import 'package:fixn_go/ui/screens/localprofessionals/localprofessional_view.dart';
import 'package:fixn_go/ui/screens/login/loginview.dart';
import 'package:fixn_go/ui/screens/main/main_view.dart';
import 'package:fixn_go/ui/screens/onboarding/onboarding1/onboarding1_view.dart';
import 'package:fixn_go/ui/screens/onboarding/onboarding2/onboarding2_view.dart';
import 'package:fixn_go/ui/screens/onboarding/onboarding3/onboarding3_view.dart';
import 'package:fixn_go/ui/screens/onboarding/onboarding4/onboarding4_view.dart';
import 'package:fixn_go/ui/screens/signup/signup_view.dart';
import 'package:fixn_go/ui/screens/splash/splashview.dart';
import 'package:fixn_go/ui/screens/userprofile/userprofile_view.dart';
import 'package:fixn_go/ui/screens/workerprofile/workerprofile_view.dart';

import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../services/api_services.dart';
import '../services/user_service.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: Splashview, initial: true),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: HomeView),
    MaterialRoute(page: MainView),
    MaterialRoute(page: SignupView),
    MaterialRoute(page: OnboardingScreen1View),
    MaterialRoute(page: OnboardingScreen2View),
    MaterialRoute(page: OnboardingScreen3View),
    MaterialRoute(page: OnboardingScreen4View),
    MaterialRoute(page: ProfileView),
    MaterialRoute(page: AddProfessionView),
    MaterialRoute(page: WorkerProfileView),
  ],

  dependencies: [
    LazySingleton(classType: ApiService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: UserService),
    LazySingleton(classType: DatabaseService),
    LazySingleton(classType: WorkerProfileService),
    LazySingleton(classType: UserProfileService),
  ],
)
class AppSetUp {}
