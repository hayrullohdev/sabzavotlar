import 'dart:async';

import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:sabzavotlar/category.dart';
// ignore: unused_import
import 'package:sabzavotlar/homepage.dart';


class SpleshPage extends StatefulWidget {
  const SpleshPage({super.key});

  @override
  State<SpleshPage> createState() => _SpleshPageState();
}

class _SpleshPageState extends State<SpleshPage> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: const Color(0xffbce8a8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 250,
              width: 250,
              child: Center(
                child: Image.asset("asset/lagotip.png"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
