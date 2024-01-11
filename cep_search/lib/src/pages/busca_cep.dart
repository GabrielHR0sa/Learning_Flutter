import 'dart:async';

import 'package:cep_search/src/bloc/cep_bloc.dart';
import 'package:cep_search/src/bloc/cep_event.dart';
import 'package:cep_search/src/bloc/cep_sate.dart';
import 'package:cep_search/src/services/cep_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BuscaCep extends StatefulWidget {
  const BuscaCep({super.key});

  @override
  State<BuscaCep> createState() => _BuscaCepState();
}

class _BuscaCepState extends State<BuscaCep> {
  final _searchField = TextEditingController();
  late StreamSubscription sub;
  final bloc = CepBloc(CepService());
  final service = CepService();
  Map<String, dynamic> data = {};

  @override
  void initState() {
    super.initState();
  }

  /* _searchCEP() async {
    try {
      Response response;
      response = await service.getCEP(_searchField.text);
      String jsonDataString = response.body.toString();
      data = jsonDecode(jsonDataString);
    } catch (e) {
      data = {};
    }
  }*/

  @override
  Widget build(BuildContext context) {
    Widget body = Container();
    final state = bloc.state;
    final altura = MediaQuery.of(context).size.height;
    final largura = MediaQuery.of(context).size.width;

    if (state is InitialState) {
      body = Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Text(
            'Busque por algum Cep',
            style: GoogleFonts.ubuntu(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
        ),
      );
    }
    if (state is LoadingState) {
      body = const Padding(
        padding: EdgeInsets.all(10),
        child: Center(
          child: SizedBox(
            height: 50,
            width: 50,
            child: CircularProgressIndicator(
              color: Colors.black,
            ),
          ),
        ),
      );
    }
    if (state is ExceptionState) {
      body = Center(
        child: TextButton(
          onPressed: () {
            bloc.add(CatchCep(_searchField.text));
          },
          child: Text(
            'Nenhum endereço encontrado',
            style: GoogleFonts.ubuntu(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
        ),
      );
    }
    if (state is SuccessState) {
      final data = state.map;
      if (data.containsKey('erro')) {
        body = Center(
          child: TextButton(
            onPressed: () {
              bloc.add(CatchCep(_searchField.text));
            },
            child: Text(
              'Nenhum endereço encontrado',
              style: GoogleFonts.ubuntu(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ),
        );
      } else {
        body = SingleChildScrollView(
          child: Center(
            child: Container(
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
            ),
          ),
        );
      }
    }

    return SizedBox(
      height: altura * 0.7,
      width: largura * 1,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: largura * 0.5,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      onEditingComplete: () {
                        sub = bloc.stream.listen((event) {
                          setState(() {});
                        });
                        WidgetsBinding.instance
                            .addPostFrameCallback((timeStamp) {
                          bloc.add(CatchCep(_searchField.text));
                        });

                        FocusScope.of(context).unfocus();
                      },
                      controller: _searchField,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(255, 196, 196, 196),
                        labelText: 'Digite o Cep',
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      sub = bloc.stream.listen((event) {
                        setState(() {});
                      });
                      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                        bloc.add(CatchCep(_searchField.text));
                      });
                    },
                    icon: const Icon(
                      Icons.search,
                    ),
                  ),
                ],
              ),
            ),
            body
          ],
        ),
      ),
    );
  }
}
