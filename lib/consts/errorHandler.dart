import 'dart:convert';

import 'package:amazon_clone_flutter/consts/utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void httpErrorHandler(
    {required http.Response response,
    required BuildContext context,
    required VoidCallback onSuccess}) {
  switch (response.statusCode) {
    case 200:
      onSuccess();
      break;
    case 400:
      showToast(jsonDecode(response.body)['msg']);
      break;
    case 401:
      showToast(jsonDecode(response.body)['msg']);
      break;
    case 500:
      showToast(jsonDecode(response.body)['error']);
      break;
    default:
      showToast(response.body.toString());
  }
}
