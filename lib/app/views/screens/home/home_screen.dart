import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app/views/layouts/main_layout.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MainLayout(
      child: Center(
        child: Text('Home Screen'),
      ),
    );
  }
}
