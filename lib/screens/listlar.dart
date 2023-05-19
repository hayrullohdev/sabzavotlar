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
      body: ListView.separated(
        separatorBuilder: (context, index) {
          return const Divider();
        },
        itemCount: widget.data.length,
        itemBuilder: (context, index) {
          return ListTile(
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
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                widget.data[index]["rasm"],
                fit: BoxFit.cover,
                height: 50,
                width: 50,
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
          );
        },
      ),
    );
  }
}
