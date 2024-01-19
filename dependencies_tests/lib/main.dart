import 'package:flutter/material.dart';
import 'package:sig_testes/src/pages/cart/colors.dart';
import 'package:sig_testes/src/pages/cart/products.dart';
import 'package:sig_testes/src/pages/home_page.dart';
import 'package:sig_testes/src/pages/page_view.dart';
import 'package:sig_testes/src/pages/preview_pdf.dart';
import 'package:sig_testes/src/pages/print_page.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
        useMaterial3: true,
      ),
      initialRoute: ('/'),
      routes: {
        ('/'): (context) => const HomePage(),
        ('/print'): (context) => const PrintPage(),
        ('/preview'): (context) => const PreviewPage(),
        ('/change'): (context) => const ChangePage(),
        ('/products'): (context) => const ProductsPage(),
        ('/colors'): (context) => const ColorsPage(),
      },
    );
  }
}
