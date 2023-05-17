import 'package:flutter/material.dart';

class CopyPage extends StatefulWidget {
  final String image;
  final String titles;
  final String malumot;
  final String subtitles;

  const CopyPage({
    super.key,
    required this.titles,
    required this.image,
    required this.malumot,
    required this.subtitles,
  });

  @override
  State<CopyPage> createState() => _CopyPageState();
}

class _CopyPageState extends State<CopyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffbce8a8),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(widget.titles),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Image.asset(widget.image),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.titles,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      widget.subtitles,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 35,
                    ),
                    Text(widget.malumot),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
