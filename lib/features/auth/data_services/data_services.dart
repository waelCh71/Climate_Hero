import 'dart:convert';

import '../../../global/constante.dart';
import 'package:dio/dio.dart';

//Utulity: receive data from web and pass it to the repositry

class AuthWebServices {
  /*late Dio dio;
  AuthWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseURL,
      headers: {'Content-Type': 'application/json'},
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
    );
    dio = Dio(options);
  }*/

  Future<String> auth(email, password) async {
    var headers = {'Content-Type': 'application/json'};
    var data = json.encode({"email": email, "password": password});
    var dio = Dio();
    var response = await dio.request(
      '${baseURL}auth/signIn',
      options: Options(
        method: 'GET',
        headers: headers,
      ),
      data: data,
    );
    print("response ${response.statusCode}");
    if (response.statusCode == 200) {
      return response.data;
    } else if (response.statusCode == 401) {
      print(response.statusMessage);
      return "error $response";
    } else {
      return "error";
    }
  }

    Future<String> register(username,email, password) async {
    var headers = {'Content-Type': 'application/json'};
    var data = json.encode({"username": username,"email": email, "password": password});
    var dio = Dio();
    var response = await dio.request(
      '${baseURL}auth/signUp',
      options: Options(
        method: 'GET',
        headers: headers,
      ),
      data: data,
    );
    print("response ${response.statusCode}");
    if (response.statusCode == 200) {
      return response.data;
    } else if (response.statusCode == 401) {
      print(response.statusMessage);
      return "error $response";
    } else {
      return "error";
    }
  }

}
