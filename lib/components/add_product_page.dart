import 'package:flutter/material.dart';
import '../../models/model.dart';

class AddProductPage extends StatefulWidget {
  final Function(FishingProduct) onProductAdded;

  AddProductPage({super.key, required this.onProductAdded});

  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final _formKey = GlobalKey<FormState>();

  // Контроллеры для каждого поля
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final imageUrlController = TextEditingController();
  final priceController = TextEditingController();
  final brandController = TextEditingController();
  final typeController = TextEditingController();
  final materialsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Добавить новый товар'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'Название'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Пожалуйста, введите название';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: descriptionController,
                  decoration: const InputDecoration(labelText: 'Описание'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Пожалуйста, введите описание';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: imageUrlController,
                  decoration: const InputDecoration(labelText: 'URL изображения'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Пожалуйста, введите URL изображения';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: priceController,
                  decoration: const InputDecoration(labelText: 'Цена'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Пожалуйста, введите цену';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: brandController,
                  decoration: const InputDecoration(labelText: 'Бренд'),
                ),
                TextFormField(
                  controller: typeController,
                  decoration: const InputDecoration(labelText: 'Тип'),
                ),
                TextFormField(
                  controller: materialsController,
                  decoration: const InputDecoration(labelText: 'Материалы'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      // Создаем новый продукт
                      final newProduct = FishingProduct(
                        name: nameController.text,
                        description: descriptionController.text,
                        imageUrl: imageUrlController.text,
                        price: double.parse(priceController.text),
                        brand: brandController.text,
                        type: typeController.text,
                        materials: materialsController.text,
                      );

                      // Отправляем новый продукт в главный экран
                      widget.onProductAdded(newProduct);

                      // Закрываем экран добавления товара
                      Navigator.pop(context);
                    }
                  },
                  child: const Text('Добавить товар'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
