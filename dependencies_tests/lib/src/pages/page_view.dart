import 'package:flutter/material.dart';

class ChangePage extends StatefulWidget {
  const ChangePage({super.key});

  @override
  State<ChangePage> createState() => _ChangePageState();
}

class _ChangePageState extends State<ChangePage> {
  final controller = PageController(initialPage: 0);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PageView'),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.black,
            height: 50,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => controller.animateToPage(
                    0,
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeInOut,
                  ),
                  child: const Text('Home'),
                ),
                ElevatedButton(
                  onPressed: () => controller.animateToPage(
                    1,
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeInOut,
                  ),
                  child: const Text('Sobre'),
                ),
                ElevatedButton(
                  onPressed: () => controller.animateToPage(
                    2,
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeInOut,
                  ),
                  child: const Text('Contato'),
                ),
              ],
            ),
          ),
          Expanded(
            child: PageView(
              scrollDirection: Axis.vertical,
              controller: controller,
              children: [
                Container(
                  color: Colors.amber,
                  child: const Center(child: Text('Home')),
                ),
                Container(
                  color: Colors.red,
                  child: const Center(child: Text('Sobre')),
                ),
                Container(
                  color: Colors.green,
                  child: const Center(child: Text('Contato')),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
