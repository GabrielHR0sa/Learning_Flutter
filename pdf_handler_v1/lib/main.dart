import 'package:flutter/material.dart';
import 'package:pdf_handler_v1/src/files_list.dart';
import 'package:pdf_handler_v1/src/home_page.dart';
import 'package:pdf_handler_v1/src/one_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //temas e cores do app
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Colors.teal),
        scaffoldBackgroundColor: const Color.fromARGB(255, 51, 51, 51),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      //rota inicial
      initialRoute: ('/'),
      //rotas do app para navegação entre telas
      routes: {
        ('/fileList'): (context) => const FileListPage(),
        ('/'): (context) => const HomePage(),
        ('/one'): (context) => const OneListPage(),
      },
    );
  }
}
