import 'model/product_model.dart';

sealed class ProductState {}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final List<Product> product;
  ProductLoaded(this.product);
}

class ProductError extends ProductState {
  final String error;
  ProductError(this.error);
}
