import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

void main() => runApp(const PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final _perguntas = const [
    {
      'texto': 'Qual é o maior planeta do sistema solar?',
      'respostas': [
        {'texto': 'a) Terra', 'pontuacao': 0},
        {'texto': 'b) Marte', 'pontuacao': 0},
        {'texto': 'c) Vênus', 'pontuacao': 0},
        {'texto': 'd) Júpiter', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'Quem foi o primeiro presidente dos Estados Unidos?',
      'respostas': [
        {'texto': 'a) Abraham Lincoln', 'pontuacao': 0},
        {'texto': 'b) George Washington', 'pontuacao': 1},
        {'texto': 'c) Thomas Jefferson', 'pontuacao': 0},
        {'texto': 'd) John Adams', 'pontuacao': 0},
      ],
    },
    {
      'texto': 'Qual é a capital do Japão?',
      'respostas': [
        {'texto': 'a) Pequim', 'pontuacao': 0},
        {'texto': 'b) Seul', 'pontuacao': 0},
        {'texto': 'c) Tóquio', 'pontuacao': 1},
        {'texto': 'd) Bangcoc', 'pontuacao': 0},
      ],
    },
    {
      'texto': 'Quem escreveu "Romeu e Julieta"?',
      'respostas': [
        {'texto': 'a) William Shakespeare', 'pontuacao': 1},
        {'texto': 'b) Charles Dickens', 'pontuacao': 0},
        {'texto': 'c) Jane Austen', 'pontuacao': 0},
        {'texto': 'd) F. Scott Fitzgerald', 'pontuacao': 0},
      ],
    },
    {
      'texto': 'Qual é o maior oceano da Terra?',
      'respostas': [
        {'texto': 'a) Oceano Atlântico', 'pontuacao': 0},
        {'texto': 'b) Oceano Índico', 'pontuacao': 0},
        {'texto': 'c) Oceano Ártico', 'pontuacao': 0},
        {'texto': 'd) Oceano Pacífico', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'Em que ano a Primeira Guerra Mundial começou?',
      'respostas': [
        {'texto': 'a) 1914', 'pontuacao': 1},
        {'texto': 'b) 1918', 'pontuacao': 0},
        {'texto': 'c) 1939', 'pontuacao': 0},
        {'texto': 'd) 1945', 'pontuacao': 0},
      ],
    },
    {
      'texto': 'Quem é conhecido como o "pai da computação"?',
      'respostas': [
        {'texto': 'a) Steve Jobs', 'pontuacao': 0},
        {'texto': 'b) Bill Gates', 'pontuacao': 0},
        {'texto': 'c) Alan Turing', 'pontuacao': 1},
        {'texto': 'd) Tim Berners-Lee', 'pontuacao': 0},
      ],
    },
    {
      'texto': 'Qual é o rio mais longo do mundo?',
      'respostas': [
        {'texto': 'a) Nilo', 'pontuacao': 0},
        {'texto': 'b) Amazonas', 'pontuacao': 1},
        {'texto': 'c) Yangtzé', 'pontuacao': 0},
        {'texto': 'd) Mississipi', 'pontuacao': 0},
      ],
    },
    {
      'texto': 'Qual é o símbolo químico para o ouro?',
      'respostas': [
        {'texto': 'a) Ag', 'pontuacao': 0},
        {'texto': 'b) Fe', 'pontuacao': 0},
        {'texto': 'c) Au', 'pontuacao': 1},
        {'texto': 'd) Pb', 'pontuacao': 0},
      ],
    },
    {
      'texto': 'Quem pintou a Mona Lisa?',
      'respostas': [
        {'texto': 'a) Vincent van Gogh', 'pontuacao': 0},
        {'texto': 'b) Pablo Picasso', 'pontuacao': 0},
        {'texto': 'c) Leonardo da Vinci', 'pontuacao': 1},
        {'texto': 'd) Claude Monet', 'pontuacao': 0},
      ],
    }
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    final altura = MediaQuery.of(context).size.height;
    final largura = MediaQuery.of(context).size.width;
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: const Text('Questionário')),
        ),
        body: temPerguntaSelecionada
            ? Align(
                alignment: Alignment.center,
                child: Container(
                  height: altura * 0.8,
                  width: largura * 1,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 73, 73, 73),
                      borderRadius: BorderRadius.circular(20)),
                  child: Questionario(
                    perguntas: _perguntas,
                    perguntaSelecionada: _perguntaSelecionada,
                    quandoResponder: _responder,
                  ),
                ),
              )
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
