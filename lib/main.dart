import 'package:flutter/material.dart';
import 'package:myapp/page-1/intro.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scene(),
    );
  }
}
