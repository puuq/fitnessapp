import 'package:flutter/material.dart';
import 'package:fitnessapp/components/style.dart';

class ProgramsScreen extends StatelessWidget {
  const ProgramsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Workout Programs',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ), // Set title color to white
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Style.backgroundColor,
      ),
      body: Container(
        color: Style.backgroundColor, // Set body background color
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          children: [
            _buildProgramCard(context, 'Chest', 'assets/chest.png'),
            _buildProgramCard(context, 'Back', 'assets/back.png'),
            _buildProgramCard(context, 'Biceps', 'assets/biceps.png'),
            _buildProgramCard(context, 'Triceps', 'assets/triceps.png'),
            _buildProgramCard(context, 'Shoulders', 'assets/shoulder.png'),
            _buildProgramCard(context, 'Legs', 'assets/legs.png'),
            _buildProgramCard(context, 'Forearms', 'assets/forearms.png'),
            _buildProgramCard(context, 'Abs', 'assets/abs.png'),
          ],
        ),
      ),
    );
  }

  Widget _buildProgramCard(
      BuildContext context, String title, String imagePath) {
    return Card(
      elevation: 4.0,
      child: InkWell(
        onTap: () {
          // Navigate to the ExerciseListScreen when the card is tapped
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ExerciseListScreen(title: title),
            ),
          );
        },
        child: Stack(
          children: [
            // Background image for the card
            Positioned.fill(
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
            // Title on top of the background image
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black54,
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// New screen to show exercises for each category
class ExerciseListScreen extends StatelessWidget {
  final String title;

  const ExerciseListScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '$title Exercises',
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Style.backgroundColor,
      ),
      body: Container(
        color: Style.backgroundColor,
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: _getExercisesForCategory(title).map((exercise) {
            return Card(
              color: Colors.white,
              child: ListTile(
                title: Text(exercise),
                onTap: () {
                  // Handle tap to show exercise details if needed
                },
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  // Dummy data for exercises based on the category
  List<String> _getExercisesForCategory(String category) {
    switch (category) {
      case 'Chest':
        return [
          'Flat Bench Press',
          'Incline Dumbbell Press',
          'Peg Fly',
          'Cable Curls',
          'Decline Bench Press',
          'Dumbell Pullover',
          'Push-Ups'
        ];
      case 'Back':
        return [
          'Pull-ups',
          'Deadlift',
          'Bent-over Rows',
          'Pull-down',
          'Seated Rows',
          'Barbell Rows'
        ];
      case 'Biceps':
        return [
          'Barbell Curls',
          'Hammer Curls',
          'Concentration Curls',
          'Dumbell Curls',
          'Cable Concentration'
        ];
      case 'Triceps':
        return [
          'Tricep Dips',
          'Skull Crushers',
          'Close-grip Bench Press',
          'Kickbacks',
          'Rope Pushdown'
        ];
      case 'Shoulders':
        return [
          'Overhead Press',
          'Lateral Raise',
          'Front Raise',
          'Arlond Press',
          'Real Dealt',
        ];
      case 'Legs':
        return [
          'Squats',
          'Leg Press',
          'Lunges',
          'Bodyweight Squats',
          'Lunges',
        ];
      case 'Forearms':
        return [
          'Wrist Curls',
          'Reverse Wrist Curls',
          'Farmer’s Walk',
        ];
      case 'Abs':
        return [
          'Crunches',
          'Planks',
          'Leg Raises',
          'Hip Rotations',
          'Side leg swings'
        ];
      default:
        return ['Exercise 1', 'Exercise 2'];
    }
  }
}
