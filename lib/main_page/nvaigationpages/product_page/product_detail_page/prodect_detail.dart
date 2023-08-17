import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_request/bloc/product_bloc.dart';
import 'package:get_request/bloc/product_state.dart';
import 'package:get_request/model/product_model.dart';

class ProductDetailPage extends StatefulWidget {
  final Product product;
  ProductDetailPage({super.key, required this.product});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Product Detail Screen"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              SizedBox(
                height: 400,
                width: double.infinity,
                child: Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.product.images.length,
                    itemBuilder: (context, index) {
                      return Image.network(
                        widget.product.images[index],
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                "Price: " + "\$" + widget.product.price.toString(),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ));
  }
}
