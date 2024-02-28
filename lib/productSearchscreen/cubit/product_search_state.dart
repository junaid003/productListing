part of 'product_search_cubit.dart';

@immutable
abstract class ProductSearchState {}

class ProductSearchInitial extends ProductSearchState {}

// ignore: must_be_immutable
final class productsearchError extends ProductSearchState {
  String? message;
  productsearchError({this.message});
}

// ignore: must_be_immutable
final class productSearchDataLoaded extends ProductSearchState {
  List<ProductModel>? productList;
  productSearchDataLoaded({this.productList});
}