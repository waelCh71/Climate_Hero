import 'package:climate_hero/features/challenge/ui/single_challenges.dart';
import 'package:climate_hero/global/ui/image_container.dart';
import 'package:climate_hero/state%20management%20chalenge/bloc/challenge_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Challenges extends StatefulWidget {
  const Challenges({super.key});

  @override
  State<Challenges> createState() => _ChallengesState();
}

class _ChallengesState extends State<Challenges> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ChallengeBloc>(context).getChallenge();
  }

  //var controller = PageController();
  //List<String> tabs = ["Articles", "Events"];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 1),
      child: Column(
        //padding: EdgeInsets.zero,
        children: [
          ImageContainer(
            imageUrl: "assets/images/chall.png",
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.30,
            borderRadius: 20,
            padding: const EdgeInsets.all(5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Challenges",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Colors.white,
                      fontSize: 25,
                      height: 1.25,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          BlocBuilder<ChallengeBloc, ChallengeState>(
            builder: (context, state) {
              if (state is ChallengeLoading) {
                return Center(
                  child: CircularProgressIndicator(
                    color: Colors.greenAccent.shade200,
                    strokeWidth: 8,
                    //backgroundColor: Colors.black,
                  ),
                );
              } else if (state is ChallengeError) {
                return const Center(
                  child: Text("Error while fetching Data"),
                );
              } else if (state is ChallengeLoadedEmpty) {
                return const Center(
                  child: Text("No Challenge to show"),
                );
              } else if (state is ChallengeLoaded) {
                return Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.articles.length,
                      itemBuilder: ((context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SingleChallenge(
                                        article: state.articles[index])));
                          },
                          child: Row(
                            children: [
                              ImageContainer(
                                //TODO ADD IMAGE TO ARTICLE
                                imageUrl: "assets/images/chall.png",
                                width: 80,
                                height: 80,
                                margin: const EdgeInsets.all(10),
                                borderRadius: 5,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      state.articles[index]["titre"] ?? "N/A",
                                      maxLines: 2,
                                      overflow: TextOverflow.clip,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                              fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.person_outlined,
                                          size: 18,
                                        ),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        const Text(
                                          "Particepent: ",
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        Text(
                                          state.articles[index]["publisher"] ??
                                              "0",
                                          style: const TextStyle(fontSize: 14),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      })),
                );
              } else {
                return const Center(
                  child: Text("Error wwhile fetching Data"),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
