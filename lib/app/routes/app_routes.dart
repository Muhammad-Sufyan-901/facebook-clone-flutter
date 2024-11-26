import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_boilerplate/app/views/screens/initial_screen.dart';
import 'package:flutter_boilerplate/app/views/screens/not_found_screen.dart';
import 'package:flutter_boilerplate/app/views/screens/auth/forgot_password_screen.dart';
import 'package:flutter_boilerplate/app/views/screens/auth/sign_in_screen.dart';
import 'package:flutter_boilerplate/app/views/screens/auth/sign_up_screen.dart';
import 'package:flutter_boilerplate/app/views/screens/home/home_screen.dart';

abstract class AppRoutes {
  static const String initialRoute = '/';
  static const String signInRoute = '/sign_in';
  static const String signUpRoute = '/sign_up';
  static const String forgotPasswordRoute = '/forgot_password';
  static const String homeRoute = '/home';
  static const String profileRoute = '/profile';
  // Add your routes here

  static List<String> get routes => [
        initialRoute,
        signInRoute,
        signUpRoute,
        forgotPasswordRoute,
        homeRoute,
        profileRoute,
        // Add your routes here
      ];

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case initialRoute:
        return getScreen(
          settings: settings,
          screen: const InitialScreen(),
        );
      case signInRoute:
        return getScreen(
          settings: settings,
          screen: const SignInScreen(),
        );
      case signUpRoute:
        return getScreen(
          settings: settings,
          screen: const SignUpScreen(),
        );
      case forgotPasswordRoute:
        return getScreen(
          settings: settings,
          screen: const ForgotPasswordScreen(),
        );
      case homeRoute:
        return getScreen(
          settings: settings,
          screen: const HomeScreen(),
        );
      case profileRoute:
        return getScreen(
          settings: settings,
          screen: const Scaffold(),
        );
      default:
        return getScreen(
          settings: settings,
          screen: const NotFoundScreen(),
        );
    }
  }

  static PageRoute<dynamic> getScreen({
    required RouteSettings settings,
    required Widget screen,
  }) {
    if (Platform.isIOS) {
      return CupertinoPageRoute(
        settings: settings,
        builder: (BuildContext context) => screen,
      );
    } else {
      return MaterialPageRoute(
        settings: settings,
        builder: (BuildContext context) => screen,
      );
    }
  }
}
