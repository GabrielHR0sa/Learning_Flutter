import 'package:flutter/material.dart';
import 'package:pdf_handler_v1/src/menu.dart';
import 'package:pdf_handler_v1/src/one_list.dart';

List<dynamic> content = [];
final menu = const Menu();

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: menu,
      appBar: AppBar(
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(
              Icons.menu_rounded,
              color: Colors.white,
            ),
          );
        }),
        title: const Center(
          child: Text(
            'Início',
            style: TextStyle(color: Colors.white, letterSpacing: 2),
          ),
        ),
        actions: [
          IconButton(
              //navega para a pagina files_list.dart para adicionar uma nova lista
              onPressed: () {
                Navigator.of(context)
                    .pushNamed('/fileList')
                    //.then pega o retorno a essa página e atualiza o content(lista principal que recebe as listas criadas)
                    .then((value) => setState(() {
                          content;
                        }));
              },
              icon: const Icon(
                Icons.add_to_photos_sharp,
                color: Colors.white,
              ))
        ],
      ),
      //exibe as listas criadas, com o título e descrição, ao clicar nela abre a lista e exibe seus pdfs
      body: ListView.builder(
          itemCount: content.length,
          itemBuilder: (context, index) {
            final listof = content[index];
            final indx = content.indexOf(listof);
            return Card(
              child: ListTile(
                leading: ClipOval(
                  child: Container(
                    height: 30,
                    width: 30,
                    color: Colors.teal,
                    child: Center(
                      child: Text(
                        '${listof['name']}',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                title: Text(
                  '${listof['description']}',
                ),
                trailing: IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            child: Container(
                              height: 200,
                              width: 300,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  const Text('Excluir lista?'),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('Não'),
                                      ),
                                      ElevatedButton(
                                        //remove a lista criada da lista principal
                                        onPressed: () {
                                          setState(() {
                                            content.removeAt(index);
                                          });
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('Sim'),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  },
                  icon: const Icon(
                    Icons.delete_forever,
                    color: Colors.red,
                  ),
                ),
                onTap: () {
                  catchList(indx);
                  Navigator.of(context).pushNamed('/one');
                },
              ),
            );
          }),
    );
  }
}
