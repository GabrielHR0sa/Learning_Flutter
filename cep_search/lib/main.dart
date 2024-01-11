import 'package:cep_search/src/pages/busca_cep.dart';
import 'package:cep_search/src/pages/home_page.dart';
import 'package:cep_search/src/pages/formulario_cep.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: ('/'),
      routes: {
        ('/'): (context) => HomePage(),
        ('/search'): (context) => BuscaCep(),
        ('/form'): (context) => FormularioCep(),
      },
      theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromARGB(255, 228, 228, 228)),
    );
  }
}
