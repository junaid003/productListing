import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:product/core/alert/common_alert.dart';
import 'package:product/productListingScreen/model/productModel.dart';

part 'product_search_state.dart';

class ProductSearchCubit extends Cubit<ProductSearchState> {
  ProductSearchCubit() : super(ProductSearchInitial());

  final TextEditingController searchController = TextEditingController();
  List<ProductModel> productListData = [];

Future<void> searchProduct(BuildContext context) async {
  var  searchkey  = searchController.text.trim(); 
   if( searchkey.isEmpty) {
   CommonAlert.showAlertDialog(context, 'Please enter product name');
   }else {
  productListData=[];
  FirebaseFirestore.instance
      .collection('product')
      .orderBy('search_key')
      .startAt([searchkey])
      .endAt([searchkey + '\uf8ff'])
      .get()
      .then((snapshot) {
       for (int i = 0; i < snapshot.docs.length; i++) {
    var item = snapshot.docs[i];
    productListData.add( ProductModel(
       name: item["Product_name"]??"",
       price: item["price"]??"",
       measurement: item["measurement"]??""
       ));
       }
       emit(productSearchDataLoaded(productList: productListData ));  
      }).catchError((er){
      emit(productsearchError(message:onError.toString()));
      });
   }
}
}
