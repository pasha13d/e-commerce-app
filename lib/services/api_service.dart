import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_ecom_app/config.dart';
import 'package:my_ecom_app/models/login_request_model.dart';
import 'package:my_ecom_app/models/register_request_model.dart';
import 'package:my_ecom_app/models/register_response_model.dart';
class APIService {
  static var client = http.Client();

  static Future<bool> login(LoginRequestModel model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(Config.apiURL, Config.loginAPI);
    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );

    if(response.statusCode == 200){
      /// Store info into shared

      return true;
    } else {
      return false;
    }
  }

  static Future<RegisterResponseModel> register(RegisterRequestModel model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(Config.apiURL, Config.registerAPI);
    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );

    return registerResponseModel(response.body);
  }
}