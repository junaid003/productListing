part of '../productSearchScreen.dart';

class productSearchListing extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    ProductSearchCubit productSearchDataCubit = BlocProvider.of<ProductSearchCubit>(context);
    return productSearchDataCubit.productListData.isEmpty ?
     Center(child: Text("Product Not Found",style: DataListingScreenTextStyles.subtitle)):
     ListView.builder(
      controller: _scrollController,
      shrinkWrap: true,
      itemCount: productSearchDataCubit.productListData.length,
      itemBuilder: (BuildContext context, int index) {
 var  productData= productSearchDataCubit.productListData[index];
 return Card(
   elevation: 4,
   margin: const EdgeInsets.all(10),
   child: Container(
     padding: const EdgeInsets.only(top: 20, bottom: 20),
     alignment: Alignment.center,
     child: Column(
       children: [
         ListTile(
           onTap: () {
             Navigator.push(
                 context,
                 MaterialPageRoute(
                   builder: (context) =>
                       ProductDetailsScreen(productDetailsData: productData ),
                 ));
           },
           title: Text(
            productData.name,
            style: DataListingScreenTextStyles.title
           ),
           subtitle: Text(productData.price, style: DataListingScreenTextStyles.subtitle),
           trailing: const Icon(Icons.arrow_forward_ios),
         ),
       ],
     ),
   ),
 );
      },
    );
  }
}