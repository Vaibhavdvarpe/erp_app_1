// ignore: depend_on_referenced_packages
import 'package:erp_app/bloc/user_logout_bloc/user_logout_model.dart';
import 'package:erp_app/pages_erp/change_password.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../bloc/change_pass_bloc/change_pass_model.dart';
import '../bloc/user_auth_bloc/authmodel.dart';
import '../bloc/user_verification_bloc/check_user_model.dart';
import '../config/constant.dart';

class ApiService {
  final box = GetStorage();
  checkUser(username, clientcode) async {
    String uri = "${Constants.host}${Constants.getUserVerification}";

    final response = await http.post(Uri.parse(uri), body: {
      "username": username,
      //  "password":password.toString(),
      "clientcode": clientcode,
    });
    if (response.statusCode == 200) {
      debugPrint(response.statusCode.toString());
      return CheckUserModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Error");
    }
  }

  authenticateUser(username, password, clientcode) async {
    String uri = "${Constants.host}${Constants.authenticateuser}";

    final response = await http.post(Uri.parse(uri), body: {
      "username": username,
      "clientcode": clientcode,
      "password": password,
      'IFCM': '',
      'AFCM': '',
      'IDeviceType': '',
      'ADeviceType': 'Android'
    });
    if (response.statusCode == 200) {
      debugPrint(response.statusCode.toString());
      return userAuthModelFromJson(response.body);
    } else {
      throw Exception("Error");
    }
  }

  changePass(token, currentpass, newpass) async {
    String uri = "${Constants.host}${Constants.resetPassword}";
    // var header;
    // header['Authorization']='Bearer Token $token';
    final response = await http.post(Uri.parse(uri), headers: {
      'Authorization': 'Bearer $token',
    }, body: {
      "CurrentPassword": "Techno@97241",
      "NewPassword": "Techno@97241",
      "UserName": "turboadmin",
      "ClientCode": "KDilip"

//     {
//     "CurrentPassword":"1234",
//     "NewPassword":"123",
//     "UserName":"kishor",
//     "ClientCode":"DEMO"
// }
    });
    if (response.statusCode == 200) {
      debugPrint(response.statusCode.toString());
      return changePassModelFromJson(response.body);
    } else {
      return Exception("Error");
    }
  }

  logout(token) async {
    String uri = "${Constants.host}${Constants.userlogout}";
    final response = await http.post(Uri.parse(uri), headers: {
      'Authorization': 'Bearer $token',
    }, body: {
      'DeviceType': ''
    });
    if (response.statusCode == 200) {
      // debugPrint(response.statusCode.toString());
      return LogoutModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Error");
    }
  }
}
