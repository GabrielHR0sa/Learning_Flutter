import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() quandoReiniciarQuestionario;

  const Resultado(this.pontuacao, this.quandoReiniciarQuestionario,
      {super.key});

  String get fraseResultado {
    if (pontuacao == 10) {
      return 'Parabéns! \n Número de acertos: $pontuacao';
    } else if (pontuacao < 10 && pontuacao >= 7) {
      return 'Você é bom! \n Número de acertos: $pontuacao';
    } else if (pontuacao < 7 && pontuacao >= 5) {
      return 'Razoável! \n Número de acertos: $pontuacao';
    } else if (pontuacao < 5 && pontuacao >= 1) {
      return 'Precisa Melhorar! \n Número de acertos: $pontuacao';
    } else {
      return 'Não foi dessa vez! \n Número de acertos: $pontuacao';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            fraseResultado,
            style: const TextStyle(
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
          onPressed: quandoReiniciarQuestionario,
          style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
          child: const Text(
            'Reiniciar?',
            style: TextStyle(
              fontSize: 18,
              color: Color.fromARGB(255, 73, 73, 73),
            ),
          ),
        ),
      ],
    );
  }
}
