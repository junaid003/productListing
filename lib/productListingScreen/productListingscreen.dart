import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product/login/loginScreen.dart';
import 'package:product/productAddScreen/productAddScreen.dart';
import 'package:product/productDetailscreen/productDetailsScreen.dart';
import 'package:product/productListingScreen/cubit/product_listing_cubit.dart';
import 'package:product/productListingScreen/model/productModel.dart';
import 'package:product/core/core_ui.dart';
import 'package:product/productSearchscreen/productSearchScreen.dart';
part 'components/errorListScreen.dart';
part 'components/productListing.dart';
part 'components/productListCard.dart';
part 'components/Drawer.dart';


class ProductListingScreen extends StatefulWidget {
  const ProductListingScreen({super.key});

  @override
  State<ProductListingScreen> createState() => _ProductListingScreenState();
}

class _ProductListingScreenState extends State<ProductListingScreen> {
  String? useremail = "";
  @override
  void initState() {
    super.initState();
 useremail= FirebaseAuth.instance.currentUser?.email;
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductListingCubit(),
      child: Scaffold(
          appBar: AppBar(
            title: 
                 Text("Product List", style: DataListingScreenTextStyles.appBar )),
          drawer:  DrawerCard( emaild:useremail.toString()),
          body: const productListFrame()),
    );
  }
}

class productListFrame extends StatefulWidget {
  const productListFrame({super.key});
  @override
  State<productListFrame> createState() => _productListFrameState();
}

class _productListFrameState extends State<productListFrame> {
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductListingCubit, ProductListingState>(
      builder: (context, state) {
        if (state is ProductListingInitial) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is productListError) {
          return ErrorListScreen(state: state);
        }
        return ProductListing(scrollController: _scrollController);
      },
    );
  }
}
