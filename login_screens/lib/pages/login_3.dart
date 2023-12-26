import 'dart:ffi';

import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginThree extends StatefulWidget {
  const LoginThree({super.key});

  @override
  State<LoginThree> createState() => _LoginThreeState();
}

class _LoginThreeState extends State<LoginThree> {
  bool viewPass = false;
  @override
  Widget build(BuildContext context) {
    final altura = MediaQuery.of(context).size.height;
    final largura = MediaQuery.of(context).size.width;
    return Material(
      child: FittedBox(
        fit: BoxFit.cover,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Image.asset(
              'assets/images/login3.jpg',
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 100,
                ),
                Text(
                  'Login',
                  style: GoogleFonts.quicksand(
                      color: Colors.white,
                      fontSize: 60,
                      fontWeight: FontWeight.w200),
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  width: largura * 1,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    decoration: InputDecoration(
                      filled: false,
                      labelText: 'Email',
                      labelStyle: const TextStyle(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide:
                            const BorderSide(width: 1, color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide:
                            const BorderSide(width: 1, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  width: largura * 1,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    obscureText: !viewPass,
                    decoration: InputDecoration(
                      filled: false,
                      labelText: 'Password',
                      labelStyle: const TextStyle(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide:
                            const BorderSide(width: 1, color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide:
                            const BorderSide(width: 1, color: Colors.white),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            viewPass = !viewPass;
                          });
                        },
                        icon: Icon(
                          viewPass
                              ? CupertinoIcons.eye
                              : CupertinoIcons.eye_slash,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: altura * 0.06,
                  width: largura * 0.7,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple[300],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                    child: Text(
                      'Login',
                      style: GoogleFonts.quicksand(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: altura * 0.003,
                  width: largura * 1,
                  color: Colors.white,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Already have an account?',
                  style:
                      GoogleFonts.quicksand(color: Colors.white, fontSize: 17),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: altura * 0.06,
                  width: largura * 1,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: const BorderSide(
                                color: Colors.white, width: 1))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Icon(FontAwesomeIcons.google),
                        Text(
                          'SIGN IN WITH GOOGLE',
                          style: GoogleFonts.quicksand(),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: altura * 0.06,
                  width: largura * 1,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: const BorderSide(
                                color: Colors.white, width: 1))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Icon(FontAwesomeIcons.facebook),
                        Text(
                          'SIGN IN WITH FACEBOOK',
                          style: GoogleFonts.quicksand(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
