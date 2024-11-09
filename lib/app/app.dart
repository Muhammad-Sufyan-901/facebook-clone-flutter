import 'package:flutter/material.dart';
import 'package:accessibility_tools/accessibility_tools.dart';
import 'package:flutter_boilerplate/app/routes/app_routes.dart';

import 'package:flutter_boilerplate/app/themes/app_themes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Your Application Name',
      theme: AppThemes.theme,
      darkTheme: AppThemes.darkTheme,
      initialRoute: AppRoutes.initialRoute,
      onGenerateRoute: AppRoutes.onGenerateRoute,
      builder: (context, child) {
        return AccessibilityTools(
          child: child!,
        );
      },
    );
  }
}
