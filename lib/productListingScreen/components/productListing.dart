part of '../productListingscreen.dart';

class ProductListing extends StatelessWidget {
  final ScrollController scrollController;
  const ProductListing({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    ProductListingCubit ProductListingDataCubit = BlocProvider.of<ProductListingCubit>(context);
    return ListView.builder(
      controller: scrollController,
      itemCount: ProductListingDataCubit.productListData.length,
      itemBuilder: (BuildContext context, int index) {
          return ProductListCard(
              productData: ProductListingDataCubit.productListData[index]);
      },
    );
  }
}
