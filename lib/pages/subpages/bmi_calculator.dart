import 'package:flutter/material.dart';

class BMICalculator extends StatefulWidget {
  const BMICalculator({super.key});

  @override
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  double _weight = 0.0;
  double _height = 0.0;
  double _bmiResult = 0.0;

  void _calculateBMI() {
    if (_weight > 0 && _height > 0) {
      setState(() {
        _bmiResult = _weight / ((_height / 100) * (_height / 100));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Weight (kg)',
              ),
              onChanged: (value) {
                setState(() {
                  _weight = double.parse(value);
                });
              },
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _heightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Height (cm)',
              ),
              onChanged: (value) {
                setState(() {
                  _height = double.parse(value);
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateBMI,
              child: const Text('Calculate BMI'),
            ),
            const SizedBox(height: 20),
            _bmiResult > 0
                ? Text(
                    'Your BMI: ${_bmiResult.toStringAsFixed(1)}',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
