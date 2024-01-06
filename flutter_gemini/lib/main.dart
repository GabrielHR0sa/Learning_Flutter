import 'package:flutter/material.dart';
import 'package:flutter_gemini/home_page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      appBarTheme: const AppBarTheme(
        backgroundColor: Color.fromARGB(255, 86, 151, 135),
      ),
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color.fromARGB(255, 86, 151, 135),
      ),
      useMaterial3: true,
    ),
    home: const HomePage(),
  ));
}
