import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pdf_handler_v1/src/home_page.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

List<dynamic> available = [];
List<dynamic> list = [];
int oldIndex = 0;
final availableHeigth = AppBar().preferredSize.height;

class OneListPage extends StatefulWidget {
  const OneListPage({super.key});

  @override
  State<OneListPage> createState() => _OneListPageState();
}

class _OneListPageState extends State<OneListPage> {
  @override
  void initState() {
    super.initState();
    list = available;
  }

  //limpa a lista de pdfs exibidos ao sair dessa página
  @override
  void dispose() {
    available = [];
    super.dispose();
  }

  _searchBy(String search) {
    setState(() {
      list = available
          .where(
            (element) =>
                element.toString().toLowerCase().contains(search.toLowerCase()),
          )
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final largura = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Conteúdo da lista',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          SizedBox(
            width: largura * 0.7,
            height: 35,
            child: TextFormField(
              onChanged: (value) {
                _searchBy(value);
              },
              cursorHeight: 20,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey,
                border: OutlineInputBorder(
                  borderSide: const BorderSide(width: 1, color: Colors.black),
                  borderRadius: BorderRadius.circular(20),
                ),
                suffixIcon: const Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              height: MediaQuery.of(context).size.height - availableHeigth,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  final file = list[index];
                  final kb = file.size / 1024;
                  final mb = kb / 1024;
                  final size = (mb >= 1)
                      ? '${mb.toStringAsFixed(2)} MB'
                      : '${kb.toStringAsFixed(2)} KB';
                  return Card(
                    elevation: 5,
                    margin: const EdgeInsets.all(10),
                    child: ListTile(
                      leading: const Icon(Icons.picture_as_pdf),
                      title: Text(file.name),
                      subtitle: Text(
                        'Tamanho: $size',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black54),
                      ),
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: (context) {
                            /*verify() {
                              if (oldIndex == index) {
                                return SfPdfViewer.file(
                                  File(file.path!),
                                );
                              } else {
                                return SfPdfViewer.file(
                                  File(list[index].path!),
                                );
                              }
                            }*/

                            return Container(
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(25),
                                  topRight: Radius.circular(25),
                                ),
                              ),
                              height: MediaQuery.of(context).size.height * 0.9,
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    color: Colors.teal,
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    width: double.infinity,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          icon: const Icon(
                                            Icons.arrow_circle_left_outlined,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Text(
                                          file.name,
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                        /*IconButton(
                                          onPressed: () {
                                            setState(() {
                                              oldIndex = index;
                                              index++;
                                            });
                                          },
                                          icon: const Icon(
                                            Icons.chevron_right_rounded,
                                            color: Colors.white,
                                          ),
                                        ),*/
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.85,
                                      child: SfPdfViewer.file(
                                        File(file.path!),
                                      ) //verify(),
                                      ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//pega a lista de pdfs que vem com a lista criada, e adiciona em uma lista para somente exibir os pdfs da lista selecionada
catchList(int val) {
  final pdf = content[val]['list'];
  for (int i = 0; i < pdf.length; i++) {
    available.add(pdf[i]);
  }
}
