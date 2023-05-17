import 'package:flutter/material.dart';

import 'details_page.dart';

class ListlarPage extends StatefulWidget {
  final List<Map> data;
  const ListlarPage({super.key, required this.data});

  @override
  State<ListlarPage> createState() => _ListlarPageState();
}

class _ListlarPageState extends State<ListlarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffbce8a8),
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: widget.data.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              onTap: () {
                setState(() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CopyPage(
                          subtitles: widget.data[index]["turi"],
                          titles: widget.data[index]["nomi"],
                          image: widget.data[index]["rasm"],
                          malumot: widget.data[index]["ma'lumot"],
                        ),
                      ));
                });
              },
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  widget.data[index]["rasm"],
                  height: 80,
                  width: 80,
                ),
              ),
              title: Text(
                widget.data[index]["nomi"],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                widget.data[index]["turi"],
              ),
            ),
          );
        },
      ),
    );
  }
}
