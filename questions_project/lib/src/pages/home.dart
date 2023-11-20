import 'package:flutter/material.dart';
import 'package:questions_project/src/pages/questions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var selectedQuestion = 0;

  void response() {
    setState(() {
      selectedQuestion++;
    });

    print('Pergunta respondida');
  }

  final questions = [
    'Primeira pergunta',
    'Segunda pergunta',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Center(child: Text('Questions')),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 300,
            width: double.infinity,
            color: Colors.lightBlue,
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        child: Text('1'),
                      ),
                    ),
                    Text(questions[selectedQuestion]),
                  ],
                ),
                ElevatedButton(onPressed: response, child: Text('a')),
                ElevatedButton(onPressed: response, child: Text('b')),
                ElevatedButton(onPressed: response, child: Text('c')),
                ElevatedButton(onPressed: response, child: Text('d')),
              ],
            ),
          ),
        ],
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
