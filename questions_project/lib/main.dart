import 'package:flutter/material.dart';
import 'package:questions_project/src/pages/home.dart';

void main() {
  runApp(const QuestionApp());
}

class QuestionApp extends StatelessWidget {
  const QuestionApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 58, 148, 183)),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
