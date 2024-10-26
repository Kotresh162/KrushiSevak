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
                        items: ['cate1', 'cate2', 'cate3'],
                        selectedItemText: 'Category',
                        onSelected: (selectValue) {
                          print(selectValue);
                        },
                      )),
                      Flexible(
                          child: DropDownBtn(
                        items: ['brand1', 'brand2', 'brand3'],
                        selectedItemText: 'brand',
                        onSelected: (selectValue) {
                          print(selectValue);
                        },
                      )),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text('offer on product?'),
                  DropDownBtn(
                    items: ['true', 'false'],
                    selectedItemText: 'offer ?',
                    onSelected: (selectValue) {},
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.indigoAccent,
                          foregroundColor: Colors.white),
                      onPressed: () {},
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
