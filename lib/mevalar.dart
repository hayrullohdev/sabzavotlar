import 'package:flutter/material.dart';
import 'package:sabzavotlar/data.dart';

import 'details_page.dart';

class MevalarPage extends StatefulWidget {
  const MevalarPage({super.key});

  @override
  State<MevalarPage> createState() => _MevalarPageState();
}

class _MevalarPageState extends State<MevalarPage> {
  final List<Map> _list = list;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 15.0, mainAxisSpacing: 15.0),
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
                      height: 85,
                      width: 85,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        _list[index]["nomi"],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Text(
                          _list[index]["turi"],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}