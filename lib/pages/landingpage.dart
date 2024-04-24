import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: pageBody(),
    );
  }

  Column pageBody() {
    return Column(
      children: [
        SizedBox(
          child: Center(
            child: Container(
              margin: EdgeInsets.only(top: 20),
              height: 200,
              width: 350,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/firstpage.png'),
                    fit: BoxFit.fill,
                  ),
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10)),
            ),
          ),
        ),
      ],
    );
  }

  AppBar appBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'assets/images/logo.png',
            fit: BoxFit.contain,
            width: 50,
            height: 50,
          ),
          Container(
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.menu,
                size: 40,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class GNav {}
