part of 'product_listing_cubit.dart';

@immutable
abstract class ProductListingState {}

class ProductListingInitial extends ProductListingState {}

// ignore: must_be_immutable
final class productListError extends ProductListingState {
  String? message;
  productListError({this.message});
}

// ignore: must_be_immutable
final class productistLoaded extends ProductListingState {
  List<ProductModel>? productList;
  productistLoaded({this.productList});
}