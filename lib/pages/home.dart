import 'package:fitnessapp/components/style.dart';
import 'package:flutter/material.dart';

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
        color: Style.backgroundColor,
        child: Column(
          children: [
            Container(
              width: 400,
              height: 150,
              margin: EdgeInsets.all(25),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 180,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Weekly" , style: TextStyle(color: Colors.white , fontSize: 25 , height: 0.8),),
                          Text("Challenge" , style: TextStyle(color: Colors.white , fontSize: 25 ),),
                          Text("Dumbbell Lunges 20x3" , style: TextStyle(color: Colors.grey , fontSize: 15 , height: 2 ),),
                        ],
                      ),
                    ),
                  ),
                  Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage('assets/images/lunges.png'),
                        fit: BoxFit.cover
                        ),
                        color: Color.fromARGB(255, 231, 201, 236),
                        borderRadius: BorderRadius.circular(20),
                    ),
                    width: 162,

                  )
                ],
              ),
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
            ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
                child: const Text(
                  'SPANK Manik Dai',
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}
