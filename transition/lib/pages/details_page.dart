import 'package:animations/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final crew = ModalRoute.of(context)!.settings.arguments as Crew;
    final altura = MediaQuery.of(context).size.height;
    final largura = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Sobre',
            style: GoogleFonts.quicksand(
                fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                height: altura * 0.45,
                width: largura * 1,
                child: Stack(
                  children: [
                    Hero(
                      tag: crew.urlImage,
                      child: FittedBox(
                          fit: BoxFit.cover,
                          child: Padding(
                            padding: const EdgeInsets.all(50.0),
                            child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: crew.theme, width: 3)),
                                child: Image.network(crew.urlImage)),
                          )),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        height: altura * 0.07,
                        width: largura * 0.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(width: 3, color: crew.theme),
                          gradient: LinearGradient(
                            colors: [
                              Colors.black.withOpacity(0.5),
                              Colors.black.withOpacity(0.8),
                            ],
                            begin: AlignmentDirectional.topStart,
                            end: AlignmentDirectional.bottomEnd,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            crew.name,
                            style: GoogleFonts.ubuntu(
                                color: Colors.white, fontSize: 35),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        height: altura * 0.05,
                        width: largura * 0.5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(width: 3, color: crew.theme),
                          gradient: LinearGradient(
                            colors: [
                              Colors.black.withOpacity(0.5),
                              Colors.black.withOpacity(0.8),
                            ],
                            begin: AlignmentDirectional.topStart,
                            end: AlignmentDirectional.bottomEnd,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            crew.ocupation,
                            style: GoogleFonts.quicksand(
                                fontSize: 25, color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Idade',
                          style: GoogleFonts.quicksand(
                            fontSize: 20,
                            color: crew.theme,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const TextSpan(text: '\n'),
                        TextSpan(
                          text: crew.age,
                          style: GoogleFonts.quicksand(
                            fontSize: 17,
                            color: const Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ],
                    ),
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Altura',
                          style: GoogleFonts.quicksand(
                            fontSize: 20,
                            color: crew.theme,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const TextSpan(text: '\n'),
                        TextSpan(
                          text: crew.height,
                          style: GoogleFonts.quicksand(
                            fontSize: 17,
                            color: const Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ],
                    ),
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Akumanomi',
                          style: GoogleFonts.quicksand(
                            fontSize: 20,
                            color: crew.theme,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const TextSpan(text: '\n'),
                        TextSpan(
                            text: crew.devilFruit,
                            style: GoogleFonts.quicksand(
                                fontSize: 17,
                                color:
                                    const Color.fromARGB(255, 255, 255, 255))),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Recompensa: ',
                    style: GoogleFonts.ubuntu(
                      fontSize: 30,
                      color: crew.theme,
                    ),
                  ),
                  Text(
                    crew.bountry,
                    style: GoogleFonts.quicksand(
                      fontSize: 17,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: Colors.black.withOpacity(0.3),
                  elevation: 5,
                  shape: Border(
                      bottom: BorderSide(color: crew.theme, width: 3),
                      top: BorderSide(color: crew.theme, width: 3),
                      right: BorderSide(color: crew.theme, width: 3),
                      left: BorderSide(color: crew.theme, width: 3)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      crew.description,
                      style: GoogleFonts.quicksand(
                          fontSize: 20,
                          color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
