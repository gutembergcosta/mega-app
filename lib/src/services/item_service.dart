import 'dart:convert';
import 'dart:ffi';

import 'package:mega_app/models/api_response.dart';
import 'package:mega_app/models/auth.dart';
import 'package:mega_app/models/item.dart';
import 'package:http/http.dart' as http;
import 'package:mega_app/src/http_crud/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer' as developer;

Future<ApiResponse> login(Auth auth) async {
  ApiResponse apiResponse = ApiResponse();

  int statusCode = 0;

  try {
    final response = await http.post(Uri.parse(loginURL), headers: {
      'Accept': 'application/json'
    }, body: {
      'email': auth.email,
      'password': auth.senha,
    });

    print('login service - ${response.statusCode}');

    int statusCode = response.statusCode;

    if (statusCode == 200) {
      apiResponse.success = true;
      final data = jsonDecode(response.body);
      final userData = Auth.fromJson(data['userData']);
      print('userData');
      print(userData.id);
      apiResponse.data = userData;
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
  } catch (e) {
    if (statusCode == 500) {
      apiResponse.data = serverError;
    }
  }

  return apiResponse;
}

Future<ApiResponse> insert(String nome, String info, String texto) async {
  ApiResponse apiResponse = ApiResponse();

  try {
    final response = await http.post(Uri.parse(loginURL), headers: {
      'Accept': 'application/json'
    }, body: {
      'nome': nome,
      'info': info,
      'texto': texto,
    });

    print(response.statusCode);
    switch (response.statusCode) {
      case 200:
        apiResponse.data = Item.fromJson(jsonDecode(response.body));
        break;
      case 422:
        final errors = jsonDecode(response.body);
        apiResponse.error = errors;
        break;
      case 401:
        final errors = jsonDecode(response.body);
        apiResponse.error = errors;
        break;
      default:
        apiResponse.error = erro;
        break;
    }
  } catch (e) {
    apiResponse.error = serverError;
  }

  return apiResponse;
}

Future<ApiResponse> getById(String nome, String info, String texto) async {
  ApiResponse apiResponse = ApiResponse();

  try {
    final response = await http
        .get(Uri.parse(loginURL), headers: {'Accept': 'application/json'});

    switch (response.statusCode) {
      case 200:
        apiResponse.data = Item.fromJson(jsonDecode(response.body));
        break;
      case 422:
        final errors = jsonDecode(response.body);
        apiResponse.error = errors;
        break;
      default:
        apiResponse.error = erro;
        break;
    }
  } catch (e) {
    apiResponse.error = serverError;
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
