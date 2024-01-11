import 'package:cep_search/src/pages/busca_cep.dart';
import 'package:cep_search/src/pages/formulario_cep.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPageIndex = 0;
  final form = FormularioCep();
  final search = BuscaCep();
  @override
  Widget build(BuildContext context) {
    final altura = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cep Handler'),
      ),
      bottomNavigationBar: NavigationBar(
        height: altura * 0.1,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.format_list_bulleted_rounded),
            label: 'Formulário',
            selectedIcon: Icon(
              Icons.format_list_bulleted_rounded,
              color: Colors.blue,
            ),
          ),
          NavigationDestination(
            icon: Icon(Icons.search),
            label: 'Buscar Cep',
            selectedIcon: Icon(
              Icons.search,
              color: Colors.blue,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: <Widget>[
          Column(
            children: [form],
          ),
          Column(
            children: [search],
          ),
        ][currentPageIndex],
      ),
    );
  }
}
