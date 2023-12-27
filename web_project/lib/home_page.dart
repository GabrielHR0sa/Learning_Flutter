import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_project/sistemas.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final altura = MediaQuery.of(context).size.height;
    final largura = MediaQuery.of(context).size.width;
    final sistemas = Sistemas();
    return Scaffold(
      appBar: AppBar(
        leading: Center(
            child: Text(
          'TMI',
          style: GoogleFonts.openSans(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 253, 207, 0),
          ),
        )),
        title: Text(
          'The Master Informática',
          style: GoogleFonts.openSans(
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'Início',
              style: GoogleFonts.openSans(
                color: Colors.black,
                fontWeight: FontWeight.w200,
              ),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Sistemas',
              style: GoogleFonts.openSans(
                color: Colors.black,
                fontWeight: FontWeight.w200,
              ),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Portifólio',
              style: GoogleFonts.openSans(
                color: Colors.black,
                fontWeight: FontWeight.w200,
              ),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Sobre',
              style: GoogleFonts.openSans(
                color: Colors.black,
                fontWeight: FontWeight.w200,
              ),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Contato',
              style: GoogleFonts.openSans(
                color: Colors.black,
                fontWeight: FontWeight.w200,
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Column(
            children: [
              Container(
                height: altura * 0.5,
                width: largura * 1,
                color: Colors.amber,
              ),
              const SizedBox(
                height: 50,
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'CONHEÇA NOSSOS SISTEMAS',
                      style: GoogleFonts.quicksand(
                        fontSize: 30,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const TextSpan(text: '\n'),
                    TextSpan(
                      text:
                          'Trabalhamos com sistemas prontos ou personalizados \n conforme a necessidade dos clientes',
                      style: GoogleFonts.quicksand(
                        fontSize: 15,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              sistemas
            ],
          ),
        ],
      ),
    );
  }
}
