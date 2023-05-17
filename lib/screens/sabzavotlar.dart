import 'package:flutter/material.dart';
import 'package:sabzavotlar/data/data.dart';

import 'details_page.dart';

class SabzavotlarPage extends StatefulWidget {
  const SabzavotlarPage({super.key});

  @override
  State<SabzavotlarPage> createState() => _SabzavotlarPageState();
}

class _SabzavotlarPageState extends State<SabzavotlarPage> {
  final List<Map> sabzavotlist = sabzavot;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: sabzavot.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              onTap: () {
                setState(() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CopyPage(
                          subtitles: sabzavot[index]["turi"],
                          titles: sabzavot[index]["nomi"],
                          image: sabzavot[index]["rasm"],
                          malumot: sabzavot[index]["ma'lumot"],
                        ),
                      ));
                });
              },
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  sabzavot[index]["rasm"],
                  height: 80,
                  width: 80,
                ),
              ),
              title: Text(
                sabzavot[index]["nomi"],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                sabzavot[index]["turi"],
              ),
            ),
          );
        },
      ),
    );
  }
}
