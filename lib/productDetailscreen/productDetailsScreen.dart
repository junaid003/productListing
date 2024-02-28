import 'package:flutter/material.dart';
import 'package:product/productListingScreen/model/productModel.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:product/core/core_ui.dart';

class ProductDetailsScreen extends StatelessWidget {
  final  ProductModel productDetailsData;

  const ProductDetailsScreen({super.key, required this.productDetailsData});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details', style: DataListingScreenTextStyles.appBar),
      ),
      body:
       Padding(
         padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 8),
         child: Container(
          height: 350,
          decoration: BoxDecoration(
   color: Colors.white,
    boxShadow: const [
     BoxShadow(
        blurRadius: 4,
        color: Color(0x3600000F),
        offset: Offset(0, 2),
      )
    ],
    borderRadius: BorderRadius.circular(8),
  ),
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              children: [
                const SizedBox( height: 20,),
                labelwidget("Name",productDetailsData.name ),
                labelwidget("Price",productDetailsData.price ),
                labelwidget("Measurement",productDetailsData.measurement), 
                qrCodeWidget(productDetailsData.name) ,
              ],
            ),
          ),
         ),
       ),
    );
  }

 Widget  labelwidget(String label, String value) {
   return Padding(
     padding: const EdgeInsets.only(top: 10),
     child: Row(
      children: [ 
       Container(
        width: 110,
        child: Text(label,  style: DataListingScreenTextStyles.label)),
        Text ( ": $value",  style: DataListingScreenTextStyles.value)
      ],
     ),
   );
 }

 Widget   qrCodeWidget(String value) {
   return Padding(
     padding: const EdgeInsets.only(top: 30),
     child:
     Container(
     decoration: BoxDecoration(
     border: Border.all(color: Colors.black)
     ),
       child: Padding(
         padding: const EdgeInsets.all(5.0),
         child: QrImageView(
           data: value,
           version: QrVersions.auto,
           size: 150.0,
         
         ),
       ),
     ),
   );
 }
}






