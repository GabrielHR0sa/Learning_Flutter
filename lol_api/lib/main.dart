import 'package:animations/pages/details_page.dart';
import 'package:animations/pages/home_page.dart';
import 'package:animations/routes/routes.dart';
import 'package:animations/theme/theme_dark.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: darktheme,
        routes: {
          HOME: (context) => HomePage(),
          DETAILS: (context) => DetailsPage(),
        });
  }
}
