class Products {
  String name;
  String modelo;
  double price;
  int qtd;
  List cores;
  Products({
    this.name = '',
    this.modelo = '',
    this.price = 0,
    this.qtd = 0,
    required this.cores,
  });

  static List<Products> getProducts() {
    return [
      Products(
        name: 'Camisa',
        modelo: 'Social',
        price: 69.90,
        qtd: 1,
        cores: ['Azul', 'Amarelo', 'Verde', 'Preto', 'Branco', 'Rosê', 'Palha'],
      ),
      Products(
        name: 'Calça',
        modelo: 'Jeans',
        price: 89.90,
        qtd: 1,
        cores: ['Marrom', 'Azul', 'Amarelo', 'Verde', 'Preto', 'Branco'],
      ),
      Products(
        name: 'Sapato',
        modelo: 'Social',
        price: 120.90,
        qtd: 1,
        cores: ['Azul', 'Amarelo', 'Verde', 'Preto', 'Branco'],
      ),
      Products(
        name: 'Camiseta',
        modelo: 'Gola Polo',
        price: 70.90,
        qtd: 1,
        cores: ['Rosê', 'Azul', 'Amarelo', 'Verde', 'Preto', 'Branco'],
      ),
      Products(
        name: 'Chapéu',
        modelo: 'Boné',
        price: 20.90,
        qtd: 1,
        cores: ['Verde', 'Azul', 'Amarelo', 'Preto', 'Branco'],
      ),
      Products(
        name: 'Tênis',
        modelo: 'Esportivo',
        price: 90.00,
        qtd: 1,
        cores: ['Amarelo', 'Azul', 'Verde', 'Preto', 'Branco'],
      ),
      Products(
        name: 'Chapéu',
        modelo: 'Gorro',
        price: 40.00,
        qtd: 1,
        cores: ['Preto', 'Azul', 'Amarelo', 'Verde', 'Branco'],
      ),
      Products(
        name: 'Shorts',
        modelo: 'Jeans',
        price: 59.90,
        qtd: 1,
        cores: ['Branco', 'Azul', 'Amarelo', 'Verde', 'Preto'],
      ),
      Products(
        name: 'Moletom',
        modelo: 'Blusa',
        price: 119.90,
        qtd: 1,
        cores: ['Cinza', 'Azul', 'Amarelo', 'Verde', 'Preto', 'Branco'],
      ),
      Products(
        name: 'Camiseta',
        modelo: 'Manga Longa',
        price: 39.90,
        qtd: 1,
        cores: ['Bege', 'Azul', 'Amarelo', 'Verde', 'Preto', 'Branco'],
      ),
    ];
  }
}
