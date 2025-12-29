import 'dart:convert';
import 'package:fixn_go/app/utils.dart';
import 'package:fixn_go/models/User.dart';
import 'package:fixn_go/models/resp_products.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final baseurl = "https://freeapi.luminartechnohub.com";

  //LogIn
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

  Future<List<Data>?> getproducts() async {
    Uri uri = Uri.parse('$baseurl/products-all/');

    var header = {
      'accept': 'application/json',
      'Authorization': 'Bearer ${await userService.getToken()}',
    };
    try {
      final response = await http.get(uri, headers: header);
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        var resp = RespProducts.fromJson(json);
        var products = resp.data;
        return products;
      }
    } catch (e) {
      print("Exception:::::$e");
    }
  }
}
