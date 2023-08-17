import 'package:bloc/bloc.dart';
import 'package:get_request/bloc/product_state.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/product_model.dart';

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
        emit(ProductError('Error Occured'));
      }
    } catch (e) {
      emit(ProductError('No internet connection'));
    }
  }
}
