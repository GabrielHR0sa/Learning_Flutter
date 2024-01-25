import 'package:flutter/material.dart';
import 'package:sig_testes/src/pages/cart/colors.dart';
import 'package:sig_testes/src/pages/cart/products.dart';
import 'package:sig_testes/src/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
        scaffoldBackgroundColor: Color.fromARGB(255, 32, 32, 32),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
        useMaterial3: true,
      ),
      initialRoute: ('/'),
      routes: {
        ('/'): (context) => const HomePage(),
        ('/products'): (context) => const ProductsPage(),
        ('/colors'): (context) => const ColorsPage(),
      },
    );
  }
}
