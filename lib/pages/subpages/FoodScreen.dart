import 'package:flutter/material.dart';
import 'package:fitnessapp/components/style.dart';
import '../home.dart'; // Adjusting the path to go up one directory to access home.dart

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: FoodScreen(),
    );
  }
}

class FoodScreen extends StatefulWidget {
  const FoodScreen({super.key});

  @override
  _FoodScreenState createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  final TextEditingController _bmiController = TextEditingController();
  String _feedback = '';
  List<Map<String, String>> _foodItems = [];

  final Map<String, List<Map<String, String>>> foodOptions = {
    'underweight': [
      {
        'name': 'Avocado',
        'image': 'assets/foods/avocado.png',
        'calorie': '160 cal per 100 grams',
        'protein': '322 cal per Avocado',
      },
      {
        'name': 'Dark Chocolate',
        'image': 'assets/foods/chocolate.png',
        'calorie': '599 cal per 100 grams',
        'protein': '168 cal per 1 oz',
      },
      {
        'name': 'Pork Belly',
        'image': 'assets/foods/pork.png',
        'calorie': '541 cal per 100 grams',
        'protein': '906 per 6 oz',
      },
      {
        'name': 'Steak',
        'image': 'assets/foods/steak.png',
        'calorie': '321 cal per 100 grams',
        'protein': '847 cal per 291 grams',
      },
      {
        'name': 'Potatoes',
        'image': 'assets/foods/potato.png',
        'calorie': '86 cal per 100 grams',
        'protein': '258 cal per 1 large potato',
      },
      {
        'name': 'Mixed Nuts',
        'image': 'assets/foods/nuts.jfif',
        'calorie': '560 cal per 100 grams',
        'protein': '820 cal per 6 oz',
      },
    ],
    'normal': [
      {
        'name': 'Fresh Fruits',
        'image': 'assets/foods/fruits.png',
        'calorie': 'Fruit Juice if possible',
        'protein': 'Good for maintaining Weight',
      },
      {
        'name': 'Fresh Vegetables',
        'image': 'assets/foods/veggie.png',
        'calorie': 'Serve with Plain rice',
        'protein': 'Good for Vitamin Sources',
      },
      {
        'name': 'Dairy Products',
        'image': 'assets/foods/dairy.png',
        'calorie': 'Suggested to take at morning',
        'protein': 'Avoid before bed',
      },
      {
        'name': 'Whole Grains',
        'image': 'assets/foods/grains.png',
        'calorie': 'Can be replacement for rice',
        'protein': 'Avoid taking daily',
      },
      {
        'name': 'Lean Meat',
        'image': 'assets/foods/meat.png',
        'calorie': 'Can be consumed daily',
        'protein': 'Avoid deep fried',
      },
      {
        'name': 'Eggs',
        'image': 'assets/foods/egg.png',
        'calorie': 'Boiled eggs are highly recommended',
        'protein': '',
      },
    ],
    'overweight': [
      {
        'name': 'Chicken Breast',
        'image': 'assets/foods/chicken.png',
        'calorie': '120 cal per 112 grams',
        'protein': '26g protein',
      },
      {
        'name': 'Chickpeas',
        'image': 'assets/foods/chickpeas.png',
        'calorie': '135 cal per 82 grams',
        'protein': '7g protein',
      },
      {
        'name': 'Egg',
        'image': 'assets/foods/egg.png',
        'calorie': '72 cal per 50 grams',
        'protein': '6g protein',
      },
      {
        'name': 'Lentils',
        'image': 'assets/foods/lentils.png',
        'calorie': '113 cal per 198 grams',
        'protein': '9g protein',
      },
      {
        'name': 'Shrimp',
        'image': 'assets/foods/shrimp.png',
        'calorie': '132 cal per 145 grams',
        'protein': '25g protein',
      },
      {
        'name': 'Tofu',
        'image': 'assets/foods/tofu.png',
        'calorie': '181 cal per 126 grams',
        'protein': '22g protein',
      },
    ],
  };

  @override
  void initState() {
    super.initState();
    _foodItems = foodOptions['normal']!; // Default to normal foods
  }

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
        _feedback =
            'You are underweight, Try gaining some weight with the foods listed below!';
        _foodItems = foodOptions['underweight']!;
      });
    } else if (bmi >= 18.5 && bmi <= 24.5) {
      setState(() {
        _feedback =
            'You are balanced, Below are some normal healthy meals for you!';
        _foodItems = foodOptions['normal']!;
      });
    } else {
      setState(() {
        _feedback =
            'You are overweight, Check some low calorie high protein foods below!';
        _foodItems = foodOptions['overweight']!;
      });
    }
  }

  void _showFoodList(String category) {
    setState(() {
      _foodItems = foodOptions[category]!;
      _feedback = ''; // Clear feedback when showing food list
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food Screen'),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _bmiController,
              decoration: const InputDecoration(
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
          // Buttons to show food lists
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => _showFoodList('underweight'),
                child: const Text('High Calorie'),
              ),
              ElevatedButton(
                onPressed: () => _showFoodList('normal'),
                child: const Text('Balanced'),
              ),
              ElevatedButton(
                onPressed: () => _showFoodList('overweight'),
                child: const Text('High Protein'),
              ),
            ],
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
                return Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Display image
                      Image.asset(
                        _foodItems[index]['image']!,
                        height: 100.0,
                        width: 100.0,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(height: 8.0),
                      // Display food name
                      Text(
                        _foodItems[index]['name']!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // Display calorie
                      Text(
                        _foodItems[index]['calorie'] ?? 'N/A',
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 13.0),
                      ),
                      // Display protein
                      Text(
                        _foodItems[index]['protein'] ?? 'N/A',
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 13.0),
                      ),
                    ],
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
