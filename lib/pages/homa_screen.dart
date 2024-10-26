// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:krushisevak/pages/add_product_page.dart';
import 'package:get/route_manager.dart';

class HomaScreen extends StatelessWidget {
  const HomaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Title $index'),
            subtitle: Text('Price : 150'),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                print('Delete item at index: $index');
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Get.to(() => AddProductPage());
      },child: Icon(Icons.add),),
    );
  }
}
