// ignore_for_file: prefer_const_constructors

import 'package:fitnessapp/pages/signin.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fitnessapp/pages/landingpage.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controllers when the widget is disposed
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100, // Adjusted toolbarHeight
        title: Text(
          'Sign Up',
          style: TextStyle(
              color: Colors.black, fontSize: 40, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false, // Display back button automatically
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Container(
          //   height: 50,
          //   margin: EdgeInsets.only(bottom: 20),
          //   child: Center(
          //     child: const Text(
          //       'Sign Up',
          //       style: TextStyle(
          //           color: Colors.black,
          //           fontSize: 40,
          //           fontWeight: FontWeight.w500),
          //     ),
          //   ),
          // ),
          Center(
            child: Container(
              height: 55,
              width: 300,
              child: TextField(
                controller: emailController,
                enabled: true,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                  hintText: 'Email',
                  // border: OutlineInputBorder(
                  //     borderRadius: BorderRadius.circular(5))
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(bottom: 10),
              width: 300,
              child: TextField(
                controller: passwordController,
                enabled: true,
                obscureText: true,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                  hintText: 'Password',
                  // border: OutlineInputBorder(
                  //     borderRadius: BorderRadius.circular(5))
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(bottom: 10),
              width: 300,
              child: TextField(
                controller: passwordController,
                enabled: true,
                obscureText: true,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                  hintText: 'Confirm Password',
                  // border: OutlineInputBorder(
                  //     borderRadius: BorderRadius.circular(5))
                ),
              ),
            ),
          ),
          // Container(
          //   alignment: Alignment.topRight,
          //   margin: EdgeInsets.only(right: 50),
          //   child: Text(
          //     'Forgot Password?',
          //     style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w500),
          //   ),
          // ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: SizedBox(
              width: 100,
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to the LandingPage when the login button is pressed
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LandingPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
                child: const Text(
                  'Sign Up',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          RichText(
            text: TextSpan(
              text: "Already have an account? ",
              style: TextStyle(color: const Color.fromARGB(255, 75, 75, 75)),
              children: [
                TextSpan(
                  text: 'Sign In',
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      // Navigate to the SignUpPage when the text is tapped
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignIn()),
                      );
                    },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
