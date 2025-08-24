import 'dart:convert';
import 'dart:developer';

import 'package:d_method/d_method.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:toko_buah/model/auth/login.auth.model.dart';
import 'package:http/http.dart' as http;

class AuthService {
  // Ganti dengan URL API Anda yang sebenarnya.
  static final String apiUrl = "${dotenv.env["API_URL"]}/auth/login";

  static Future<AuthLoginResponseModel?> login(
    AuthLoginRequestModel req,
  ) async {
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json"},
        body: json.encode(req.toJson()),
      );
      log(response.body);
      final jsonResponse = json.decode(response.body);
      return AuthLoginResponseModel.fromJson(jsonResponse);
    } catch (e) {
      DMethod.log('Terjadi error: $e');
      return null;
    }
  }
}
