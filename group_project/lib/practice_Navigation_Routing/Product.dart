// ignore_for_file: use_key_in_widget_constructors, file_names

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product Navigation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          color: Color.fromARGB(255, 83, 173, 246), // Background color
          titleTextStyle: TextStyle(
            color: Colors.white, // Text color
            fontSize: 20, // Font size
          ),
        ),
      ),
      home: ProductListPage(),
    );
  }
}

class Product {
  final String name;
  final String description;
  final int price;
  final String color;
  final double rating;

  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.color,
    required this.rating,
  });
}

class ProductListPage extends StatelessWidget {
  final List<Product> products = [
    Product(
      name: 'Pixel 1',
      description: 'Pixel is the most featureful phone ever',
      price: 800,
      color: 'blue',
      rating: 4.5,
    ),
    Product(
      name: 'Laptop',
      description: 'Laptop is the most productive development tool',
      price: 2000,
      color: 'green',
      rating: 4.0,
    ),
    Product(
      name: 'Tablet',
      description: 'Tablet is the most useful device ever for meeting',
      price: 1500,
      color: 'yellow',
      rating: 3.5,
    ),
    Product(
      name: 'Pen drive',
      description: 'iPhone is the stylist phone ever',
      price: 100,
      color: 'orange',
      rating: 3.0,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Navigation'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ProductDetailsPage(product: products[index]),
                ),
              );
            },
            child: Card(
              child: Row(
                children: [
                  Container(
                    color: _getColorFromName(products[index].color),
                    height: 150,
                    width: 200,
                    padding: const EdgeInsets.all(20.0),
                    child: Center(
                      child: Text(
                        products[index].name,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 35),
                        textAlign: TextAlign.center,
                        selectionColor: const Color.fromARGB(255, 20, 20, 236),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            products[index].description,
                            style: const TextStyle(color: Colors.black),
                          ),
                          const SizedBox(
                            height: 15,
                            width: 20,
                          ),
                          Text(
                            'Price: ${products[index].price}',
                            style: const TextStyle(color: Colors.black),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Row(
                              children: List.generate(3, (i) {
                                return Icon(
                                  i < products[index].rating
                                      ? Icons.star_border
                                      : Icons.star_border,
                                  color: Colors.red,
                                );
                              }),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Color _getColorFromName(String colorName) {
    switch (colorName) {
      case 'blue':
        return const Color.fromARGB(255, 35, 35, 214);
      case 'green':
        return const Color.fromARGB(255, 13, 207, 20);
      case 'yellow':
        return const Color.fromARGB(255, 222, 202, 26);
      case 'orange':
        return const Color.fromARGB(255, 174, 54, 56);
      default:
        return const Color.fromRGBO(249, 251, 253, 1);
    }
  }
}

class ProductDetailsPage extends StatelessWidget {
  final Product product;

  const ProductDetailsPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                color: _getColorFromName(product.color),
                width: double.infinity,
                height: 300,
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Text(
                    product.name,
                    style: const TextStyle(color: Colors.white, fontSize: 50),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Pixel",
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 60),
                  Text(product.description),
                  const SizedBox(height: 60),
                  Text('Price: ${product.price}'),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 250, top: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(3, (i) {
                  return Icon(
                    i < product.rating ? Icons.star_border : Icons.star,
                    color: Colors.red,
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getColorFromName(String colorName) {
    switch (colorName) {
      case 'blue':
        return const Color.fromARGB(255, 20, 4, 196);
      case 'green':
        return Colors.green;
      case 'yellow':
        return Colors.yellow;
      case 'orange':
        return Colors.orange;
      default:
        return Colors.white;
    }
  }
}
