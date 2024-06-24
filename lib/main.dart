import 'package:flutter/material.dart';
import 'package:ict7b/Pages/Homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ICT7 B',
      theme: ThemeData.dark(),
      home: const HomePage(),
    );
  }
}

