import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class EnvironmentConstant {
  static String apiBaseURL =
      dotenv.env['API_BASE_URL'] ?? "YOUR_DEFAULT_API_BASE_URL";
}
