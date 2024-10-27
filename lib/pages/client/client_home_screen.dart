import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:krushisevak/pages/client/product_card.dart';
import 'package:krushisevak/pages/login_screen.dart';
import 'package:krushisevak/widgets/drop_down_btn.dart';
import 'package:krushisevak/widgets/multi_btn.dart';

import 'package:cloud_firestore/cloud_firestore.dart'; // Add this import

class ClientHomeScreen extends StatelessWidget {
  const ClientHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          alignment: Alignment.center,
          child: const Text(
            'Home Store',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
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
      body: Column(
        children: [
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Chip(label: Text("category")),
                );
              },
            ),
          ),
          Row(
            children: [
              Flexible(
                child: DropDownBtn(
                  items: const ['high to low', 'low to high'],
                  selectedItemText: "sort",
                  onSelected: (selected) {},
                ),
              ),
              Flexible(
                child: MultiBtn(
                  items: const ["item1", "item2", "item3", "item4"],
                  onselectedChange: (selectedItems) {},
                ),
              ),
            ],
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection('products').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(child: Text("Error: ${snapshot.error}"));
                }

                final products = snapshot.data!.docs;

                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    childAspectRatio: 0.8,
                    mainAxisSpacing: 8,
                  ),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];

                    // Assuming your product document has these fields
                    final name = product['name'];
                    final imageUrl = product['image'];
                    final price = product['price'];
                    final offerTag = product['offer'];

                    return ProductCard(
                      name: name,
                      imageUrl: imageUrl,
                      price: price,
                      offerTag: offerTag,
                      onTap: () {},
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
