import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:product/productListingScreen/model/productModel.dart';
part 'product_listing_state.dart';

class ProductListingCubit extends Cubit<ProductListingState> {
  ProductListingCubit() : super(ProductListingInitial()){
    fetchProduct();
  }

  List<ProductModel> productListData = [];
   void fetchProduct() async {
   CollectionReference productCollection = FirebaseFirestore.instance.collection('product');
   await productCollection.get().then((value) {
  for (int i = 0; i < value.docs.length; i++) {
    var item = value.docs[i];
    productListData.add( ProductModel(
       name: item["Product_name"]??"",
       price: item["price"]??"",
       measurement: item["measurement"]??""
       ));
  }
emit(productistLoaded(productList: productListData));
  }).catchError((onError){
 emit(productListError(message:onError.toString()));

  });

}}
