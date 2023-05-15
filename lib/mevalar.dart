import 'dart:ui';

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
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 15.0, mainAxisSpacing: 15.0),
      itemCount: _list.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
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
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    width: 2,
                    color: Colors.grey.shade200,
                  ),
                ),
                child: Stack(
                  children: [
                    Image.asset(
                      _list[index]["rasm"],
                      fit: BoxFit.fill,
                    ),
                    ClipRRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                        child: Container(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              _list[index]["rasm"],
                              height: 80,
                              width: 80,
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
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
