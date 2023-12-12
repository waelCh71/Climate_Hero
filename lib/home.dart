import 'package:flutter/material.dart';

import 'global/constante.dart';
import 'global/ui/image_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        ImageContainer(
          imageUrl: "assets/images/homePage.png",
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.45,
          borderRadius: 20,
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                homePageText,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Colors.white,
                    fontSize: 16,
                    height: 1.25,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        const SousThemeWidget(),
      ],
    );
  }
}

class SousThemeWidget extends StatefulWidget {
  const SousThemeWidget({super.key});

  @override
  State<SousThemeWidget> createState() => _SousThemeWidgetState();
}

class _SousThemeWidgetState extends State<SousThemeWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0, bottom: 20, left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //TODO Section 1
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "GLOBAL WARMING",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              TextButton(
                  onPressed: () {},
                  child: const Icon(Icons.arrow_forward_outlined))
              /*TextButton(
                  onPressed: () {
                    setState(() {
                      Main(
                        bottomNavBarIndex: 3,
                      );
                    });
                  },
                  child: Text("More",
                      style: Theme.of(context).textTheme.bodyLarge!))*/
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Global warming is a global phenomenon characterized by a gradual increase in average temperatures on the Earth's surface.",
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(fontWeight: FontWeight.w500, fontSize: 16),
          ),
          const SizedBox(
            height: 10,
          ),
          ImageContainer(
              imageUrl: "assets/images/main1.png",
              width: MediaQuery.of(context).size.width * 0.90,
              height: 200,
              borderRadius: 20),
          const SizedBox(
            height: 60,
          ),

          //Todo Section 2
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "CO2 EMISSIONS",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              TextButton(
                  onPressed: () {},
                  child: const Icon(Icons.arrow_forward_outlined))
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Carbon dioxide (CO2) emissions are a major concern in the context of climate change.",
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(fontWeight: FontWeight.w500, fontSize: 16),
          ),
          const SizedBox(
            height: 10,
          ),
          ImageContainer(
              imageUrl: "assets/images/main2.png",
              width: MediaQuery.of(context).size.width * 0.90,
              height: 200,
              borderRadius: 20),
          const SizedBox(
            height: 30,
          ),

          //TODO SECTION3
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "ENVIRONMENTAL IMPACT",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              TextButton(
                  onPressed: () {},
                  child: const Icon(Icons.arrow_forward_outlined))
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Environmental impact refers to the effects that a human activity, project or behavior has on the environment around it.",
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(fontWeight: FontWeight.w500, fontSize: 16),
          ),
          const SizedBox(
            height: 10,
          ),
          ImageContainer(
              imageUrl: "assets/images/main3.png",
              width: MediaQuery.of(context).size.width * 0.90,
              height: 200,
              borderRadius: 20),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
