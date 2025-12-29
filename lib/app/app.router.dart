// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:fixn_go/ui/screens/addprofession/addprofession_view.dart'
    as _i12;
import 'package:fixn_go/ui/screens/homescreen/homeview.dart' as _i4;
import 'package:fixn_go/ui/screens/login/loginview.dart' as _i3;
import 'package:fixn_go/ui/screens/main/main_view.dart' as _i5;
import 'package:fixn_go/ui/screens/onboarding/onboarding1/onboarding1_view.dart'
    as _i7;
import 'package:fixn_go/ui/screens/onboarding/onboarding2/onboarding2_view.dart'
    as _i8;
import 'package:fixn_go/ui/screens/onboarding/onboarding3/onboarding3_view.dart'
    as _i9;
import 'package:fixn_go/ui/screens/onboarding/onboarding4/onboarding4_view.dart'
    as _i10;
import 'package:fixn_go/ui/screens/signup/signup_view.dart' as _i6;
import 'package:fixn_go/ui/screens/splash/splashview.dart' as _i2;
import 'package:fixn_go/ui/screens/userprofile/userprofile_view.dart' as _i11;
import 'package:fixn_go/ui/screens/workerprofile/workerprofile_view.dart'
    as _i13;
import 'package:flutter/material.dart' as _i14;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i15;

class Routes {
  static const splashview = '/';

  static const loginView = '/login-view';

  static const homeView = '/home-view';

  static const mainView = '/main-view';

  static const signupView = '/signup-view';

  static const onboardingScreen1View = '/onboarding-screen1-view';

  static const onboardingScreen2View = '/onboarding-screen2-view';

  static const onboardingScreen3View = '/onboarding-screen3-view';

  static const onboardingScreen4View = '/onboarding-screen4-view';

  static const profileView = '/profile-view';

  static const addProfessionView = '/add-profession-view';

  static const workerProfileView = '/worker-profile-view';

