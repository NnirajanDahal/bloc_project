import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_request/main_page/main_page.dart';
import 'package:get_request/bloc/product_bloc.dart';

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
        child: const MainPage(),
      ),
    );
  }
}
