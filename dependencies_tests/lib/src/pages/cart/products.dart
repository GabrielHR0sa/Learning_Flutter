import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:sig_testes/src/pages/cart/colors.dart';
import 'package:sig_testes/src/pages/cart/products_list.dart';

List<dynamic> carrinho = [];
double sum = 0.0;
double totalSum = 0;
List<dynamic> teste = [];

NumberFormat formatter = NumberFormat('00.00');

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  final products = Products.getProducts();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: shoppingCart(),
      appBar: AppBar(
        title: const Center(
          child: Text('Produtos'),
        ),
        actions: [
          Builder(
            builder: (context) {
              return Stack(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: IconButton(
                      onPressed: () => Scaffold.of(context).openEndDrawer(),
                      icon: const Icon(
                        Icons.shopping_cart,
                        size: 30,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ClipOval(
                        child: Container(
                      color: Colors.blue,
                      height: 20,
                      width: 20,
                      child: Center(
                        child: Text(
                          carrinho.length.toString(),
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                    )),
                  ),
                ],
              );
            },
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 15),
        child: ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              final indx = products.indexOf(product);
              return Card(
                elevation: 5,
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                child: ListTile(
                  leading: const Icon(Icons.shopping_basket_rounded),
                  title: Text(
                    product.name,
                    style: GoogleFonts.montserrat(),
                  ),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(product.modelo,
                          style: GoogleFonts.montserrat(
                              color: Colors.black54,
                              fontStyle: FontStyle.italic)),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.green,
                            width: 2,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Text(
                            'R\$ ${product.price}',
                            style: GoogleFonts.montserrat(
                                color: Colors.green,
                                fontSize: 17,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                      ),
                    ],
                  ),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () async {
                    Navigator.pushNamed(context, '/colors').then((_) {
                      getColor();
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                content: Container(
                                  height: 150,
                                  width: 200,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      const Text('Adicionar ao  carrinho?'),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.redAccent,
                                            ),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text(
                                              'Não',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.green,
                                            ),
                                            onPressed: () {
                                              addChart(
                                                product.name,
                                                product.modelo,
                                                product.price,
                                                product.qtd,
                                                getColor(),
                                              );
                                              totSum(totalSum);
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text(
                                              'Sim',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ));
                    });
                    catchColors(indx);
                  },
                ),
              );
            }),
      ),
    );
  }

  shoppingCart() {
    final altura = MediaQuery.of(context).size.height;
    final largura = MediaQuery.of(context).size.width;
    return carrinho.isEmpty
        ? SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Drawer(
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: DrawerHeader(
                        decoration: BoxDecoration(color: Colors.blue[100]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: IconButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                icon: const Icon(
                                  Icons.arrow_circle_left_outlined,
                                  size: 40,
                                ),
                              ),
                            ),
                          ],
                        )),
                  ),
                  Align(
                    alignment: AlignmentDirectional.center,
                    child: Text(
                      'Nenhum produto no carrinho',
                      style: GoogleFonts.montserrat(
                          fontSize: 15, color: Colors.black),
                    ),
                  )
                ],
              ),
            ),
          )
        : SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Drawer(
              child: ListView(
                children: [
                  DrawerHeader(
                      decoration: BoxDecoration(color: Colors.blue[100]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: const Icon(
                                Icons.arrow_circle_left_outlined,
                                size: 40,
                              ),
                            ),
                          ),
                          Text(
                            'Lista de Itens',
                            style: GoogleFonts.montserrat(
                                fontSize: 20,
                                fontWeight: FontWeight.w200,
                                color: Colors.black),
                          ),
                        ],
                      )),
                  SingleChildScrollView(
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.5,
                      width: double.infinity,
                      child: ListView.builder(
                          itemCount: carrinho.length,
                          itemBuilder: (context, index) {
                            sum = carrinho[index]['qtd'] *
                                carrinho[index]['price'];

                            TextEditingController qtdController =
                                TextEditingController(
                                    text: carrinho[index]['qtd'].toString());
                            return Card(
                              elevation: 5,
                              margin: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 5),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Icon(
                                      Icons.shopping_bag_rounded,
                                      size: 40,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          carrinho[index]['name'],
                                          style: GoogleFonts.montserrat(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                        Text(
                                          carrinho[index]['modelo'],
                                          style: GoogleFonts.montserrat(
                                            color:
                                                Colors.black.withOpacity(0.5),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w200,
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                              color: Colors.green,
                                              width: 2,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(3.0),
                                            child: Text(
                                              'R\$ ${carrinho[index]['price'].toString()}',
                                              style: GoogleFonts.montserrat(
                                                  color: Colors.green,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w300),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              'Cor: ',
                                              style: GoogleFonts.montserrat(
                                                color: Colors.black,
                                                fontSize: 13,
                                              ),
                                            ),
                                            Text(
                                              carrinho[index]['color']
                                                  .toString(),
                                              style: GoogleFonts.montserrat(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w200,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  carrinho[index]['qtd']--;
                                                });

                                                if (carrinho[index]['qtd'] <=
                                                    0) {
                                                  carrinho.removeAt(index);
                                                }
                                              },
                                              icon: const Icon(
                                                  Icons.remove_circle_outline),
                                            ),
                                            Container(
                                              width: 20,
                                              child: TextField(
                                                textAlign: TextAlign.center,
                                                controller: qtdController,
                                              ),
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  totSum(totalSum);
                                                  carrinho[index]['qtd']++;
                                                });
                                              },
                                              icon: const Icon(
                                                  Icons.add_circle_outline),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: 'Total: ',
                                                style: GoogleFonts.montserrat(
                                                  fontWeight: FontWeight.w200,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              TextSpan(
                                                text:
                                                    'R\$ ${formatter.format(double.parse(sum.toString()))}',
                                                style: GoogleFonts.montserrat(
                                                    color: Colors.black),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                  Container(
                    color: Colors.blue[100],
                    height: MediaQuery.of(context).size.height * 0.27,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Total Pedido: ',
                                style: GoogleFonts.montserrat(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w300),
                              ),
                              TextSpan(
                                text:
                                    'R\$ ${formatter.format(double.parse(totSum(totalSum).toString()))}',
                                style: GoogleFonts.montserrat(
                                  color: Colors.black87,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Container(
                              height: altura * 0.06,
                              width: largura * 1,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: ElevatedButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                            content: Container(
                                              height: 150,
                                              width: 200,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  const Text(
                                                      'Deseja remover todos os itens do carrinho?'),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      ElevatedButton(
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          backgroundColor:
                                                              Colors.redAccent,
                                                        ),
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        child: const Text(
                                                          'Não',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ),
                                                      ElevatedButton(
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          backgroundColor:
                                                              Colors.green,
                                                        ),
                                                        onPressed: () {
                                                          removeChart();
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        child: const Text(
                                                          'Sim',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ));
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.redAccent,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    )),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Icon(
                                      Icons.remove_shopping_cart_outlined,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      'Limpar Pedido',
                                      style: GoogleFonts.montserrat(
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: altura * 0.06,
                              width: largura * 1,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    )),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Icon(
                                      Icons.shopping_cart_checkout,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      'Finalizar Pedido',
                                      style: GoogleFonts.montserrat(
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ),
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

  addChart(String name, String modelo, double price, int qtd, dynamic color) {
    var newProduct = {
      'name': name,
      'modelo': modelo,
      'price': price,
      'qtd': qtd,
      'color': color,
    };
    setState(() {
      carrinho.add(newProduct);
    });
  }

  totSum(double tot) {
    for (int i = 0; i < carrinho.length; i++) {
      tot = tot + carrinho[i]['qtd'] * carrinho[i]['price'];
    }
    return tot;
  }

  removeChart() {
    for (int i = 0; i < carrinho.length + 1; i++) {
      if (i == 1) {
        i = 0;
        setState(() {
          carrinho.removeAt(i);
        });
      } else {
        setState(() {
          carrinho.removeAt(i);
        });
      }
    }
  }
}
