import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:krushisevak/contoller/admin_controller/home_controller.dart';
import 'package:krushisevak/widgets/drop_down_btn.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (ctrl) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Add Product'),
          ),
          body: SingleChildScrollView(
            child: SizedBox(
              width: double.maxFinite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Add New Product',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),

                  // Product Name TextField
                  TextField(
                    controller: ctrl.textnamectrl,
                    decoration: InputDecoration(
                      labelText: 'Product Name',
                      labelStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.grey, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.blue, width: 2),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  // Product Description TextField
                  TextField(
                    maxLines: 4,
                    controller: ctrl.textdescriptionctrl,
                    decoration: InputDecoration(
                      labelText: 'Product Description',
                      labelStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.grey, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.blue, width: 2),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  // Image URL TextField
                  TextField(
                    controller: ctrl.textimagectrl,
                    decoration: InputDecoration(
                      labelText: 'Image URL',
                      labelStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.grey, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.blue, width: 2),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  // Price TextField
                  TextField(
                    controller: ctrl.textpricectrl,
                    decoration: InputDecoration(
                      labelText: 'Price',
                      labelStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.grey, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.blue, width: 2),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 20),

                  // Dropdown for Category and Brand
                  Row(
                    children: [
                      Flexible(
                        child: DropDownBtn(
                          items: const ['vegetable', 'fruit', 'flower', 'grossery'],
                          selectedItemText: ctrl.category,
                          onSelected: (selectValue) {
                            ctrl.category = selectValue ?? "general";
                            ctrl.update();
                          },
                        ),
                      ),
                      Flexible(
                        child: DropDownBtn(
                          items: const ['low', 'mid', 'high'],
                          selectedItemText: ctrl.brand,
                          onSelected: (selectValue) {
                            ctrl.brand = selectValue ?? "general";
                            ctrl.update();
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),

                  // Offer Dropdown
                  Text('Offer on product?'),
                  DropDownBtn(
                    items: const ['none', 'discount', 'limited'],
                    selectedItemText: ctrl.offer, // Display as string
                    onSelected: (selectValue) {
                      ctrl.offer = selectValue ?? 'none'; // Assign selected value
                      ctrl.update();
                    },
                  ),
                  SizedBox(height: 20),

                  // Add Product Button
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigoAccent,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      ctrl.addProduct();
                    },
                    child: const Text('Add Product'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
