import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fitness App'),
        backgroundColor: Color.fromARGB(255, 68, 243, 255),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height: 200,
            margin: EdgeInsets.all(25),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.black),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(left: 25),
                height: 130,
                width: 160,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black),
              ),
              Container(
                margin: EdgeInsets.only(right: 25),
                height: 130,
                width: 160,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            alignment: Alignment.center,
            height: 50,
            width: 150,
            child: Text(
              'SPANK Manik Dai',
              style: TextStyle(color: Colors.white),
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.purple),
          )
        ],
      ),
    );
  }
}
