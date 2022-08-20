import 'dart:convert';

import 'package:flutter_application_1/responses/login_response.dart';
import 'package:flutter_application_1/storage/session.dart';
import 'package:flutter_application_1/util/util.dart';
import 'package:http/http.dart' as http;

class Apiservices {
  Future<LoginResponse> loginUser(String username, String password) async {
    try {
      Map payload = {'username': username, 'password': password};
      var response =
          await doPostRequest('https://reqres.in/api/login', payload);

      if (isConnectionSuccesful(response.statusCode)) {
        var decodedBody = jsonDecode(response.body);
        var requestResponse = LoginResponse.fromJson(decodedBody);
        requestResponse.status = true;

        return requestResponse;
      } else {
        var decodedBody = jsonDecode(response.body);
        var requestResponse = LoginResponse.fromJson(decodedBody);
        requestResponse.status = false;
        return requestResponse;
      }
    } on Exception catch (e) {
      var requestResponse = LoginResponse();
      requestResponse.status = false;
      requestResponse.message = e.toString();
      return requestResponse;
    }
  }

  Future<LoginResponse> getUsers(String username, String password) async {
    try {
      var response = await doGetFullRequest('https://reqres.in/api/users');

      if (isConnectionSuccesful(response.statusCode)) {
        var decodedBody = jsonDecode(response.body)['data'];
        var requestResponse = LoginResponse.fromJson(decodedBody);
        requestResponse.status = true;
        return requestResponse;
      } else {
        var decodedBody = jsonDecode(response.body);
        var requestResponse = LoginResponse.fromJson(decodedBody);
        requestResponse.status = false;
        return requestResponse;
      }
    } on Exception catch (e) {
      var requestResponse = LoginResponse();
      requestResponse.status = false;
      requestResponse.message = e.toString();
      return requestResponse;
    }
  }

  bool isConnectionSuccesful(int statusCode) {
    return statusCode == 201 || statusCode == 200;
  }
}

Future<http.Response> doGetFullRequest(String endPoint) async {
  var header = await _getNormalHeader();
  return http.get(
    Uri.parse(endPoint),
    headers: header,
  );
}

Future<http.Response> doPostRequest(String endPoint, Map payload) async {
  var header = await _getNormalHeader();
  print(payload);
  return http.post(Uri.parse(endPoint), body: payload);
}

/// Get header for normal GET-POST requests.
Future<Map<String, String>> _getNormalHeader() async {
  var header = <String, String>{};
  header[KEY_CONTENT_TYPE] = "application/json";

  //print('token: $token');
  String? token = await getToken();

  if (token != null && token.isNotEmpty) {
    header[KEY_AUTHORIZATION] = "$KEY_BEARER $token";
  }
  return header;
}

Future<String?> getToken() {
  var session = SessionManager();
  return session.getToken();
}
