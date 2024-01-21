import 'package:flutter/material.dart';
import 'package:flutter_rest/screen/home_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  static const bgColor = Color(0xFFE7626C);
  static const textColor = Color(0xFF232B55);
  static const cardColor = Color(0xFFF4EDDB);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          backgroundColor: bgColor,
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            color: textColor,
          ),
        ),
        cardColor: cardColor,
      ),
      home: const HomeScreen(),
    );
  }
}
