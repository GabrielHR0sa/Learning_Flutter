import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:pdf_handler_v1/src/home_page.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

File choosedFile = File('');
Map fields = {};
TextEditingController _title = TextEditingController();
TextEditingController _description = TextEditingController();

class FileListPage extends StatefulWidget {
  const FileListPage({super.key});

  @override
  State<FileListPage> createState() => _FileListPageState();
}

//pega o tamanho da barra do topo
final availableHeigth = AppBar().preferredSize.height;

class _FileListPageState extends State<FileListPage> {
  List<PlatformFile> files = [];

  //adiciona as listas salvas (files) em uma lista principal (content)
  addList(String name, String description, List lst) {
    var fields = {
      'name': name,
      'description': description,
      'list': lst,
    };
    setState(() {
      //adiciona mais um item na lista na sequência do index
      content.add(fields);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Criar Nova Lista',
            style: TextStyle(color: Colors.white, letterSpacing: 2),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.add_circle_outline,
              color: Colors.white,
            ),
            onPressed: () async {
              //aguarda o usuário selecionar um novo arquivo
              final result = await FilePicker.platform.pickFiles(
                withReadStream: true,
                allowMultiple: true,
                type: FileType.custom,
                allowedExtensions: ['pdf'],
              );
              //se tiver selecionado algum arquivo, salva ele em uma lista (files)
              if (result != null) {
                files = files + result.files;
                setState(() {});
              }
            },
          ),
          //Salva a lista de arquivos selecionados
          IconButton(
            onPressed: () async {
              await showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.4,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 1,
                                      color: Colors.black,
                                    ),
                                  ),
                                  labelText: 'Titulo',
                                ),
                                controller: _title,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 1,
                                      color: Colors.black,
                                    ),
                                  ),
                                  labelText: 'Descrição',
                                ),
                                controller: _description,
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.teal),
                              onPressed: () {
                                Navigator.of(context).pop();
                                Navigator.of(context).pop();
                              },
                              child: const Text(
                                'Salvar',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  });
              //chama a função addList para adicionar um novo item passando os campos digitados como título e descrição e files(pdfs selecionados para aquela lista)
              addList(_title.text, _description.text, files);
              //altera o estado e limpa os campos de texto para nova digitação futura
              setState(() {
                _title.clear();
                _description.clear();
              });
            },
            icon: const Icon(
              Icons.save,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height - availableHeigth,
        width: MediaQuery.of(context).size.width,
        //Exibe a lista de pdfs selecionados, e quando clicado exibe seu conteúdo
        child: ListView.builder(
          itemCount: files.length,
          itemBuilder: (context, index) {
            final file = files[index];
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
                title: Text(
                  file.name,
                ),
                subtitle: Text(
                  'Tamanho: $size',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black54),
                ),
                trailing: IconButton(
                  onPressed: () {
                    setState(() {
                      files.removeAt(index);
                    });
                  },
                  icon: const Icon(
                    Icons.delete_forever,
                    color: Colors.red,
                  ),
                ),
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (context) {
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
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
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
                                      Container(
                                        width: 50,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.85,
                                    child: SfPdfViewer.file(File(file.path!))),
                              ],
                            ));
                      });
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
