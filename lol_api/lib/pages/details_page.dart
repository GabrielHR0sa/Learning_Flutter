import 'package:animations/pages/champions.dart';
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
              SizedBox(
                height: altura * 0.3,
                width: largura * 1,
                child: Stack(
                  children: [
                    Hero(
                      tag: crew.urlImage,
                      child: FittedBox(
                          fit: BoxFit.cover,
                          child: Image.network(crew.urlImage)),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              crew.name,
                              style: GoogleFonts.bebasNeue(
                                  color: Colors.white,
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              crew.nick,
                              style: GoogleFonts.quicksand(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: 50,
                            width: largura * 0.3,
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
                                crew.function,
                                style: GoogleFonts.ubuntu(
                                    fontSize: 18, color: Colors.white),
                              ),
                            ),
                          ),
                          Container(
                            height: 50,
                            width: largura * 0.6,
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
                                'Dificuldade: ${crew.dificult}',
                                style: GoogleFonts.ubuntu(
                                    fontSize: 18, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: RichText(
                      textAlign: TextAlign.start,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '// Lore',
                            style: GoogleFonts.bebasNeue(
                              fontSize: 30,
                              color: crew.theme,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const TextSpan(text: '\n'),
                          TextSpan(
                            text: crew.description,
                            style: GoogleFonts.quicksand(
                              fontSize: 17,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      '// Habilidades',
                      style: GoogleFonts.bebasNeue(
                        fontSize: 30,
                        color: crew.theme,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(10),
                        child: Card(
                          elevation: 7,
                          color: crew.theme.withOpacity(0.5),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              title: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Passiva  -  ',
                                      style: GoogleFonts.bebasNeue(
                                          fontSize: 22, color: Colors.white),
                                    ),
                                    TextSpan(
                                      text: crew.passTitle,
                                      style: GoogleFonts.quicksand(
                                          fontSize: 22, color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              subtitle: Text(
                                crew.passDesc,
                                style: GoogleFonts.quicksand(
                                    fontSize: 17,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.white.withOpacity(0.6)),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: Card(
                          elevation: 7,
                          color: crew.theme.withOpacity(0.5),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              title: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Q  -  ',
                                      style: GoogleFonts.bebasNeue(
                                          fontSize: 22, color: Colors.white),
                                    ),
                                    TextSpan(
                                      text: crew.qTitle,
                                      style: GoogleFonts.quicksand(
                                          fontSize: 22, color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              subtitle: Text(
                                crew.qDesc,
                                style: GoogleFonts.quicksand(
                                    fontSize: 17,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.white.withOpacity(0.6)),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: Card(
                          elevation: 7,
                          color: crew.theme.withOpacity(0.5),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              title: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'W  -  ',
                                      style: GoogleFonts.bebasNeue(
                                          fontSize: 22, color: Colors.white),
                                    ),
                                    TextSpan(
                                      text: crew.wTitle,
                                      style: GoogleFonts.quicksand(
                                          fontSize: 22, color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              subtitle: Text(
                                crew.wDesc,
                                style: GoogleFonts.quicksand(
                                    fontSize: 17,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.white.withOpacity(0.6)),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: Card(
                          elevation: 7,
                          color: crew.theme.withOpacity(0.5),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              title: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'E  -  ',
                                      style: GoogleFonts.bebasNeue(
                                          fontSize: 22, color: Colors.white),
                                    ),
                                    TextSpan(
                                      text: crew.eTitle,
                                      style: GoogleFonts.quicksand(
                                          fontSize: 22, color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              subtitle: Text(
                                crew.eDesc,
                                style: GoogleFonts.quicksand(
                                    fontSize: 17,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.white.withOpacity(0.6)),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: Card(
                          elevation: 7,
                          color: crew.theme.withOpacity(0.5),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              title: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'R  -  ',
                                      style: GoogleFonts.bebasNeue(
                                          fontSize: 22, color: Colors.white),
                                    ),
                                    TextSpan(
                                      text: crew.rTitle,
                                      style: GoogleFonts.quicksand(
                                          fontSize: 22, color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              subtitle: Text(
                                crew.rDesc,
                                style: GoogleFonts.quicksand(
                                    fontSize: 17,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.white.withOpacity(0.6)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ));
  }
}
