import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'About Us',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo image
            Center(
              child: Image.asset(
                'assets/images/logo.png', // Replace with your logo asset path
                height: 120,
                width: 120,
              ),
            ),
            const SizedBox(height: 20),
            // Text below the image
            const Text(
              'Welcome to FitGenius!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Fit-Genius is your personalized fitness companion. '
              'Whether you want to lose weight, gain muscle, or maintain a balanced lifestyle, '
              'we provide customized workouts and nutrition plans tailored to your needs. '
              'With options for underweight, overweight, and balanced weight groups, '
              'you can find the perfect workout routine and food options to achieve your goals. '
              'Start your fitness journey today!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
