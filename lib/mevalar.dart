import 'package:flutter/material.dart';
import 'package:sabzavotlar/copy_sabzavotlar.dart';
import 'package:sabzavotlar/data.dart';

class MevalarPage extends StatefulWidget {
  const MevalarPage({super.key});

  @override
  State<MevalarPage> createState() => _MevalarPageState();
}

class _MevalarPageState extends State<MevalarPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Map> _list = list;
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
                  "Mevalar",
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
                itemCount: _list.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CopyPage(
                                subtitles: _list[index]["turi"],
                                titles: _list[index]["nomi"],
                                image: _list[index]["rasm"],
                                malumot: _list[index]["ma'lumot"],
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
                              _list[index]["rasm"],
                              height: 80,
                              width: 50,
                            ),
                          ),
                          Text(
                            _list[index]["nomi"],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            _list[index]["turi"],
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
