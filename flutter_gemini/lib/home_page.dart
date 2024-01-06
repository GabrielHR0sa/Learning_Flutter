import 'package:flutter/material.dart';
import 'package:flutter_gemini/only_text.dart';
import 'package:flutter_gemini/text_and_image.dart';

List<String> titles = <String>[
  'Apenas Texto',
  'Imagem e Texto',
];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const int tabsCount = 2;

    return DefaultTabController(
      initialIndex: 1,
      length: tabsCount,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Google Gemini"),
          centerTitle: true,
          notificationPredicate: (ScrollNotification notification) {
            return notification.depth == 1;
          },
          scrolledUnderElevation: 4.0,
          shadowColor: Theme.of(context).shadowColor,
          bottom: TabBar(
            labelColor: Colors.yellow,
            indicatorColor: Colors.yellow,
            tabs: <Widget>[
              Tab(
                text: titles[0],
              ),
              Tab(
                text: titles[1],
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            TextOnly(),
            TextWithImage(),
          ],
        ),
      ),
    );
  }
}
