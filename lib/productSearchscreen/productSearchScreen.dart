import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product/core/core_ui.dart';
import 'package:product/productDetailscreen/productDetailsScreen.dart';
import 'package:product/productSearchscreen/cubit/product_search_cubit.dart';
part 'components/searchcard.dart';
part 'components/productSearchListing.dart';



class ProductSearchScreen extends StatelessWidget {
  const ProductSearchScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductSearchCubit(),
      child: Scaffold(
          appBar: AppBar(
            title: 
                 Text("Search", style: DataListingScreenTextStyles.appBar )),
          
          body:const SingleChildScrollView(
            child: Column(children: [
              searchcard(),
               productSerachListFrame()
            ],),
          )
          
          ),
    );
  }
}

class  productSerachListFrame extends StatefulWidget {
  const productSerachListFrame({super.key});
  @override
  State<productSerachListFrame> createState() => _productSerachListFrameState();
}

class _productSerachListFrameState extends State<productSerachListFrame> {

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductSearchCubit, ProductSearchState>(
      builder: (context, state) {
        if (state is ProductSearchInitial) {
          return Container();
        }
        if (state is productsearchError) {
          return  Text(state.message != null
                ? state.message.toString()
                : "Something went wrong");
        }
        return productSearchListing();
      },
    );
  }
}
