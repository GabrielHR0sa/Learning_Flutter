import 'package:flutter/material.dart';
import 'package:sig_testes/src/pages/cart/products_list.dart';

List<dynamic> colors = [];
final products = Products.getProducts();
var teste;

catchColors(int val) {
  final product = products[val].cores;
  for (int i = 0; i < product.length; i++) {
    colors.add(product[i]);
  }
}

class ColorsPage extends StatefulWidget {
  const ColorsPage({super.key});

  @override
  State<ColorsPage> createState() => _ColorsPageState();
}

class _ColorsPageState extends State<ColorsPage> {
  @override
  void dispose() {
    colors = [];
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Cores'),
        ),
        actions: [
          Container(
            width: 50,
          )
        ],
      ),
      body: ListView.builder(
          itemCount: colors.length,
          itemBuilder: (context, index) {
            final finalColor = colors[index];

            return Card(
              elevation: 5,
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              child: ListTile(
                title: Text(finalColor),
                leading: const Icon(Icons.color_lens),
                trailing: const Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  setState(() {
                    teste = finalColor;
                  });
                  getColor();
                  Navigator.of(context).pop();
                },
              ),
            );
          }),
    );
  }
}

getColor() {
  print(teste);
  return teste;
}
