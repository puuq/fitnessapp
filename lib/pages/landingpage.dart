import 'package:fitnessapp/pages/subpages/FoodScreen.dart';
import 'package:flutter/material.dart';
import 'package:fitnessapp/components/style.dart';
import 'package:fitnessapp/pages/home.dart';
// import 'package:fitnessapp/pages/subpages/foodscreen.dart';
import 'package:fitnessapp/pages/subpages/profilescreen.dart';
import 'package:fitnessapp/pages/subpages/programsscreen.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
    FoodScreen(),
    const ProgramsScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key('landingScreen'),
      backgroundColor: Style.backgroundColor,
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.food_bank),
            label: 'Food',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            label: 'Programs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.white,
        selectedItemColor: const Color.fromARGB(255, 234, 188, 243),
        onTap: _onItemTapped,
        backgroundColor: Style.backgroundColor,
        selectedFontSize: 16,
        unselectedFontSize: 14,
        iconSize: 25,
      ),
    );
  }
}
