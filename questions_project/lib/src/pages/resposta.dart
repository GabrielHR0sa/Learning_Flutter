import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final void Function() quandoSelecionado;

  const Resposta(this.texto, this.quandoSelecionado, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          foregroundColor: Color.fromARGB(255, 73, 73, 73),
        ),
        onPressed: quandoSelecionado,
        child: Text(texto),
      ),
    );
  }
}
