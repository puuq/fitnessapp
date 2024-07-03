import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FoodScreen(),
    );
  }
}

class FoodScreen extends StatelessWidget {
  final List<String> imageUrls = [
    'https://via.placeholder.com/150?text=Food+1',
    'https://via.placeholder.com/150?text=Food+2',
    'https://via.placeholder.com/150?text=Food+3',
    'https://via.placeholder.com/150?text=Food+4',
    'https://via.placeholder.com/150?text=Food+5',
    'https://via.placeholder.com/150?text=Food+6',
  ];

  final List<String> titles = [
    'Food 1',
    'Food 2',
    'Food 3',
    'Food 4',
    'Food 5',
    'Food 6',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Screen'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        itemCount: imageUrls.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FoodDetailPage(title: titles[index]),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Image.network(
                      imageUrls[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      titles[index],
                      style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class FoodDetailPage extends StatelessWidget {
  final String title;

  FoodDetailPage({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Detail Page'),
      ),
      body: Center(
        child: Text(
          'Details for $title',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
