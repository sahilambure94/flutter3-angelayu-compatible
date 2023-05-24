import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/screens/input_page.dart';

void main() {
  runApp(const BMICalculator());
}

Color c = const Color(0xFF090C22);

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF090C22),
        appBarTheme: const AppBarTheme(color: Color(0xFF090C22)),
      ),
      home: const InputPage(),
    );
  }
}
