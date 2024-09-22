// ignore_for_file: prefer_const_constructors

import 'package:fitnessapp/pages/signin.dart';
import 'package:fitnessapp/services/auth_service.dart';
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
  TextEditingController confirmPasswordController = TextEditingController();

  String errorText = ''; // Error text to display if passwords don't match

  @override
  void dispose() {
    // Clean up the controllers when the widget is disposed
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Image.asset(
              'assets/images/logo.png',
              width: 70,
              height: 70,
              fit: BoxFit.contain,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Text(
              'Sign Up',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                  fontWeight: FontWeight.w500),
            ),
          ),
          // Email TextField
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: Center(
              child: SizedBox(
                height: 55,
                width: 300,
                child: TextField(
                  controller: emailController,
                  enabled: true,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                    hintText: 'Email',
                  ),
                ),
              ),
            ),
          ),
          // Password TextField
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
                ),
              ),
            ),
          ),
          // // Confirm Password TextField
          // Center(
          //   child: Container(
          //     margin: EdgeInsets.only(bottom: 10),
          //     width: 300,
          //     child: TextField(
          //       controller: confirmPasswordController,
          //       enabled: true,
          //       obscureText: true,
          //       decoration: InputDecoration(
          //         contentPadding:
          //             EdgeInsets.symmetric(vertical: 0, horizontal: 0),
          //         hintText: 'Confirm Password',
          //         errorText: errorText.isNotEmpty
          //             ? errorText
          //             : null, // Show error text if not empty
          //       ),
          //     ),
          //   ),
          // ),
          SizedBox(height: 10),
          // Sign Up Button
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: SizedBox(
              width: 100,
              child: ElevatedButton(
                onPressed: () async {
                  await AuthService().signup(
                      email: emailController.text,
                      password: passwordController.text,
                      context: context);
                }, // Call signUp function on button press
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
          // Link to Sign In page
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
                      // Navigate to the SignIn page when the text is tapped
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
