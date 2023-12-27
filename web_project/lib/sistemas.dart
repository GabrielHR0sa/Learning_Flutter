import 'package:flutter/material.dart';

class Sistemas extends StatelessWidget {
  const Sistemas({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Container(
            height: 200,
            width: 300,
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}
