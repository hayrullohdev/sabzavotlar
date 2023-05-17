import 'package:flutter/material.dart';
import 'package:sabzavotlar/data/data.dart';

import 'details_page.dart';

class MevalarPage extends StatefulWidget {
  const MevalarPage({super.key});

  @override
  State<MevalarPage> createState() => _MevalarPageState();
}

class _MevalarPageState extends State<MevalarPage> {
  final List<Map> mevalist = mevalar;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: mevalist.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              onTap: () {
                setState(() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CopyPage(
                          subtitles: mevalist[index]["turi"],
                          titles: mevalist[index]["nomi"],
                          image: mevalist[index]["rasm"],
                          malumot: mevalist[index]["ma'lumot"],
                        ),
                      ));
                });
              },
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  mevalist[index]["rasm"],
                  height: 80,
                  width: 80,
                ),
              ),
              title: Text(
                mevalist[index]["nomi"],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                mevalist[index]["turi"],
              ),
            ),
          );
        },
      ),
    );
  }
}
