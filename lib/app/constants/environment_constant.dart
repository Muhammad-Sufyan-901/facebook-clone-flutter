import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class EnvironmentConstant {
  static String apiBaseURL =
      dotenv.env['API_BASE_URL'] ?? "YOUR_DEFAULT_API_BASE_URL";
  static String apiKey =
      dotenv.env['API_KEY'] ?? "YOUR_DEFAULT_API_KEY (SHOULD BE SECRET!)";
  static String apiImageURL =
      dotenv.env['API_IMAGE_URL'] ?? "YOUR_DEFAULT_API_IMAGE_URL";
}
