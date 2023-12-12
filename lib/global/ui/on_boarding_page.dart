import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../features/auth/ui/sign_in.dart';
import '../utils.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final controller = PageController();

  final utils = Utils();

  bool isLastPage = false;

  @override
  void dispose() {
    controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 80),
        child: PageView(
          controller: controller,
          onPageChanged: (index) {
            setState(() {
              isLastPage = index == 2;
            });
          },
          children: [
            buildPage(
                "assets/images/bienvenu.png",
                Colors.blue.shade100,
                "Bienvenue sur Climate Hero",
                "Explore a world of environmental action with our app. Discover crucial information, take on eco-responsible challenges, participate in community events and follow news related to climate change."),
            buildPage(
                "assets/images/solution.png",
                Colors.green.shade100,
                "Mobilisation et Éducation ",
                "Discover environmental policies at all levels, practical initiatives and innovative solutions. Our app offers a deep dive into greenhouse gas emitting sectors."),
            buildPage(
                "assets/images/community.png",
                Colors.green.shade200,
                "Objectifs et Solutions",
                "Join a global community committed to fighting climate change. Our application facilitates the coordination of actions, events and provides informative articles. Take part in environmental challenges, consult the latest events and stay informed on current issues."),
          ],
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => const Login()));
                },
                child: const Text("Skip")),
            Center(
              child: SmoothPageIndicator(
                  controller: controller,
                  count: 3,
                  effect: const WormEffect(
                    spacing: 16,
                  ),
                  onDotClicked: (index) => controller.animateToPage(index,
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOut)),
            ),
            TextButton(
                onPressed: () async {
                  if (isLastPage) {
                    final prefs = await SharedPreferences.getInstance();
                    prefs.setBool("showHome", true);
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => const Login()));
                  } else {
                    controller.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut);
                  }
                },
                child: isLastPage
                    ? const Text("Get Started")
                    : const Text("Next")),
          ],
        ),
      ),
    );
  }
}

Widget buildPage(imageUrl, color, title, description) {
  return Container(
    color: color,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          imageUrl,
          fit: BoxFit.cover,
          width: double.infinity,
        ),
        const SizedBox(
          height: 64,
        ),
        Text(
          title,
          style: TextStyle(
              color: Colors.teal.shade700,
              fontSize: 22,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 24,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            description,
            style: const TextStyle(color: Colors.black, fontSize: 16),
          ),
        )
      ],
    ),
  );
}
