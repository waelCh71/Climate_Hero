import 'package:climate_hero/features/communities/ui/single_event.dart';
import 'package:climate_hero/global/ui/image_container.dart';
import 'package:climate_hero/state%20management%20event/bloc/past_event_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Event extends StatefulWidget {
  const Event({super.key});

  @override
  State<Event> createState() => _EventState();
}

class _EventState extends State<Event> {
  @override
  void initState() {
    super.initState();
    var x = BlocProvider.of<PastEventBloc>(context).getEvents();
    print("Datassss:     $x");
  }

  //var controller = PageController();
  //List<String> tabs = ["Articles", "Events"];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Column(
        //padding: EdgeInsets.zero,
        children: [
          const _dicoverArticle(),
          BlocBuilder<PastEventBloc, PastEventState>(
            builder: (context, state) {
              if (state is EventLoading) {
                return Center(
                  child: CircularProgressIndicator(
                    color: Colors.greenAccent.shade200,
                    strokeWidth: 8,
                    //backgroundColor: Colors.black,
                  ),
                );
              } else if (state is EventError) {
                return const Center(
                  child: Text("Error wwhile fetching Data"),
                );
              } else if (state is EventLoadedEmpty) {
                return const Center(
                  child: Text("No Article to show"),
                );
              } else if (state is EventLoaded) {
                return Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.events.length,
                      itemBuilder: ((context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SingleEvent(
                                        article: state.events[index])));
                          },
                          child: Row(
                            children: [
                              
                              Container(
                                height: 80,
                                width: 80,
                                margin: const EdgeInsets.all(10),
                                //padding: padding,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            state.events[index]["image"]),
                                        fit: BoxFit.cover)),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      state.events[index]["titre"] ?? "N/A",
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
                                          Icons.group_outlined,
                                          size: 18,
                                        ),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        const Text(
                                          "Orgenized: ",
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        Text(
                                          state.events[index]["publisher"] ??
                                              "N/A",
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

class _dicoverArticle extends StatelessWidget {
  const _dicoverArticle();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //height: MediaQuery.of(context).size.height * 0.25,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Events",
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 5,
          ),
          Text("Consult our community Activity from all over the world",
              style: Theme.of(context).textTheme.bodySmall!),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'search',
              fillColor: Colors.grey.shade200,
              filled: true,
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.grey,
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none),
            ),
          )
        ],
      ),
    );
  }
}
