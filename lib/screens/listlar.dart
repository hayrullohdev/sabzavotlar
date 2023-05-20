import 'package:flutter/material.dart';
import 'package:sabzavotlar/screens/details_page.dart';

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
          return GestureDetector(
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
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            widget.data[index]["rasm"],
                            fit: BoxFit.cover,
                            height: 65,
                            width: 65,
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.data[index]["nomi"],
                            style: const TextStyle(fontSize: 17),
                          ),
                          Text(
                            widget.data[index]["turi"],
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 13),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Icon(
                          Icons.chevron_right,
                          color: Colors.grey.shade300,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        height: 1,
                        width: 265,
                        color: Colors.grey.shade300,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
