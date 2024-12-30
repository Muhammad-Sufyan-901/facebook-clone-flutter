import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:flutter_boilerplate/app/configs/cache_manager.dart';
import 'package:flutter_boilerplate/app/constants/environment_constant.dart';

class HttpClient extends http.BaseClient {
  final http.Client _client = http.Client();

  Future<void> _refreshToken() async {
    try {
      final Uri url =
          Uri.parse('${EnvironmentConstant.apiBaseURL}/api/refresh');

      final http.Response response = await _client.get(url);

      if (response.statusCode == 200) {
        final responseJson = json.decode(response.body) as Map<String, dynamic>;
        final newToken = responseJson['token'] as String;

        await CacheManager.saveData('token', newToken);
      } else {
        throw Exception('Failed to refresh token: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Failed to refresh token: $error');
    }
  }

  Future<String> _getToken() async {
    try {
      final dynamic cachedToken = await CacheManager.getData('token');

      if (cachedToken == null || !await CacheManager.hasValidCache('token')) {
        await _refreshToken();

        final dynamic refreshedToken = await CacheManager.getData('token');

        if (refreshedToken == null) {
          throw Exception('Token is null even after refresh');
        }

        return refreshedToken as String;
      }

      return cachedToken as String;
    } catch (error) {
      throw Exception('Failed to get token: $error');
    }
  }

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    try {
      String token = await _getToken();

      request.headers['Authorization'] = 'Bearer $token';

      http.StreamedResponse response = await _client.send(request);

      if (response.statusCode == 401 || response.statusCode == 403) {
        await _refreshToken();

        token = await _getToken();

        request.headers['Authorization'] = 'Bearer $token';

        response = await _client.send(request);

        if (response.statusCode == 401 || response.statusCode == 403) {
          await CacheManager.removeData('token');

          throw Exception('Unauthorized or Forbidden request');
        }
      }

      final responseBody = await response.stream.bytesToString();

      final responseJson = json.decode(responseBody);

      if (responseJson['status'] == 'error' &&
          responseJson['message'] == 'user not found') {
        await CacheManager.removeData('token');

        throw Exception('Invalid token: user not found');
      }

      return http.StreamedResponse(
        Stream.value(utf8.encode(responseBody)),
        response.statusCode,
        headers: response.headers,
        reasonPhrase: response.reasonPhrase,
        isRedirect: response.isRedirect,
        persistentConnection: response.persistentConnection,
        contentLength: response.contentLength,
      );
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<http.Response> get(
    Uri url, {
    Map<String, String>? headers,
  }) {
    return _sendUnstreamed('GET', url, headers);
  }

  @override
  Future<http.Response> post(
    Uri url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) {
    return _sendUnstreamed('POST', url, headers, body, encoding);
  }

  @override
  Future<http.Response> patch(
    Uri url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) {
    return _sendUnstreamed('PATCH', url, headers, body, encoding);
  }

  @override
  Future<http.Response> put(
    Uri url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) {
    return _sendUnstreamed('PUT', url, headers, body, encoding);
  }

  @override
  Future<http.Response> delete(
    Uri url, {
    Object? body,
    Map<String, String>? headers,
    Encoding? encoding,
  }) {
    return _sendUnstreamed('DELETE', url, headers);
  }

  Future<http.Response> _sendUnstreamed(
    String method,
    Uri url,
    Map<String, String>? headers, [
    Object? body,
    Encoding? encoding,
  ]) async {
    try {
      final String token = await _getToken();

      final http.Request request = http.Request(method, url);

      request.headers['Authorization'] = 'Bearer $token';

      if (headers != null) {
        request.headers.addAll(headers);
      }

      if (body != null) {
        request.body = body is String ? body : jsonEncode(body);
        request.headers['Content-Type'] = 'application/json';
      }

      final http.StreamedResponse streamedResponse = await send(request);

      return http.Response.fromStream(streamedResponse);
    } catch (error) {
      throw Exception('Failed to send request: $error');
    }
  }
}
