import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:climate_hero/features/challenge/ui/challenges.dart';
import 'package:climate_hero/features/communities/ui/events.dart';
import 'package:climate_hero/state%20management%20article/bloc/article_bloc.dart';
import 'package:climate_hero/state%20management%20chalenge/bloc/challenge_bloc.dart';
import 'package:climate_hero/state%20management%20event/bloc/past_event_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/auth/ui/sign_in.dart';
import 'features/communities/ui/articles.dart';
import 'global/constante.dart';
import 'global/ui/on_boarding_page.dart';
import 'home.dart';
import 'state%20management_auth/bloc/gloabl_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  final prefs = await SharedPreferences.getInstance();
  final showHome = prefs.getBool("showHome") ?? false;
  runApp(MyApp(showHome: showHome));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.showHome});

  final bool showHome;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GloablBloc(),
      child: MaterialApp(
        title: 'Climate Hero',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
        home: AnimatedSplashScreen(
            splash: Image.asset(
              "assets/images/logo.png",
              width: double.infinity,
              height: 700,
              alignment: Alignment.center,
            ),
            centered: true,
            duration: 2000,
            splashTransition: SplashTransition.fadeTransition,
            //pageTransitionType: PageT
            //
            nextScreen: showHome ? const Login() : const OnBoardingPage()),
      ),
    );
  }
}

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  int bottomNavBarIndex = 0;
  var screens = [
    const HomePage(),
    BlocProvider(
      create: (context) => ChallengeBloc(),
      child: const Challenges(),
    ),
    BlocProvider(
      create: (context) => ArticleBloc(),
      child: const Article(),
    ),
    BlocProvider(
      create: (context) => PastEventBloc(),
      child: const Event(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: elavationAppBar,
          /*leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu_outlined),
          ),*/
          actions: [
            IconButton(
                onPressed: () async {
                  final prefs = await SharedPreferences.getInstance();
                  //prefs.setBool("showHome", false);
                  prefs.clear();
                  prefs.remove("jwtToken");
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const MyApp(showHome: true);
                      },
                    ),
                  );
                },
                icon: const Icon(Icons.logout))
          ],
        ),
        extendBodyBehindAppBar: true,
        body: screens[bottomNavBarIndex],
        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
              indicatorColor: Colors.green.shade400,
              labelTextStyle: MaterialStateProperty.all(
                const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              )),
          child: NavigationBar(
            selectedIndex: bottomNavBarIndex,
            backgroundColor: Colors.green.shade200,
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
            animationDuration: const Duration(seconds: 1),
            onDestinationSelected: (index) {
              setState(() {
                bottomNavBarIndex = index;
              });
            },
            destinations: const [
              NavigationDestination(
                  icon: Icon(Icons.home_outlined), label: "Home"),
              NavigationDestination(
                  icon: Icon(Icons.attractions_outlined), label: "Challenges"),
              NavigationDestination(
                  icon: Icon(Icons.article_outlined), label: "Articles"),
              NavigationDestination(
                  icon: Icon(Icons.event_outlined), label: "Events"),
            ],
          ),
        ));
  }
}

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Profile"),
    );
  }
}
