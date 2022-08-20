import 'package:flutter_application_1/util/util.dart';

class LoginResponse {
  bool? status;
  String? message;
  String? token;

  LoginResponse({
    this.status = false,
    this.message = "",
    this.token = "",
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(status: json[KEY_STATUS], message: json[KEY_ERROR], token: json[KEY_TOKEN]);
  }
}
