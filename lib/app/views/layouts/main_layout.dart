import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({
    super.key,
    required this.child,
    this.showAppBar = true,
    this.showBottomNavigationBar = true,
    this.showDrawer = true,
    this.showBackButton = false,
    this.title,
    this.subtitle,
    this.appBarTitle,
  });

  final Widget child;
  final bool? showAppBar;
  final bool? showBottomNavigationBar;
  final bool? showDrawer;
  final bool? showBackButton;
  final String? title;
  final String? subtitle;
  final String? appBarTitle;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Theme.of(context).brightness == Brightness.dark
            ? Brightness.dark
            : Brightness.light,
        statusBarIconBrightness: Theme.of(context).brightness == Brightness.dark
            ? Brightness.light
            : Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Center(
          child: child,
        ),
      ),
    );
  }
}