  static const all = <String>{
    splashview,
    loginView,
    homeView,
    mainView,
    signupView,
    onboardingScreen1View,
    onboardingScreen2View,
    onboardingScreen3View,
    onboardingScreen4View,
    profileView,
    addProfessionView,
    workerProfileView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(Routes.splashview, page: _i2.Splashview),
    _i1.RouteDef(Routes.loginView, page: _i3.LoginView),
    _i1.RouteDef(Routes.homeView, page: _i4.HomeView),
    _i1.RouteDef(Routes.mainView, page: _i5.MainView),
    _i1.RouteDef(Routes.signupView, page: _i6.SignupView),
    _i1.RouteDef(Routes.onboardingScreen1View, page: _i7.OnboardingScreen1View),
    _i1.RouteDef(Routes.onboardingScreen2View, page: _i8.OnboardingScreen2View),
    _i1.RouteDef(Routes.onboardingScreen3View, page: _i9.OnboardingScreen3View),
    _i1.RouteDef(
      Routes.onboardingScreen4View,
      page: _i10.OnboardingScreen4View,
    ),
    _i1.RouteDef(Routes.profileView, page: _i11.ProfileView),
    _i1.RouteDef(Routes.addProfessionView, page: _i12.AddProfessionView),
    _i1.RouteDef(Routes.workerProfileView, page: _i13.WorkerProfileView),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.Splashview: (data) {
      final args = data.getArgs<SplashviewArguments>(
        orElse: () => const SplashviewArguments(),
      );
      return _i14.MaterialPageRoute<dynamic>(
        builder: (context) => _i2.Splashview(key: args.key),
        settings: data,
      );
    },
    _i3.LoginView: (data) {
      final args = data.getArgs<LoginViewArguments>(
        orElse: () => const LoginViewArguments(),
      );
      return _i14.MaterialPageRoute<dynamic>(
        builder: (context) => _i3.LoginView(key: args.key),
        settings: data,
      );
    },
    _i4.HomeView: (data) {
      final args = data.getArgs<HomeViewArguments>(
        orElse: () => const HomeViewArguments(),
      );
      return _i14.MaterialPageRoute<dynamic>(
        builder: (context) => _i4.HomeView(key: args.key),
        settings: data,
      );
    },
    _i5.MainView: (data) {
      final args = data.getArgs<MainViewArguments>(
        orElse: () => const MainViewArguments(),
      );
      return _i14.MaterialPageRoute<dynamic>(
        builder: (context) => _i5.MainView(key: args.key),
        settings: data,
      );
    },
    _i6.SignupView: (data) {
      final args = data.getArgs<SignupViewArguments>(
        orElse: () => const SignupViewArguments(),
      );
      return _i14.MaterialPageRoute<dynamic>(
        builder: (context) => _i6.SignupView(key: args.key),
        settings: data,
      );
    },
    _i7.OnboardingScreen1View: (data) {
      final args = data.getArgs<OnboardingScreen1ViewArguments>(
        orElse: () => const OnboardingScreen1ViewArguments(),
      );
      return _i14.MaterialPageRoute<dynamic>(
        builder: (context) => _i7.OnboardingScreen1View(key: args.key),
        settings: data,
      );
    },
    _i8.OnboardingScreen2View: (data) {
      final args = data.getArgs<OnboardingScreen2ViewArguments>(
        orElse: () => const OnboardingScreen2ViewArguments(),
      );
      return _i14.MaterialPageRoute<dynamic>(
        builder: (context) => _i8.OnboardingScreen2View(key: args.key),
        settings: data,
      );
    },
    _i9.OnboardingScreen3View: (data) {
      final args = data.getArgs<OnboardingScreen3ViewArguments>(
        orElse: () => const OnboardingScreen3ViewArguments(),
      );
      return _i14.MaterialPageRoute<dynamic>(
        builder: (context) => _i9.OnboardingScreen3View(key: args.key),
        settings: data,
      );
    },
    _i10.OnboardingScreen4View: (data) {
      final args = data.getArgs<OnboardingScreen4ViewArguments>(
        orElse: () => const OnboardingScreen4ViewArguments(),
      );
      return _i14.MaterialPageRoute<dynamic>(
        builder: (context) => _i10.OnboardingScreen4View(key: args.key),
        settings: data,
      );
    },
    _i11.ProfileView: (data) {
      final args = data.getArgs<ProfileViewArguments>(
        orElse: () => const ProfileViewArguments(),
      );
      return _i14.MaterialPageRoute<dynamic>(
        builder: (context) => _i11.ProfileView(key: args.key),
        settings: data,
      );
    },
    _i12.AddProfessionView: (data) {
      final args = data.getArgs<AddProfessionViewArguments>(
        orElse: () => const AddProfessionViewArguments(),
      );
      return _i14.MaterialPageRoute<dynamic>(
        builder: (context) => _i12.AddProfessionView(key: args.key),
        settings: data,
      );
    },
    _i13.WorkerProfileView: (data) {
      final args = data.getArgs<WorkerProfileViewArguments>(nullOk: false);
      return _i14.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i13.WorkerProfileView(key: args.key, workerUid: args.workerUid),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class SplashviewArguments {
  const SplashviewArguments({this.key});

  final _i14.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant SplashviewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class LoginViewArguments {
  const LoginViewArguments({this.key});

  final _i14.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant LoginViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class HomeViewArguments {
  const HomeViewArguments({this.key});

  final _i14.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant HomeViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class MainViewArguments {
  const MainViewArguments({this.key});

  final _i14.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant MainViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class SignupViewArguments {
  const SignupViewArguments({this.key});

  final _i14.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant SignupViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class OnboardingScreen1ViewArguments {
  const OnboardingScreen1ViewArguments({this.key});

  final _i14.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant OnboardingScreen1ViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class OnboardingScreen2ViewArguments {
  const OnboardingScreen2ViewArguments({this.key});

  final _i14.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant OnboardingScreen2ViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class OnboardingScreen3ViewArguments {
  const OnboardingScreen3ViewArguments({this.key});

  final _i14.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant OnboardingScreen3ViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class OnboardingScreen4ViewArguments {
  const OnboardingScreen4ViewArguments({this.key});

  final _i14.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant OnboardingScreen4ViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class ProfileViewArguments {
  const ProfileViewArguments({this.key});

  final _i14.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant ProfileViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class AddProfessionViewArguments {
  const AddProfessionViewArguments({this.key});

  final _i14.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant AddProfessionViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class WorkerProfileViewArguments {
  const WorkerProfileViewArguments({this.key, required this.workerUid});

  final _i14.Key? key;

  final String workerUid;

  @override
  String toString() {
    return '{"key": "$key", "workerUid": "$workerUid"}';
  }

  @override
  bool operator ==(covariant WorkerProfileViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.workerUid == workerUid;
  }

  @override
  int get hashCode {
    return key.hashCode ^ workerUid.hashCode;
  }
}

extension NavigatorStateExtension on _i15.NavigationService {
  Future<dynamic> navigateToSplashview({
    _i14.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.splashview,
      arguments: SplashviewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToLoginView({
    _i14.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.loginView,
      arguments: LoginViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToHomeView({
    _i14.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.homeView,
      arguments: HomeViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToMainView({
    _i14.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.mainView,
      arguments: MainViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToSignupView({
    _i14.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.signupView,
      arguments: SignupViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToOnboardingScreen1View({
    _i14.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.onboardingScreen1View,
      arguments: OnboardingScreen1ViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToOnboardingScreen2View({
    _i14.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.onboardingScreen2View,
      arguments: OnboardingScreen2ViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToOnboardingScreen3View({
    _i14.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.onboardingScreen3View,
      arguments: OnboardingScreen3ViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToOnboardingScreen4View({
    _i14.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.onboardingScreen4View,
      arguments: OnboardingScreen4ViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToProfileView({
    _i14.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.profileView,
      arguments: ProfileViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToAddProfessionView({
    _i14.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.addProfessionView,
      arguments: AddProfessionViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToWorkerProfileView({
    _i14.Key? key,
    required String workerUid,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.workerProfileView,
      arguments: WorkerProfileViewArguments(key: key, workerUid: workerUid),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithSplashview({
    _i14.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.splashview,
      arguments: SplashviewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithLoginView({
    _i14.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.loginView,
      arguments: LoginViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithHomeView({
    _i14.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.homeView,
      arguments: HomeViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithMainView({
    _i14.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.mainView,
      arguments: MainViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithSignupView({
    _i14.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.signupView,
      arguments: SignupViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithOnboardingScreen1View({
    _i14.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.onboardingScreen1View,
      arguments: OnboardingScreen1ViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithOnboardingScreen2View({
    _i14.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.onboardingScreen2View,
      arguments: OnboardingScreen2ViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithOnboardingScreen3View({
    _i14.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.onboardingScreen3View,
      arguments: OnboardingScreen3ViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithOnboardingScreen4View({
    _i14.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.onboardingScreen4View,
      arguments: OnboardingScreen4ViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithProfileView({
    _i14.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.profileView,
      arguments: ProfileViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithAddProfessionView({
    _i14.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.addProfessionView,
      arguments: AddProfessionViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithWorkerProfileView({
    _i14.Key? key,
    required String workerUid,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.workerProfileView,
      arguments: WorkerProfileViewArguments(key: key, workerUid: workerUid),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }
}
