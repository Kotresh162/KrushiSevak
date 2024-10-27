import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
final String name;
final String imageUrl;
final double price;
final String offerTag;
final Function onTap;

  const ProductCard({super.key, required this.name, required this.imageUrl, required this.price, required this.offerTag, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                imageUrl, // replace 'url' with the actual image URL
                fit: BoxFit.cover,
                width: double.infinity,
                height: 120,
              ), // Image.network
              const SizedBox(height: 9),
              Text(
                name,
                style: TextStyle(fontSize: 16),
                overflow: TextOverflow.ellipsis,
              ), 
              const SizedBox(height: 9),// Text
              Text(
                "Rs : $price",
                style: TextStyle(fontSize: 16),
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(offerTag,style: const TextStyle(color: Colors.white,fontSize: 12),),
              ),
      
            ],
          ),
        ), // Column
      ),
    ); // Card
  }
}
