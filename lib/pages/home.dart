import 'package:fitnessapp/components/style.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Fitness App'),
      //   backgroundColor: Color.fromARGB(255, 68, 243, 255),
      //   centerTitle: true,
      // ),
      body: Container(
        color: const Color.fromARGB(255, 0, 0, 0),
        child: SingleChildScrollView(
          child: Column(
            children: [
                Container(
                height: 750,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/homepage.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    //   Positioned.fill(child: Container(
                    //     decoration: BoxDecoration(
                    //       gradient: LinearGradient(
                    //         begin: Alignment.topCenter,
                    //         end: Alignment.bottomCenter,
                    //         colors: [
                    //           Colors.transparent,
                    //           Colors.black,
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // ),

                    Positioned(
                      top: 50,
                      left: 20,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hello There,',
                            style: TextStyle(
                              color: Style.primaryColor,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'It’s time to test your limits',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),

                      Positioned(
                        top: 50,
                        right: 20,
                        child: Container(
                          width: 50.0,  // Adjust the width and height to match your needs
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: Colors.blue, // Optional: background color if the image doesn't cover the entire area
                            shape: BoxShape.circle,
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              'assets/images/profile.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),

                    Positioned(
                      bottom: 40,
                      left: 60,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Welcome Back',
                            style: TextStyle(
                              color: Style.primaryColor,
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text.rich(
                            TextSpan(children: [
                                TextSpan(
                                  text:'Ready to convert your ',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Pain',
                                  style: TextStyle(
                                    color: Style.primaryColor, // Change this to the color you want for "Pain"
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                TextSpan(
                                  text: ' to ',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Gains',
                                  style: TextStyle(
                                    color: Style.primaryColor, // Change this to the color you want for "Gains"
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                TextSpan(
                                  text: '?',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
                Container(
                  width: 400,
                  height: 60,
                  margin: EdgeInsets.all(35),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Style.primaryColor
                  ),
                  child: Center(
                    child: const Text(
                      'Weekly Challenge',
                      style: TextStyle(fontSize: 30 , fontWeight: FontWeight.w500 , color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),

                  SizedBox(
                    height: 10,
                  ),
                
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 25),
                    height: 100,
                    width: 140,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/pushup.png'),
                          fit: BoxFit.cover,
                        ),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 25),
                    height: 100,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      // color: Colors.black,
                    ),
                    child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Push Up",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w600,
                                height: 1.3,
                              ),
                            ),
                            Text(
                              "20x3",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                  ),
                ],
              ),

              SizedBox(
                height: 10,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 25),
                    height: 100,
                    width: 140,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/lunges.png'),
                          fit: BoxFit.cover,
                        ),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 25),
                    height: 100,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      // color: Colors.black,
                    ),
                    child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Lunges",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w600,
                                height: 1.3,
                              ),
                            ),
                            Text(
                              "5x4",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                  ),
                ],
              ),

              SizedBox(
                height: 10,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 25),
                    height: 100,
                    width: 140,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/dips.jpg'),
                          fit: BoxFit.cover,
                        ),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 25),
                    height: 100,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      // color: Colors.black,
                    ),
                    child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Tricep Dips",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 29,
                                fontWeight: FontWeight.w600,
                                height: 1.3,
                              ),
                            ),
                            Text(
                              "10x3",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                  ),
                ],
              ),

              SizedBox(
                height: 20,
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
