import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:krushisevak/models/product.dart';


class HomeController extends GetxController{


  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference productCollection;


  @override
  void onInit() {
    productCollection = firestore.collection('products');
    super.onInit();
  }

  addProduct(){
    DocumentReference doc = productCollection.doc();
    Product product = Product(
      id: doc.id,
      name: 'Product 1',
      price: 100.0,
      brand: 'high',
      category: 'vegetable',
      offer: true,
      image: 'https://www.shutterstock.com/image-photo/common-beanbush-beans-french-green-wooden-2425857021',
      description: 'the thins new give more stringth'
      );

      final productJson = product.toJson();
      doc.set(productJson);
  }
}