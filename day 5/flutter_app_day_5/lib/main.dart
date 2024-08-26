import 'package:flutter/material.dart';
import 'package:flutter_app_day_5/screen.dart';
import 'package:flutter_app_day_5/test.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(debugShowCheckedModeBanner: false, home: Test());
  }
}
