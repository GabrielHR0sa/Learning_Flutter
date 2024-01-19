import 'dart:typed_data';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:sig_testes/src/pages/home_page.dart';

class PrintPage extends StatefulWidget {
  const PrintPage({super.key});

  @override
  State<PrintPage> createState() => _PrintPageState();
}

double availableHeight = AppBar().preferredSize.height;

class _PrintPageState extends State<PrintPage> {
  @override
  Widget build(BuildContext context) {
    final altura = MediaQuery.of(context).size.height;
    final largura = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: const Text('PrintPage'),
        actions: [
          IconButton(
              onPressed: () async {
                Future<Uint8List> _generatePdf(
                    PdfPageFormat format, String title) async {
                  final pdf = pw.Document();

                  pdf.addPage(pw.Page(
                    pageFormat: PdfPageFormat.a4,
                    build: (context) => impressao(),
                  ));

                  return pdf.save();
                }

                const title = 'teste';
                await Printing.layoutPdf(
                    onLayout: (format) => _generatePdf(format, title));
              },
              icon: const Icon(Icons.print))
        ],
      ),
      body: Container(
          height: altura - availableHeight,
          width: largura * 1,
          child: Container(
            child: showPrint(campPesqQr.text, campPesqBar.text),
          )),
    );
  }

  impressao() {
    return pw.Container(
      child: pw.Container(
        decoration: pw.BoxDecoration(
          border: pw.Border.all(
            width: 1,
            color: PdfColor.fromHex('#000000'),
          ),
        ),
        child: pw.Column(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            pw.Padding(
              padding: pw.EdgeInsets.all(8.0),
              child: pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
                children: [
                  pw.Column(
                    children: [
                      pw.Text('Numero Código Qr:'),
                      pw.Text(campPesqQr.text),
                    ],
                  ),
                  pw.SizedBox(
                    width: 100,
                    child: pw.Column(
                      children: [
                        pw.Text('Informações adicionais'),
                        pw.Text('feinfanakv flmgasiiqwiqfqiwnfqpf nqpnfk'),
                      ],
                    ),
                  ),
                  pw.Column(
                    children: [
                      pw.Text('Numero Código de Barras:'),
                      pw.Text(campPesqBar.text),
                    ],
                  ),
                ],
              ),
            ),
            pw.Column(children: [
              pw.Padding(
                padding: const pw.EdgeInsets.all(8.0),
                child: pw.Text(
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry´s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'),
              ),
              pw.Padding(
                padding: const pw.EdgeInsets.all(8.0),
                child: pw.Text(
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry´s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and '),
              ),
            ]),
            pw.Padding(
              padding: const pw.EdgeInsets.all(8.0),
              child: pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
                children: [
                  pw.Column(
                    children: [
                      pw.Text('Total Pedido: '),
                      pw.Text('Total Líquido: '),
                      pw.Text('Total Bruto: '),
                    ],
                  ),
                  pw.Column(
                    children: [
                      pw.Text('R\$ 2000'),
                      pw.Text('R\$ 2000'),
                      pw.Text('R\$ 2000'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  showPrint(String recebeQr, String recebeBar) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Container(
        decoration:
            BoxDecoration(border: Border.all(width: 1, color: Colors.black)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 100,
                    child: Column(
                      children: [
                        const Text('Numero Código QR:'),
                        Text(recebeQr),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 100,
                    child: Column(
                      children: [
                        Text('Informações adicionais'),
                        Text('feinfanakv flmgasiiqwiqfqiwnfqpf nqpnfk'),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    child: Column(
                      children: [
                        const Text('Numero Código de Barras:'),
                        Text(recebeBar),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry´s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry´s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and '),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text('Total Pedido: '),
                      Text('Total Líquido: '),
                      Text('Total Bruto: '),
                    ],
                  ),
                  Column(
                    children: [
                      Text('R\$ 2000'),
                      Text('R\$ 2000'),
                      Text('R\$ 2000'),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
