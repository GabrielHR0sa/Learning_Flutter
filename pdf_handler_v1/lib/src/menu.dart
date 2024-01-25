import 'dart:io';

import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    //drawer é um menu lateral que é chamado no drawer da home_page.dart
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                    Color.fromARGB(255, 3, 202, 182),
                    Color.fromARGB(255, 20, 99, 99),
                  ]),
            ),
            child: Center(
                child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
              ),
            )),
          ),
          ListTile(
            leading: const Icon(
              Icons.logout,
              color: Colors.red,
            ),
            title: const Text(
              'Sair',
              style: TextStyle(
                color: Colors.red,
              ),
            ),
            onTap: () {
              exit(0);
            },
          ),
        ],
      ),
    );
  }
}
