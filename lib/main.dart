import 'package:flutter/material.dart';
import 'package:student_manager/pages/home/home_page.dart';
import 'package:student_manager/injection.dart' as inject;

void main() async {
  await inject.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
