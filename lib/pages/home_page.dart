import 'package:flutter/material.dart';
import 'package:pks3/pages/product_detail.dart';
import '../components/add_product_page.dart'; 
import '../../models/model.dart';
import '../../components/item.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Список продуктов будет храниться в состоянии
  List<FishingProduct> products = fishingProducts;

  // Метод для обновления списка продуктов
  void addProduct(FishingProduct product) {
    setState(() {
      products.add(product);  // Добавляем новый товар в список
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Center(
          child: Text(
            'Fishing Gear',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailPage(product: products[index]),
                ),
              );
            },
            child: Item(product: products[index]),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // При нажатии открываем форму добавления товара
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddProductPage(onProductAdded: addProduct)),
          );
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.blueGrey,
      ),
    );
  }
}
