import 'package:flutter/material.dart';

class BottomNavigationBarCostume extends StatefulWidget {
   BottomNavigationBarCostume(int bottomNavBarIndex, {super.key});

  var bottomNavBarIndex =0;

  @override
  State<BottomNavigationBarCostume> createState() =>
      _BottomNavigationBarCostumeState();
}

class _BottomNavigationBarCostumeState
    extends State<BottomNavigationBarCostume> {
  @override
  Widget build(BuildContext context) {
    return NavigationBarTheme(
      data: NavigationBarThemeData(
          indicatorColor: Colors.green.shade400,
          labelTextStyle: MaterialStateProperty.all(
            const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          )),
      child: NavigationBar(
        selectedIndex: widget.bottomNavBarIndex,
        backgroundColor: Colors.green.shade200,
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        animationDuration: const Duration(seconds: 1),
        onDestinationSelected: (index) {
          setState(() {
            widget.bottomNavBarIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), label: "Home"),
          NavigationDestination(
              icon: Icon(Icons.attractions_outlined), label: "Challenges"),
          NavigationDestination(
              icon: Icon(Icons.group_outlined), label: "Community"),
          NavigationDestination(
              icon: Icon(Icons.person_2_outlined), label: "Profile"),
        ],
      ),
    );
  }
}
