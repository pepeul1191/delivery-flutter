import 'dart:convert';
import 'package:http/http.dart' as http;

import '../enviroments/Enviroment.dart';
import '../models/user.dart';

class UserProvider {
  String url = "${Enviroment.API_URL}api/user";

  Future<void> create(User user) async {
    print(url);
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
    } else {
      // Post request failed, handle the error here
      print('Failed to create post. Status code: ${response.statusCode}');
      throw Exception('Failed to create post');
    }
  }

  Future<http.Response> createAlbum(User user) {
    return http.post(
      Uri.parse('${Enviroment.API_URL}/create'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(user.toJson()),
    );
  }
}
