import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_request/productUI/product_page.dart';
import 'package:get_request/product_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product Fetching Demo',
      home: BlocProvider(
        create: (context) => ProductBloc(),
        child: const ProductPage(),
      ),
    );
  }
}
