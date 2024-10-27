import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:krushisevak/contoller/home_controller.dart';
import 'package:krushisevak/pages/admin_screen/add_product_page.dart';
import 'package:krushisevak/models/product.dart';

class HomaScreen extends StatelessWidget {
  const HomaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController ctrl = Get.find<HomeController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
      ),
      body: StreamBuilder<List<Product>>(
        stream: ctrl.fetchProductsStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }
          final products = snapshot.data ?? [];
          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(products[index].name ?? ""),
                subtitle: Text((products[index].price ?? 0).toString()),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    ctrl.deleteProduct(products[index].id ?? "");
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => AddProductPage());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
