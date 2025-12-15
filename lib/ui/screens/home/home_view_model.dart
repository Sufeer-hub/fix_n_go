import 'package:fix_n_go/models/RespProducts.dart';
import 'package:fix_n_go/models/User.dart';
import 'package:flutter/cupertino.dart';

import 'package:stacked/stacked.dart';

import '../../../app/utils.dart';

class HomeViewModel extends BaseViewModel {
  User user;

  HomeViewModel(this.user);

  List<Data>? productlist = [];
  Future<bool> getdata() async {
    setBusy(true); // show loader
    try {
      productlist = await apiservice.fetch() ?? [];
      setBusy(false);
      notifyListeners();
    } catch (e) {
      debugPrint('Login error: $e');
      setBusy(false);
    } finally {
      setBusy(false); // hide loader
    }
    return false;
  }
}
