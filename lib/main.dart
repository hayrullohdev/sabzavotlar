import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:sabzavotlar/homepage.dart';
// ignore: unused_import
import 'package:sabzavotlar/screens/splesh.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mevalar va Sabzavotlar',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: "Open_Sans",
        primarySwatch: Colors.blue,
      ),
      home: const SpleshPage(),
    );
  }
}
