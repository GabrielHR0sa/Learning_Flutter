import 'package:flutter/material.dart';
import 'package:sig_testes/src/pages/home_page.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PreviewPage extends StatefulWidget {
  const PreviewPage({Key? key}) : super(key: key);

  @override
  State<PreviewPage> createState() => _PreviewPageState();
}

class _PreviewPageState extends State<PreviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Selecionar Pdfs'),
      ),
      body: Container(
        child: SfPdfViewer.file(file),
      ),
    );
  }
}
