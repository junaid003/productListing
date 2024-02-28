import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:product/core/alert/common_alert.dart';
import 'package:product/productListingScreen/productListingscreen.dart';
part 'product_add_state.dart';

class ProductAddCubit extends Cubit<ProductAddState> {
  ProductAddCubit() : super(ProductAddInitial());
  final TextEditingController nameController = TextEditingController();
  final TextEditingController measurementController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

 void productSave(BuildContext context){
  var productName= nameController.text.trim();
  var price= priceController.text.trim();
  var measurement = measurementController.text.trim();
    if(productName.isEmpty || price.isEmpty || measurement.isEmpty) {
     CommonAlert.showAlertDialog(context, "Please fill all the details" );
    } else{
     CollectionReference productCollection = FirebaseFirestore.instance.collection('product');
    productCollection
          .add({
            'Product_name': productName, 
            'measurement': measurement, 
            'price': price,
            'search_key': productName.toLowerCase() 
          })
          .then((value)  {
                Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ProductListingScreen(),
                              ),
                             );

          })
          .catchError((error)  {
         CommonAlert.showAlertDialog(context, error.toString());
          });
    }
 }
}
