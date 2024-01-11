import 'dart:async';

import 'package:cep_search/src/bloc/cep_bloc.dart';
import 'package:cep_search/src/bloc/cep_event.dart';
import 'package:cep_search/src/bloc/cep_sate.dart';
import 'package:cep_search/src/services/cep_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FormularioCep extends StatefulWidget {
  const FormularioCep({super.key});

  @override
  State<FormularioCep> createState() => _FormularioCepState();
}

class _FormularioCepState extends State<FormularioCep> {
  final _searchField = TextEditingController();

  late StreamSubscription sub;
  final bloc = CepBloc(CepService());
  final service = CepService();
  Map<String, dynamic> data = {};

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget body = Container();
    final state = bloc.state;

    if (state is InitialState) {
      body = Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _searchField,
                        onChanged: service.setCep,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(255, 196, 196, 196),
                          labelText: 'Cep',
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                        child: IconButton(
                      onPressed: () {
                        sub = bloc.stream.listen((event) {
                          setState(() {});
                        });
                        WidgetsBinding.instance
                            .addPostFrameCallback((timeStamp) {
                          bloc.add(CatchCep(_searchField.text));
                        });

                        FocusScope.of(context).unfocus();
                      },
                      icon: const Icon(Icons.search),
                    )),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                onChanged: service.setCidade,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Color.fromARGB(255, 196, 196, 196),
                  labelText: 'Cidade',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                onChanged: service.setBairro,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Color.fromARGB(255, 196, 196, 196),
                  labelText: 'Bairro',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                onChanged: service.setRua,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Color.fromARGB(255, 196, 196, 196),
                  labelText: 'Rua',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: TextFormField(
                        onChanged: service.setEstado,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(255, 196, 196, 196),
                          labelText: 'Estado',
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: TextFormField(
                        onChanged: service.setDDD,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(255, 196, 196, 196),
                          labelText: 'DDD',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                onPressed: () {
                  service.catchForm();
                },
                child: const Text('Salvar'),
              ),
            ],
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
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Text(
                'Nenhum endereço encontrado',
                style: GoogleFonts.ubuntu(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).popAndPushNamed('/');
                },
                child: const Text('OK'),
              ),
            ],
          ),
        ),
      );
    }
    if (state is SuccessState) {
      final data = state.map;
      if (data.containsKey('erro')) {
        body = Center(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                Text(
                  'Nenhum endereço encontrado',
                  style: GoogleFonts.ubuntu(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).popAndPushNamed('/');
                  },
                  child: const Text('OK'),
                ),
              ],
            ),
          ),
        );
      } else {
        body = Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: TextFormField(
                        onChanged: service.setCidade,
                        controller: _searchField,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(255, 196, 196, 196),
                          labelText: 'Cep',
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                        child: IconButton(
                      onPressed: () {
                        sub = bloc.stream.listen((event) {
                          setState(() {});
                        });
                        WidgetsBinding.instance
                            .addPostFrameCallback((timeStamp) {
                          bloc.add(CatchCep(_searchField.text));
                        });

                        FocusScope.of(context).unfocus();
                      },
                      icon: const Icon(Icons.search),
                    )),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                //initialValue: data['localidade'].toString(),
                controller: TextEditingController(
                  text: data['localidade'].toString(),
                ),
                onEditingComplete: () {
                  var teste = data['localidade'].toString();
                  service.setCidade(teste);
                },
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Color.fromARGB(255, 196, 196, 196),
                  labelText: 'Cidade',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                initialValue: data['bairro'].toString(),
                onChanged: service.setBairro,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Color.fromARGB(255, 196, 196, 196),
                  labelText: 'Bairro',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                initialValue: data['logradouro'].toString(),
                onChanged: service.setRua,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Color.fromARGB(255, 196, 196, 196),
                  labelText: 'Rua',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: TextFormField(
                        initialValue: data['uf'].toString(),
                        onChanged: service.setEstado,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(255, 196, 196, 196),
                          labelText: 'Estado',
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: TextFormField(
                        initialValue: data['ddd'].toString(),
                        onChanged: service.setDDD,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(255, 196, 196, 196),
                          labelText: 'DDD',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                onPressed: () {
                  service.catchForm();
                },
                child: const Text('Salvar'),
              ),
            ],
          )),
        );
      }
    }

    return Column(
      children: [body],
    );
  }
}
