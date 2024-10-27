import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:krushisevak/models/product.dart';


class HomeController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference productCollection;
  
  TextEditingController textnamectrl = TextEditingController();
  TextEditingController textimagectrl = TextEditingController();
  TextEditingController textdescriptionctrl = TextEditingController();
  TextEditingController textpricectrl = TextEditingController();

  
  String category = "general"; 
  String brand = "none";       
  bool offer = false;          
  List<Product> products = [];

  @override
  void onInit() {
    productCollection = firestore.collection('products');
    fetchProductsStream();
    super.onInit();
  }

  void addProduct() {
    DocumentReference doc = productCollection.doc();
    try {
      Product product = Product(
        id: doc.id,
        name: textnamectrl.text,
        price: double.tryParse(textpricectrl.text),
        brand: brand,
        category: category,
        offer: offer,
        image: textimagectrl.text,
        description: textdescriptionctrl.text,
      );

      final productJson = product.toJson();
      doc.set(productJson);
      
      
      Get.snackbar('Success', 'Product added successfully', colorText: Colors.green);
      
      
      setDefaultValues();
      
    } catch (e) {
      Get.snackbar('Failed', e.toString(), colorText: Colors.red);
    }
  }

  Stream<List<Product>> fetchProductsStream() {
  return productCollection.snapshots().map((snapshot) {
    return snapshot.docs
        .map((doc) => Product.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
  });
}



  deleteProduct(String id) async {
    try {
      await productCollection.doc(id).delete();
    } catch (e) {
      Get.snackbar('Failed', e.toString(), colorText: Colors.red);
    }
  }
  
  void setDefaultValues() {
    
    textnamectrl.clear();
    textimagectrl.clear();
    textdescriptionctrl.clear();
    textpricectrl.clear();
    
    category = "general"; 
    brand = "none";       
    offer = false;        
    update();
  }
}
