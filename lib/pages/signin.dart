// ignore_for_file: prefer_const_constructors

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fitnessapp/pages/landingpage.dart';
import 'package:fitnessapp/pages/signup.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
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
        toolbarHeight: 100,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        height: 500,
        child: Column(
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
                'Sign In',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 40,
                    fontWeight: FontWeight.w500),
              ),
            ),

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
                  ),
                ),
              ),
            ),
            
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
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
                    'Login',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),

            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(bottom: 10),
              child: Text(
                'Forgot Password?',
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.w500),
              ),
            ),
            
            RichText(
              text: TextSpan(
                text: "Don't have an account? ",
                style: TextStyle(color: const Color.fromARGB(255, 75, 75, 75)),
                children: [
                  TextSpan(
                    text: 'Sign Up',
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // Navigate to the SignUpPage when the text is tapped
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUp()),
                        );
                      },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
