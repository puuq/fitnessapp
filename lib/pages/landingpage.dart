import 'package:fitnessapp/components/style.dart';
import 'package:fitnessapp/pages/home.dart';
import 'package:fitnessapp/pages/subpages/FoodScreen.dart';
import 'package:fitnessapp/pages/subpages/ProfileScreen.dart';
import 'package:fitnessapp/pages/subpages/ProgramsScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});


  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {

    int _selectedIndex = 0;

    List<Widget> _widgetOptions = <Widget>[
      const HomePage(),
      const FoodScreen(),
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
    return Scaffold (
      key: const Key('landingScreen'),
      backgroundColor: Style.backgroundColor,
      appBar: appBar(),
      body: _widgetOptions[
        _selectedIndex
      ],
      bottomNavigationBar: 
        BottomNavigationBar(
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
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      currentIndex: _selectedIndex,
      selectedItemColor: Style.primaryColor,
      onTap: (index){
        setState(
            () {
              _selectedIndex = index;
          },
        );
      },
      backgroundColor: Style.backgroundColor,
      )
    );
  }

  AppBar appBar() {
    return AppBar(
      backgroundColor: Style.backgroundColor,
      toolbarHeight: 70,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Hello Manik', style: TextStyle(color: Colors.white),)

          // Image.asset(
          //   'assets/images/logo.png',
          //   fit: BoxFit.contain,
          //   width: 50,
          //   height: 50,
          // ),
          // Container(
          //   child: IconButton(
          //     onPressed: () {},
          //     icon: Icon(
          //       Icons.menu,
          //       size: 40,
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }

  // Column pageBody() {
  //   return Column(
  //     children: [
  //       SizedBox(
  //         child: Center(
  //           child: Container(
  //             margin: EdgeInsets.only(top: 20),
  //             height: 200,
  //             width: 350,
  //             decoration: BoxDecoration(
  //                 image: DecorationImage(
  //                   image: AssetImage('assets/images/firstpage.png'),
  //                   fit: BoxFit.fill,
  //                 ),
  //                 borderRadius: BorderRadius.circular(10)),
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }


}
