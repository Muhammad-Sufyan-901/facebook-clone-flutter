import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTextThemes {
  static TextTheme get textTheme {
    return GoogleFonts.robotoTextTheme();
  }
}
