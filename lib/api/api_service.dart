import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  // Future<dynamic> getLogin(String email, String password) async {
  //   try {
  //     http.Response response = await http.post(
  //         Uri.parse("https://reqres.in/api/login"),
  //         body: ({'email': email, 'password': password}));
  //     if (response.statusCode == 200 || response.statusCode == 400) {
  //       var data = jsonDecode(response.body.toString());
  //       print(data['token']);
  //       print("reponse status: ${response.statusCode}");
  //       return Login.fromJson(json.decode(response.body));
  //     } else {
  //       throw Exception('Failed to load data');
  //     }
  //   } catch (e) {
  //     throw Exception('Failed to load data');
  //   }
  // }
  final Dio _dio = Dio();
  Future<dynamic> getLogin(String email, String password) async {
    try {
      http.Response response = await http.post(
        Uri.parse("https://reqres.in/api/login"),
        body: {
          'email': email,
          'password': password,
        },
      );
      if (response.statusCode == 200 || response.statusCode == 400) {
        print("reponse status: ${response.body}");
        print("reponse status: ${response.statusCode}");
      } else {
        throw Exception('Failed to load data');
      }
      return response.body;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }
}
