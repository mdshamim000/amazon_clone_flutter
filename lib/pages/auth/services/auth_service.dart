import 'package:amazon_clone_flutter/consts/errorHandler.dart';
import 'package:amazon_clone_flutter/consts/global_var.dart';
import 'package:amazon_clone_flutter/consts/utils.dart';
import 'package:amazon_clone_flutter/models/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
      http.Response res = await http.post(Uri.parse('$uri/api/signup'),
          body: user.toJson(),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8'
          });
      httpErrorHandler(
          response: res,
          context: context,
          onSuccess: () {
            showSnackBar(
                context, "Account Crteated! \n Login with same account");
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

}
