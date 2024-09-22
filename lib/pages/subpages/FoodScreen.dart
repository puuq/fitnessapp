import 'package:flutter/material.dart';
import '../home.dart'; // Adjusting the path to go up one directory to access home.dart

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FoodScreen(),
    );
  }
}

class FoodScreen extends StatefulWidget {
  FoodScreen({super.key});

  @override
  _FoodScreenState createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  final TextEditingController _bmiController = TextEditingController();
  String _feedback = '';
  List<String> _foodItems = [];

  final Map<String, List<String>> foodOptions = {
    'underweight': [
      'High Calorie Food 1',
      'High Calorie Food 2',
      'High Calorie Food 2',
      'High Calorie Food 2',
      'High Calorie Food 2',
      'High Calorie Food 2',
    ],
    'normal': [
      'Balanced Diet Food 1',
      'Balanced Diet Food 2',
      'Balanced Diet Food 1',
      'Balanced Diet Food 2',
      'Balanced Diet Food 1',
      'Balanced Diet Food 2',
    ],
    'overweight': [
      'Low Calorie Food 1',
      'Low Calorie Food 2',
      'Low Calorie Food 1',
      'Low Calorie Food 2',
      'Low Calorie Food 1',
      'Low Calorie Food 2',
    ],
  };

  void _checkBMI() {
    final double? bmi = double.tryParse(_bmiController.text);
    if (bmi == null) {
      setState(() {
        _feedback = 'Please enter a valid number';
        _foodItems = [];
      });
      return;
    }

    if (bmi < 18.5) {
      setState(() {
        _feedback = 'You are underweight';
        _foodItems = foodOptions['underweight']!;
      });
    } else if (bmi >= 18.5 && bmi <= 24.5) {
      setState(() {
        _feedback = 'You are balanced';
        _foodItems = foodOptions['normal']!;
      });
    } else {
      setState(() {
        _feedback = 'You are overweight';
        _foodItems = foodOptions['overweight']!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food Screen'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _bmiController,
              decoration: InputDecoration(
                labelText: 'Enter your BMI',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          ElevatedButton(
            onPressed: _checkBMI,
            child: const Text('Check BMI'),
          ),
          if (_feedback.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                _feedback,
                style: const TextStyle(
                    fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: _foodItems.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            FoodDetailPage(title: _foodItems[index]),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          _foodItems[index],
                          style: const TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class FoodDetailPage extends StatelessWidget {
  final String title;

  const FoodDetailPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food Detail Page'),
      ),
      body: Center(
        child: Text(
          'Details for $title',
          style: const TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
