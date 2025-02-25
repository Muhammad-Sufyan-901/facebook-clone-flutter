import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'package:facebook_clone/app/configs/cache_manager.dart';
import 'package:facebook_clone/app/configs/http_client.dart';
import 'package:facebook_clone/app/constants/environment_constant.dart';

class AuthenticationMiddleware extends StatelessWidget {
  AuthenticationMiddleware({
    super.key,
    required this.successChild,
    required this.errorChild,
    this.onSuccess,
    this.onError,
  });

  final Widget successChild;
  final Widget errorChild;
  final VoidCallback? onSuccess;
  final VoidCallback? onError;

  final HttpClient _httpClient = HttpClient();

  Future<bool> checkToken() async {
    try {
      final bool hasValidToken = await CacheManager.hasValidCache('token');
      if (hasValidToken) {
        final String? token = await CacheManager.getData('token');

        if (token != null) {
          return await _validateToken(token);
        }
      }

      return false;
    } catch (error) {
      debugPrint('Error in checkToken: $error');

      return false;
    }
  }

  Future<bool> _validateToken(String token) async {
    try {
      final Uri url = Uri.parse(
        '${EnvironmentConstant.apiBaseURL}/api/validate-token',
      );
      final Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };

      final http.Response response = await _httpClient.get(
        url,
        headers: headers,
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body) as Map<String, dynamic>;

        if (data['status'] != 'error' || data['message'] != 'User not found') {
          await CacheManager.saveData('token', token);

          return true;
        }
      }

      await CacheManager.removeData('token');

      return false;
    } catch (error) {
      debugPrint('Error in _validateToken: $error');

      await CacheManager.removeData('token');

      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: checkToken(),
      builder: (
        BuildContext context,
        AsyncSnapshot<bool> snapshot,
      ) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (snapshot.hasData && snapshot.data!) {
          onSuccess?.call();

          return successChild;
        }

        onError?.call();

        return errorChild;
      },
    );
  }
}
