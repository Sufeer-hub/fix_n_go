import 'package:stacked/stacked.dart';
import 'package:fixn_go/app/app.locator.dart';
import 'package:fixn_go/services/user_service.dart';

class HomeViewModel extends BaseViewModel {
  final _userService = locator<UserService>();

  String userName = "User";

  void initialise() {
    userName = _userService.getUserName();
    notifyListeners();
  }

  String get avatarLetter =>
      userName.isNotEmpty ? userName[0].toUpperCase() : "U";
}
