import 'dart:convert';

import 'package:mega_app/models/api_response.dart';
import 'package:mega_app/models/item.dart';
import 'package:http/http.dart' as http;
import 'package:mega_app/src/http_crud/constant.dart';
import 'package:mega_app/src/services/auth_service.dart';

const baseUrlItem = "$baseURL/item";

Future<ApiResponse> listItems() async {
  ApiResponse apiResponse = ApiResponse();

  try {
    String token = await getUserToken();

    final response = await http.get(Uri.parse("$baseUrlItem/list"), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });

    print("statusCode list: ${response.statusCode}");

    switch (response.statusCode) {
      case 200:
        apiResponse.success = true;
        apiResponse.data =
            jsonDecode(response.body).map((p) => Item.fromJson(p)).toList();
        apiResponse.data as List<dynamic>;
        break;
      case 422:
        final errors = jsonDecode(response.body);
        apiResponse.error = errors;
        break;
      case 401:
        apiResponse.error = 'Unauthorized';
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

Future<ApiResponse> insertItem(item) async {
  print('insert item');
  ApiResponse apiResponse = ApiResponse();

  try {
    String token = await getUserToken();

    final response = await http.post(Uri.parse("$baseUrlItem/save"), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    }, body: {
      'nome': item.nome,
      'info': item.info,
      'texto': item.texto
    });

    print("statusCode post: ${response.statusCode}");

    if (response.statusCode == 200) {
      apiResponse.success = true;
      apiResponse.data = jsonDecode(response.body);
      print(apiResponse.data);
    }

    if (response.statusCode == 422) {
      final errors = jsonDecode(response.body);
      apiResponse.success = false;
      apiResponse.error = errors;
    }
  } catch (e) {
    print('error');
    apiResponse.error = serverError;
  }

  return apiResponse;
}

Future<ApiResponse> updateItem(item) async {
  ApiResponse apiResponse = ApiResponse();

  try {
    String token = await getUserToken();

    final response = await http.put(Uri.parse("$baseUrlItem/save/${item.id}"),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        },
        body: {
          'nome': item.nome,
          'info': item.info,
          'texto': item.texto
        });

    print("statusCode put: ${response.statusCode}");
    if (response.statusCode == 200) {
      apiResponse.success = true;
      apiResponse.data = jsonDecode(response.body);
    }

    if (response.statusCode == 422) {
      final errors = jsonDecode(response.body);
      apiResponse.success = false;
      apiResponse.error = errors;
    }
  } catch (e) {
    apiResponse.error = serverError;
  }

  return apiResponse;
}

Future<ApiResponse> deleteItem(id) async {
  ApiResponse apiResponse = ApiResponse();

  try {
    String token = await getUserToken();

    final response = await http.delete(Uri.parse("$baseUrlItem/delete/$id"),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        });

    print("statusCode delete: ${response.statusCode}");
    if (response.statusCode == 200) {
      apiResponse.success = true;
      apiResponse.data = jsonDecode(response.body);

      print(apiResponse.data);
    }

    if (response.statusCode == 422) {
      final errors = jsonDecode(response.body);
      apiResponse.success = false;
      apiResponse.error = errors;
    }
  } catch (e) {
    apiResponse.error = serverError;
  }

  return apiResponse;
}

Future<ApiResponse> getItemById(id) async {
  ApiResponse apiResponse = ApiResponse();

  try {
    String token = await getUserToken();

    final response = await http.get(Uri.parse("$baseUrlItem/$id"), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });

    if (response.statusCode == 200) {
      apiResponse.success = true;
      apiResponse.data = jsonDecode(response.body);
    }

    if (response.statusCode == 422) {
      final errors = jsonDecode(response.body);
      apiResponse.success = false;
      apiResponse.error = errors;
    }
  } catch (e) {
    apiResponse.error = serverError;
  }

  return apiResponse;
}
