import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:pdf/widgets.dart' as pw;

var campPesqQr = TextEditingController();
var campPesqBar = TextEditingController();
final pdf = pw.Document();
File file = File('');

savePDF() async {
  final save = File('teste.pdf');
  await save.writeAsBytes(await pdf.save());
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

double availableHeight = AppBar().preferredSize.height;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final altura = MediaQuery.of(context).size.height;
    final largura = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Testes')),
      ),
      body: Container(
        height: altura - availableHeight,
        width: largura * 1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: largura * 0.4,
                      child: ElevatedButton.icon(
                        onPressed: () async {
                          var texto = await FlutterBarcodeScanner.scanBarcode(
                              '#FFFFFF', 'Cancelar', true, ScanMode.QR);
                          if (texto != '-1' && texto.isNotEmpty) {
                            campPesqQr.text = texto;
                          }
                          ;
                        },
                        icon: const Icon(Icons.qr_code),
                        label: const Text('Scan QRcode'),
                      ),
                    ),
                    SizedBox(
                      width: largura * 0.4,
                      child: ElevatedButton.icon(
                        onPressed: () async {
                          var texto = await FlutterBarcodeScanner.scanBarcode(
                              '#FFFFFF', 'Cancelar', true, ScanMode.BARCODE);
                          if (texto != '-1' && texto.isNotEmpty) {
                            campPesqBar.text = texto;
                          }
                          ;
                        },
                        icon: const Icon(CupertinoIcons.barcode),
                        label: const Text('Scan BarCode'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: largura * 0.4,
                      child: ElevatedButton.icon(
                        onPressed: () async {
                          Navigator.of(context).pushNamed('/print');
                        },
                        icon: const Icon(Icons.print),
                        label: const Text('Print'),
                      ),
                    ),
                    SizedBox(
                      width: largura * 0.4,
                      child: ElevatedButton.icon(
                        onPressed: () async {
                          FilePickerResult? result =
                              await FilePicker.platform.pickFiles(
                            type: FileType.custom,
                            allowedExtensions: ['pdf'],
                          );
                          if (result != null) {
                            file = File(result.files.single.path!);
                          }
                          Navigator.of(context).pushNamed('/preview');
                        },
                        icon: const Icon(Icons.picture_as_pdf_sharp),
                        label: const Text('Visualizar'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: largura * 0.4,
                      child: ElevatedButton.icon(
                        onPressed: () async {
                          Navigator.of(context).pushNamed('/change');
                        },
                        icon: const Icon(Icons.change_circle),
                        label: const Text('PageView'),
                      ),
                    ),
                    SizedBox(
                      width: largura * 0.4,
                      child: ElevatedButton.icon(
                        onPressed: () async {
                          Navigator.of(context).pushNamed('/products');
                        },
                        icon: const Icon(Icons.shopping_cart),
                        label: const Text('Shopping cart'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 30),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const Text('Valor recebido do código QR:'),
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 1, color: Colors.black),
                            borderRadius: BorderRadius.circular(20)),
                        filled: true,
                        fillColor: const Color.fromARGB(255, 223, 223, 223),
                      ),
                      controller: campPesqQr,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 30),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const Text('Valor recebido do código de Barras:'),
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 1, color: Colors.black),
                            borderRadius: BorderRadius.circular(20)),
                        filled: true,
                        fillColor: const Color.fromARGB(255, 223, 223, 223),
                      ),
                      controller: campPesqBar,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
