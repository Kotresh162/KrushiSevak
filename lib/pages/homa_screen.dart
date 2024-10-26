// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:krushisevak/contoller/home_controller.dart';
import 'package:krushisevak/pages/add_product_page.dart';

class HomaScreen extends StatelessWidget {
  const HomaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (ctrl) {
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
    );
  }
}
