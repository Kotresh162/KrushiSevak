import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:krushisevak/contoller/home_controller.dart';
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
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20), // Space between title and text field
        
                  // Product Name TextField
                  TextField(
                    controller: ctrl.textnamectrl,
                    decoration: InputDecoration(
                      labelText: 'Product Name',
                      labelStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(20), // Set border radius
                        borderSide: BorderSide(color: Colors.grey, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                            color: Colors.blue,
                            width: 2), // Change color when focused
                      ),
                    ),
                  ),
                  SizedBox(height: 20), // Space between text fields
        
                  // Product Description TextField
                  TextField(
                    maxLines: 4, // Allows for multiple lines of text
                    controller: ctrl.textdescriptionctrl,
                    decoration: InputDecoration(
                      labelText: 'Product Description',
                      labelStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(20), // Set border radius
                        borderSide: BorderSide(color: Colors.grey, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                            color: Colors.blue,
                            width: 2), // Change color when focused
                      ),
                    ),
                  ),
                  SizedBox(height: 20), // Space between text fields
        
                  // Image URL TextField
                  TextField(
                    controller: ctrl.textimagectrl,
                    decoration: InputDecoration(
                      labelText: 'Image URL',
                      labelStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(20), // Set border radius
                        borderSide: BorderSide(color: Colors.grey, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                            color: Colors.blue,
                            width: 2), // Change color when focused
                      ),
                    ),
                  ),
                  SizedBox(height: 20), // Space between text fields
        
                  // Price TextField
                  TextField(
                    controller: ctrl.textpricectrl,
                    decoration: InputDecoration(
                      labelText: 'Price',
                      labelStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(20), // Set border radius
                        borderSide: BorderSide(color: Colors.grey, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                            color: Colors.blue,
                            width: 2), // Change color when focused
                      ),
                    ),
                    keyboardType: TextInputType
                        .number, // Set keyboard type to number for price input
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Flexible(
                          child: DropDownBtn(
                        items: ['vegetable', 'fruit', 'flower','grossery'],
                        selectedItemText: ctrl.category,
                        onSelected: (selectValue) {
                          ctrl.category = selectValue ?? "general";
                          ctrl.update();
                        },
                      )),
                      Flexible(
                          child: DropDownBtn(
                        items: ['low', 'mid', 'high'],
                        selectedItemText: ctrl.brand,
                        onSelected: (selectValue) {
                          ctrl.brand = selectValue ?? "general";
                           ctrl.update();
                        },
                      )),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text('offer on product?'),
                  DropDownBtn(
                    items: ['true', 'false'],
                    selectedItemText: ctrl.offer.toString(),
                    onSelected: (selectValue) {
                      ctrl.offer = bool.tryParse(selectValue ?? 'false') ?? false;
                      ctrl.update();
                    },
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.indigoAccent,
                          foregroundColor: Colors.white),
                      onPressed: () {
                        ctrl.addProduct();
                      },
                      child: const Text('Add product'))
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
