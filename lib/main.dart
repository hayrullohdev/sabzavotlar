import 'package:flutter/material.dart';
import 'package:sabzavotlar/sabzavotlar.dart';
// ignore: unused_import
import 'package:sabzavotlar/splesh.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SabzavotlarPage(),
    );
  }
}
