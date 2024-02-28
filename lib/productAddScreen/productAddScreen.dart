

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product/core/core_ui.dart';
import 'package:product/productAddScreen/cubit/product_add_cubit.dart';
part 'components/productAddCard.dart';
part 'components/productSave.dart';

class ProductAddScreen extends StatefulWidget {
  const ProductAddScreen({super.key});

  @override
  _ProductAddScreenState createState() => _ProductAddScreenState();
}

class _ProductAddScreenState extends State<ProductAddScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Add product' ,style: DataListingScreenTextStyles.appBar),
      ),
      body: BlocProvider(
        create: (context) => ProductAddCubit(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: BlocBuilder<ProductAddCubit, ProductAddState>(
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    productAddCard(),
                    const ProductSave(),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
