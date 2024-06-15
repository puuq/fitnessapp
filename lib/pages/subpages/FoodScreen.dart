import 'package:flutter/material.dart';

class FoodScreen extends StatelessWidget {
  const FoodScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fitness Food Choices'),
        automaticallyImplyLeading: false,
      ),
      body: DefaultTabController(
        length: 4,
        child: Column(
          children: <Widget>[
            TabBar(
              tabs: [
                Tab(text: 'Losing Weight'),
                Tab(text: 'Bulking'),
                Tab(text: 'Cutting'),
                Tab(text: 'Balancing Weight'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  FoodList(plan: 'Losing Weight'),
                  FoodList(plan: 'Bulking'),
                  FoodList(plan: 'Cutting'),
                  FoodList(plan: 'Balancing Weight'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FoodList extends StatelessWidget {
  final String plan;

  const FoodList({Key? key, required this.plan}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<FoodItem> foods = getFoodListForPlan(plan);

    return ListView.builder(
      itemCount: foods.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(foods[index].name),
          subtitle: Text('${foods[index].calories.toString()} calories'),
        );
      },
    );
  }

  List<FoodItem> getFoodListForPlan(String plan) {
    // Replace with your actual data or API call
    switch (plan) {
      case 'Losing Weight':
        return [
          FoodItem(name: 'Grilled Chicken Breast', calories: 120),
          FoodItem(name: 'Broccoli', calories: 50),
          FoodItem(name: 'Quinoa', calories: 150),
          FoodItem(name: 'Spinach Salad', calories: 80),
        ];
      case 'Bulking':
        return [
          FoodItem(name: 'Salmon Fillet', calories: 200),
          FoodItem(name: 'Sweet Potato', calories: 180),
          FoodItem(name: 'Avocado', calories: 160),
          FoodItem(name: 'Brown Rice', calories: 130),
        ];
      case 'Cutting':
        return [
          FoodItem(name: 'Turkey Breast', calories: 110),
          FoodItem(name: 'Asparagus', calories: 40),
          FoodItem(name: 'Cottage Cheese', calories: 90),
          FoodItem(name: 'Oatmeal', calories: 120),
        ];
      case 'Balancing Weight':
        return [
          FoodItem(name: 'Lean Beef', calories: 140),
          FoodItem(name: 'Mixed Nuts', calories: 180),
          FoodItem(name: 'Greek Yogurt', calories: 100),
          FoodItem(name: 'Whole Wheat Bread', calories: 70),
        ];
      default:
        return [];
    }
  }
}

class FoodItem {
  final String name;
  final int calories;

  FoodItem({required this.name, required this.calories});
}
