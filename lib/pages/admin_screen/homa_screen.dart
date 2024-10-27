import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:krushisevak/contoller/admin_controller/home_controller.dart';
import 'package:krushisevak/pages/admin_screen/add_product_page.dart';
import 'package:krushisevak/models/product_model/product.dart';
import 'package:krushisevak/pages/login_screen.dart';

class HomaScreen extends StatelessWidget {
  const HomaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController ctrl = Get.find<HomeController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
        actions: [
          IconButton(
            onPressed: () {
              final box = GetStorage();
              box.erase(); // Clears stored data
              Get.off(() => LoginScreen()); // Navigate back to LoginScreen
            },
            icon: Icon(Icons.logout),
          ),
        ],
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
              final product = products[index];
              return ListTile(
                title: Text(product.name ?? ""),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Price: ${(product.price ?? 0).toString()}"),
                    Text("Offer: ${product.offer ?? 'none'}"), // Display the offer as a string
                  ],
                ),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    ctrl.deleteProduct(product.id ?? "");
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
