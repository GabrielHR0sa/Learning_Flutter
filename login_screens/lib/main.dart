import 'package:flutter/material.dart';
import 'package:login_screens/pages/login_1.dart';
import 'package:login_screens/pages/login_2.dart';
import 'package:login_screens/pages/login_3.dart';
import 'package:login_screens/pages/signup_1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: ('/login3'),
      routes: {
        ('/sign1'): (context) => const SignUp1(),
        ('/login1'): (context) => const LoginOne(),
        ('/login2'): (context) => const LoginTwo(),
        ('/login3'): (context) => const LoginThree(),
      },
    );
  }
}
