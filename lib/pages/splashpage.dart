import 'package:fitnessapp/pages/home.dart';
import 'package:fitnessapp/pages/landingpage.dart';
import 'package:fitnessapp/pages/signin.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool _showIcon = true;

  @override
  void initState() {
    super.initState();
    // After 3 seconds, set _showIcon to false triggering the fade-out animation
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _showIcon = false;
      });
      // Navigate to the next page after the fade-out animation finishes
      Future.delayed(Duration(milliseconds: 800), () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => SignIn()),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(color: Colors.black),
        child: Center(
          child: AnimatedOpacity(
            opacity:
                _showIcon ? 1.0 : 0.0, // Set opacity based on _showIcon state
            duration:
                Duration(seconds: 2), // Adjust duration as per your preference
            child: Icon(
              Icons.fitness_center,
              size: 100,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

// class NextPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Text(
//           'Next Page',
//           style: TextStyle(fontSize: 24),
//         ),
//       ),
//     );
//   }
// }
