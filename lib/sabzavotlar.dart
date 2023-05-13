import 'package:flutter/material.dart';
import 'package:sabzavotlar/copy_sabzavotlar.dart';

import 'data.dart';

class SabzavotlarPage extends StatefulWidget {
  const SabzavotlarPage({super.key});

  @override
  State<SabzavotlarPage> createState() => _SabzavotlarPageState();
}

class _SabzavotlarPageState extends State<SabzavotlarPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Map> list = lists;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                const Text(
                  "Sabzavotlar",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15.0,
                    mainAxisSpacing: 15.0),
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CopyPage(
                                subtitles: list[index]["turi"],
                                titles: list[index]["nomi"],
                                image: list[index]["rasm"],
                                malumot: list[index]["ma'lumot"],
                              ),
                            ));
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          width: 2,
                          color: Colors.grey.shade200,
                        ),
                      ),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              list[index]["rasm"],
                              height: 80,
                              width: 50,
                            ),
                          ),
                          Text(
                            list[index]["nomi"],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            list[index]["turi"],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: [
          GestureDetector(
            onTap: () {
              // if (_selectedIndex = _selectedIndex.) {
              //   Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //         builder: (context) => const SabzavotlarPage(),
              //       ));
              // }
            },
            child: const NavigationDestination(
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
          ),
          GestureDetector(
            onTap: () {
              // if (bar = true) {
              //   Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //         builder: (context) => const MevalarPage(),
              //       ));
              // }
            },
            child: const NavigationDestination(
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
          ),
        ],
      ),
    );
  }
}
