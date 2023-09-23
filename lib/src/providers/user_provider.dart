import 'dart:convert';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/route_manager.dart';
import 'package:http/http.dart' as http;

import '../enviroments/Enviroment.dart';
import '../models/user.dart';
import '../models/response_api.dart';

class UserProvider {
  String url = "${Enviroment.API_URL}api/user";

  Future<http.Response> create(User user) async {
    final response = await http.post(
      Uri.parse('${url}/create'), // Replace with your API URL
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(user.toJson()),
    );
    if (response.statusCode == 201) {
      // Post request successful, you can handle the response here
      print('Post created successfully');
      return response;
    } else {
      // Post request failed, handle the error here
      print('Failed to create post. Status code: ${response.statusCode}');
      throw Exception('Failed to create post');
    }
  }

  Future<ResponseApi> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('${url}/login'), // Replace with your API URL
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {'email': email, 'password': password},
    );
    if (response.body == null) {
      Get.snackbar('Error', 'No se pudo ejecutar la operación');
      return ResponseApi();
    } else {
      return ResponseApi.fromJson(json.decode(response.body));
    }
  }
}
