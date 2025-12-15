import 'dart:convert';

import 'package:fix_n_go/app/utils.dart';
import 'package:fix_n_go/models/RespProducts.dart';
import 'package:fix_n_go/models/User.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final baseurl = "https://freeapi.luminartechnohub.com";
  Future<User?> login({required String email, required String password}) async {
    Uri url = Uri.parse("$baseurl/login");
    var headers = {
      'accept': 'application/json',
      'Content-Type': 'application/json',
    };
    var body = jsonEncode({"email": "$email", "password": "$password"});
    try {
      // SmartDialog.showLoading();
      final response = await http.post(url, headers: headers, body: body);

      debugPrint("response:::${response.body}");
      //SmartDialog.dismiss();
      if (response.statusCode >= 200 && response.statusCode <= 299) {
        var json = jsonDecode(response.body);
        var user = User.fromJson(json);
        return user;
      }
    } catch (e) {
      print(e.toString());
      //SmartDialog.dismiss();
    }
  }

  Future<List<Data>?> fetch() async {
    Uri url = Uri.parse("$baseurl/products-all/");
    var headers = {
      "accept": "application/json",
      "Content-Type": "application/json",
      "Authorization": "Bearer ${await userservice.getToken()}",
    };
    try {
      final response = await http.get(url, headers: headers);
      if (response.statusCode >= 200 && response.statusCode <= 299) {
        var json = jsonDecode(response.body);
        var resp = RespProduct.fromJson(json);
        return resp.data;
      }
    } catch (e) {
      print(e);
    }
  }
}
