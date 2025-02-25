import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:facebook_clone/app/constants/environment_constant.dart';

class BaseService {
  final String baseUrl = EnvironmentConstant.apiBaseURL;
  final Map<String, String> headers;

  BaseService({
    this.headers = const {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    },
  });

  Future<dynamic> get(String endpoint) async {
    try {
      final Uri uri = Uri.parse('$baseUrl$endpoint');

      final http.Response response = await http.get(
        uri,
        headers: headers,
      );

      return _handleResponse(response);
    } catch (error) {
      throw Exception('Failed to perform GET request: $error');
    }
  }

  Future<dynamic> post(
    String endpoint, {
    dynamic body,
  }) async {
    try {
      final Uri uri = Uri.parse('$baseUrl$endpoint');

      final http.Response response = await http.post(
        uri,
        headers: headers,
        body: jsonEncode(body),
      );

      return _handleResponse(response);
    } catch (error) {
      throw Exception('Failed to perform POST request: $error');
    }
  }

  Future<dynamic> put(
    String endpoint, {
    dynamic body,
  }) async {
    try {
      final Uri uri = Uri.parse('$baseUrl$endpoint');

      final http.Response response = await http.put(
        uri,
        headers: headers,
        body: jsonEncode(body),
      );

      return _handleResponse(response);
    } catch (error) {
      throw Exception('Failed to perform PUT request: $error');
    }
  }

  Future<dynamic> patch(
    String endpoint, {
    dynamic body,
  }) async {
    try {
      final Uri uri = Uri.parse('$baseUrl$endpoint');

      final http.Response response = await http.patch(
        uri,
        headers: headers,
        body: jsonEncode(body),
      );

      return _handleResponse(response);
    } catch (error) {
      throw Exception('Failed to perform PATCH request: $error');
    }
  }

  Future<dynamic> delete(String endpoint) async {
    try {
      final Uri uri = Uri.parse('$baseUrl$endpoint');

      final response = await http.delete(
        uri,
        headers: headers,
      );

      return _handleResponse(response);
    } catch (error) {
      throw Exception('Failed to perform DELETE request: $error');
    }
  }

  dynamic _handleResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      if (response.body.isEmpty) return null;

      return jsonDecode(response.body);
    } else {
      throw Exception('HTTP Error: ${response.statusCode}, ${response.body}');
    }
  }

  void updateHeaders(Map<String, String> newHeaders) {
    headers.addAll(newHeaders);
  }

  String errorMessageHandler(dynamic error) {
    String errorMessage = "Terjadi kesalahan. Silakan coba lagi.";

    if (error is Exception) {
      final errorString = error.toString();

      // Cek apakah ada JSON dalam pesan error
      final regex = RegExp(r'\{.*\}');
      final match = regex.firstMatch(errorString);

      if (match != null) {
        try {
          final jsonError = jsonDecode(match.group(0)!);

          if (jsonError is Map<String, dynamic> &&
              jsonError.containsKey('message')) {
            errorMessage = jsonError['message'];
          }
        } catch (_) {}
      }
    }

    return errorMessage;
  }
}
