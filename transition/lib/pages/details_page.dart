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
          actions: [
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: ClipOval(child: Image.network(crew.urlImage)),
            )
          ],
        ),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
              height: altura * 0.5,
              width: largura * 1,
              child: Hero(
                tag: crew.urlImage,
                child: Image.network(crew.bodyImage),
              ),
            ),
            Container(
              height: altura * 0.35,
              width: largura * 0.9,
              decoration: BoxDecoration(
                color: crew.theme,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Stack(
                children: [
                  Container(
                    height: 50,
                    width: 150,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        crew.name,
                        style: GoogleFonts.ubuntu(
                            color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        crew.ocupation,
                        style: GoogleFonts.quicksand(fontSize: 15),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      margin: EdgeInsets.only(bottom: 5),
                      height: 180,
                      width: largura * 0.8,
                      child: Center(
                        child: Text(
                          crew.description,
                          style: GoogleFonts.quicksand(
                            fontSize: 12,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
