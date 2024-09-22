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
          style: TextStyle(color: Colors.white), // Set title color to white
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Style.backgroundColor,
      ),
      // Change the body background color to Style.backgroundColor
      body: Container(
        color: Style.backgroundColor, // Set body background color
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          children: [
            _buildProgramCard(context, 'Chest', Icons.fitness_center),
            _buildProgramCard(context, 'Back', Icons.fitness_center),
            _buildProgramCard(context, 'Biceps', Icons.fitness_center),
            _buildProgramCard(context, 'Triceps', Icons.fitness_center),
            _buildProgramCard(context, 'Shoulders', Icons.fitness_center),
            _buildProgramCard(context, 'Legs', Icons.fitness_center),
            _buildProgramCard(context, 'Forearms', Icons.fitness_center),
            _buildProgramCard(context, 'Abs', Icons.fitness_center),
          ],
        ),
      ),
    );
  }

  Widget _buildProgramCard(BuildContext context, String title, IconData icon) {
    return Card(
      elevation: 4.0,
      color: Colors.lightBlueAccent,
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48.0, color: Colors.white),
            const SizedBox(height: 8.0),
            Text(
              title,
              style: const TextStyle(
                fontSize: 20.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
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
        return ['Bench Press', 'Incline Dumbbell Press', 'Chest Fly'];
      case 'Back':
        return ['Pull-ups', 'Deadlift', 'Bent-over Rows'];
      case 'Biceps':
        return ['Barbell Curls', 'Hammer Curls', 'Concentration Curls'];
      case 'Triceps':
        return ['Tricep Dips', 'Skull Crushers', 'Close-grip Bench Press'];
      case 'Shoulders':
        return ['Overhead Press', 'Lateral Raise', 'Front Raise'];
      case 'Legs':
        return ['Squats', 'Leg Press', 'Lunges'];
      case 'Forearms':
        return ['Wrist Curls', 'Reverse Wrist Curls', 'Farmer’s Walk'];
      case 'Abs':
        return ['Crunches', 'Planks', 'Leg Raises'];
      default:
        return ['Exercise 1', 'Exercise 2'];
    }
  }
}
