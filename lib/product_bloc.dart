import 'package:bloc/bloc.dart';
import 'package:get_request/states.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'model/product_model.dart';

class ProductBloc extends Cubit<ProductState> {
  ProductBloc() : super(ProductInitial());

  Future<void> fetchProduct() async {
    try {
      final response =
          await http.get(Uri.parse("https://dummyjson.com/products"));
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        ProductList product = ProductList.fromJson(jsonData);
        emit(ProductLoaded(product.products));
      } else {
        emit(ProductError('Failed to load product'));
      }
    } catch (e) {
      emit(ProductError('An error occurred'));
    }
  }
}
