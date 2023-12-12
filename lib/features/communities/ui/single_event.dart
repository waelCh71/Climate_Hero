import 'package:flutter/material.dart';

class SingleEvent extends StatefulWidget {
  const SingleEvent({super.key, required this.article});

  final article;
  @override
  State<SingleEvent> createState() => _SingleEventState();
}

class _SingleEventState extends State<SingleEvent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.green),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.25,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: NetworkImage(widget.article["image"]),
                      fit: BoxFit.cover)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 15, right: 13),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.person_outlined,
                        size: 18,
                      ),
                      const Text(
                        " Orgenized: ",
                        style: TextStyle(fontSize: 12),
                      ),
                      Text(
                        widget.article["publisher"] ?? "N/A",
                        style: const TextStyle(fontSize: 14),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const Icon(
                        Icons.timer_outlined,
                        size: 10,
                      ),
                      const Text(
                        " Date: ",
                        style: TextStyle(fontSize: 12),
                      ),
                      Text(
                        widget.article["dateDeb"] ?? "N/A",
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      widget.article["description"] ?? "N/A",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
