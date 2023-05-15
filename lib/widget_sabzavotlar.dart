import 'package:flutter/material.dart';
import 'package:sabzavotlar/details_page.dart';
import 'package:sabzavotlar/data.dart';

class Widget_SabzavotlarPage extends StatefulWidget {
  const Widget_SabzavotlarPage({super.key});

  @override
  State<Widget_SabzavotlarPage> createState() => _Widget_SabzavotlarPageState();
}

class _Widget_SabzavotlarPageState extends State<Widget_SabzavotlarPage> {
  List<Map> list = lists;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 15.0, mainAxisSpacing: 15.0),
      itemCount: list.length,
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
                      width: 80,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        list[index]["nomi"],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        list[index]["turi"],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
