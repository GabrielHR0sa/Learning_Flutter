import 'dart:async';
import 'dart:convert';

import 'package:cep_search/src/services/cep_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _searchField = TextEditingController();

  final service = CepService();
  Map<String, dynamic> data = {};

  @override
  void initState() {
    super.initState();
  }

  _searchCEP() async {
    try {
      Response response;
      response = await service.getCEP(_searchField.text);
      String jsonDataString = response.body.toString();
      data = jsonDecode(jsonDataString);
    } catch (e) {
      data = {};
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: TextField(
            onEditingComplete: () {
              _searchCEP();

              FocusScope.of(context).unfocus();
            },
            controller: _searchField,
            decoration: const InputDecoration(
              filled: true,
              fillColor: Colors.white,
              labelText: 'Digite o Cep',
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                _searchCEP();
              },
              icon: const Icon(
                Icons.search,
              ),
            )
          ],
        ),
        body: Container(
          margin: const EdgeInsets.all(10),
          child: Center(
            child: Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Cep:  ',
                        style: GoogleFonts.openSans(
                          fontSize: 25,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: data['cep'].toString(),
                        style: GoogleFonts.openSans(
                          fontSize: 25,
                          fontWeight: FontWeight.w200,
                          color: Colors.black,
                        ),
                      ),
                      const TextSpan(text: '\n'),
                      TextSpan(
                        text: 'Rua:  ',
                        style: GoogleFonts.openSans(
                          fontSize: 25,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: data['logradouro'].toString(),
                        style: GoogleFonts.openSans(
                          fontSize: 25,
                          fontWeight: FontWeight.w200,
                          color: Colors.black,
                        ),
                      ),
                      const TextSpan(text: '\n'),
                      TextSpan(
                        text: 'Bairro:  ',
                        style: GoogleFonts.openSans(
                          fontSize: 25,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: data['bairro'].toString(),
                        style: GoogleFonts.openSans(
                          fontSize: 25,
                          fontWeight: FontWeight.w200,
                          color: Colors.black,
                        ),
                      ),
                      const TextSpan(text: '\n'),
                      TextSpan(
                        text: 'Cidade:  ',
                        style: GoogleFonts.openSans(
                          fontSize: 25,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: data['localidade'].toString(),
                        style: GoogleFonts.openSans(
                          fontSize: 25,
                          fontWeight: FontWeight.w200,
                          color: Colors.black,
                        ),
                      ),
                      const TextSpan(text: '\n'),
                      TextSpan(
                        text: 'Estado:  ',
                        style: GoogleFonts.openSans(
                          fontSize: 25,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: data['uf'].toString(),
                        style: GoogleFonts.openSans(
                          fontSize: 25,
                          fontWeight: FontWeight.w200,
                          color: Colors.black,
                        ),
                      ),
                      const TextSpan(text: '          '),
                      TextSpan(
                        text: 'DDD:  ',
                        style: GoogleFonts.openSans(
                          fontSize: 25,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: data['ddd'].toString(),
                        style: GoogleFonts.openSans(
                          fontSize: 25,
                          fontWeight: FontWeight.w200,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
