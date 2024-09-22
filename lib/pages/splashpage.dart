import 'package:fitnessapp/pages/home.dart';
import 'package:fitnessapp/pages/landingpage.dart';
import 'package:fitnessapp/pages/signin.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool _showIcon = true;

  @override
  void initState() {
    super.initState();
    // After 3 seconds, set _showIcon to false triggering the fade-out animation
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _showIcon = false;
      });
      // Navigate to the next page after the fade-out animation finishes
      Future.delayed(const Duration(milliseconds: 800), () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const SignIn()),
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
        decoration: const BoxDecoration(color: Colors.black),
        child: Center(
          child: AnimatedOpacity(
            opacity:
                _showIcon ? 1.0 : 0.0, // Set opacity based on _showIcon state
            duration: const Duration(
                seconds: 2), // Adjust duration as per your preference
            child: Image.asset(
              'assets/images/logo.png', // Replace 'your_image.png' with your image asset path
              width: 100,
              height: 100,
              fit: BoxFit.contain,
              color: Colors
                  .white, // You can remove this if you don't want to apply color to the image
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
