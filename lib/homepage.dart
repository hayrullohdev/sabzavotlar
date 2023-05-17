import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:sabzavotlar/screens/mevalar.dart';
import 'package:sabzavotlar/category.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String listtitle = "Categoryalar";
  int _selectedIndex = 0;
  late List<Widget> widgetOptions = [
    const CategoryPage(),
    // const MevalarPage(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      // widgetOptions = widgetOptions;
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: Column(
          children: [
            Container(
              height: kToolbarHeight,
              decoration: const BoxDecoration(
                color: Color(0xffbce8a8),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
              child: Row(
                children: [
                  Image.asset("asset/lagotip.png"),
                  Text(
                    listtitle,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: IndexedStack(
                index: _selectedIndex,
                children: widgetOptions,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
