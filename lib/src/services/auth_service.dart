import 'dart:convert';

import 'package:mega_app/models/api_response.dart';
import 'package:mega_app/models/auth.dart';
import 'package:http/http.dart' as http;
import 'package:mega_app/src/views/http_crud/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<ApiResponse> login(Auth auth) async {
  ApiResponse apiResponse = ApiResponse();

  print('login()');
  var statusCode = 0;

  final response = await http.post(Uri.parse(loginURL), headers: {
    'Accept': 'application/json'
  }, body: {
    'email': auth.email,
    'password': auth.senha,
  });

  statusCode = response.statusCode;

  print('statusCode: ${statusCode}');

  if (statusCode == 200) {

    apiResponse.success = true;
    var userData = jsonDecode(response.body);    
    var userAuth = Auth.fromJson(userData);

    apiResponse.data = userAuth;
  }

  if (statusCode == 422) {
    final errors = jsonDecode(response.body);
    apiResponse.success = false;
    apiResponse.error = errors;
  }

  if (statusCode == 401) {
    final errors = jsonDecode(response.body);
    apiResponse.success = false;
    apiResponse.error = errors['msg'];
  }
  

  return apiResponse;
}


Future<String> getUserToken() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getString('token') ?? '';
}

Future<int> getUserId() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getInt('userId') ?? 0;
}

Future<bool> logout() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return await pref.remove('token');
}
