import 'package:flutter/material.dart';

import 'data.dart';

class SabzavotlarPage extends StatefulWidget {
  const SabzavotlarPage({super.key});

  @override
  State<SabzavotlarPage> createState() => _SabzavotlarPageState();
}

class _SabzavotlarPageState extends State<SabzavotlarPage> {
  List<Map> list = lists;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0,
      //   title: const Text(
      //     "Sabzavotlar",
      //     style: TextStyle(
      //       color: Colors.black,
      //     ),
      //   ),
      //   backgroundColor: const Color(0xffbce8a8),
      // ),
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
            child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                return ListTile(
                  trailing: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        width: 2,
                        color: Colors.grey.shade200,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        list[index]["rasm"],
                        height: 50,
                        width: 50,
                      ),
                    ),
                  ),
                  title: Text(
                    list[index]["nomi"],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    list[index]["turi"],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
