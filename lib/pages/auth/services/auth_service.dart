import 'dart:convert';
import 'dart:io';

import 'package:amazon_clone_flutter/consts/errorHandler.dart';
import 'package:amazon_clone_flutter/consts/global_var.dart';
import 'package:amazon_clone_flutter/consts/utils.dart';
import 'package:amazon_clone_flutter/models/user.dart';
import 'package:amazon_clone_flutter/pages/auth/screens/authscreen.dart';
import 'package:amazon_clone_flutter/providers/user_provider.dart';
import 'package:amazon_clone_flutter/res/widgets/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  void signUp({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      User user = User(
          id: '',
          name: name,
          email: email,
          password: password,
          address: '',
          type: '',
          token: '');

      http.Response res = await http.post(
      Uri.parse((Platform.isAndroid)
              ? '$uriAndroid/api/signup'
              : '$uri/api/signup'),
          body: user.toJson(),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8'
          });
      httpErrorHandler(
          response: res,
          context: context,
          onSuccess: () {
            showToast("Account Crteated!\n Login Now..");
          });
    } catch (e) {
      showToast(e.toString());
    }
  }

  void signIn({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      http.Response res = await http.post(
          Uri.parse((Platform.isAndroid)
              ? '$uriAndroid/api/signin'
              : '$uri/api/signin'),
          body: jsonEncode({"email": email, "password": password}),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8'
          });
      httpErrorHandler(
          response: res,
          context: context,
          onSuccess: () async {
            showToast("Signed In...");
            Provider.of<UserProvider>(context, listen: false).setUser(res.body);
            SharedPreferences prefs = await SharedPreferences.getInstance();

            await prefs.setString(
                'x-auth-token', jsonDecode(res.body)['token']);

            Navigator.pushNamedAndRemoveUntil(
                context, BottomBar.routeName, (route) => false);
          });
    } catch (e) {
      showToast(e.toString());
    }
  }

  void getUserData({
    required BuildContext context,
  }) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.get('x-auth-token') as String?;

      if (token == null) {
        prefs.setString('x-auth-token', '');
       
      }

      var tokenRes = await http.post(
          Uri.parse((Platform.isAndroid)
              ? '$uriAndroid/tokenIsValid'
              : '$uri/tokenIsValid'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': token!
          });

      var response = jsonDecode(tokenRes.body);
      if (response == true) {
        http.Response userRes = await http.get(
            Uri.parse((Platform.isAndroid) ? '$uriAndroid/' : '$uri/'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'x-auth-token': token
            });
        httpErrorHandler(
            response: userRes,
            context: context,
            onSuccess: () async {
              var userProvider =
                  Provider.of<UserProvider>(context, listen: false);
              userProvider.setUser(userRes.body);
            });
      }
    } catch (e) {
      showToast(e.toString());
       Navigator.pushNamedAndRemoveUntil(
        context, AuthScreen.routeName, (route) => false);
    }
  }
}
