import 'package:flutter/material.dart';

class SingleChallenge extends StatefulWidget {
  const SingleChallenge({super.key, required this.article});

  final article;
  @override
  State<SingleChallenge> createState() => _SingleChallengeState();
}

class _SingleChallengeState extends State<SingleChallenge> {
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
                  image: const DecorationImage(
                      image: AssetImage("assets/images/chall.png"),
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
                        " Publisher: ",
                        style: TextStyle(fontSize: 12),
                      ),
                      Text(
                        widget.article["publisher"] ?? "N/A",
                        style: const TextStyle(fontSize: 14),
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      const Icon(
                        Icons.timer_outlined,
                        size: 18,
                      ),
                      const Text(
                        " Date: ",
                        style: TextStyle(fontSize: 12),
                      ),
                      Text(
                        widget.article["date"] ?? "N/A",
                        style: const TextStyle(fontSize: 14),
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
                      widget.article["description"],
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
