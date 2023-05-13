import 'package:flutter/material.dart';
import 'package:sabzavotlar/mevalar.dart';
import 'package:sabzavotlar/widget_sabzavotlar.dart';

class SabzavotlarPage extends StatefulWidget {
  const SabzavotlarPage({super.key});

  @override
  State<SabzavotlarPage> createState() => _SabzavotlarPageState();
}

class _SabzavotlarPageState extends State<SabzavotlarPage> {
  String listtitle = "Sabzavotlar";
  int _selectedIndex = 0;
  late List<Widget> widgetOptions = [
    const Widget_SabzavotlarPage(),
    const MevalarPage(),
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
        bottomNavigationBar: NavigationBar(
          selectedIndex: _selectedIndex,
          onDestinationSelected: (index) {
            setState(() {
              _selectedIndex = index;
              if (_selectedIndex == 0) {
                listtitle = "Sabzavotlar";
              } else {
                listtitle = "Mevalar";
              }
            });
          },
          destinations: const [
            NavigationDestination(
              selectedIcon: Icon(
                Icons.energy_savings_leaf_sharp,
                color: Colors.green,
                size: 30,
              ),
              icon: Icon(
                Icons.energy_savings_leaf_sharp,
                color: Colors.grey,
                size: 25,
              ),
              label: "",
            ),
            NavigationDestination(
              selectedIcon: Icon(
                Icons.apple,
                color: Colors.green,
                size: 30,
              ),
              icon: Icon(
                Icons.apple,
                color: Colors.grey,
                size: 25,
              ),
              label: "",
            ),
          ],
        ),
      ),
    );
  }
}
