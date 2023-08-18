import 'package:flutter/material.dart';
import 'package:get_request/model/product_model.dart';

class ProductDetailPage extends StatefulWidget {
  final Product product;
  ProductDetailPage({super.key, required this.product});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

List cartProductThumbnail = [];
List cartProductTitle = [];
List cartProductPrice = [];

class _ProductDetailPageState extends State<ProductDetailPage> {
  bool _shoppingCartPressed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("Product Detail Screen"),
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    _shoppingCartPressed = true;
                    // cartProductThumbnail.add(widget.product.thumbnail);
                    cartProductTitle.add(widget.product.title);
                    cartProductPrice.add(widget.product.price);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Colors.green,
                        content: Text("Product added to cart")));
                  });
                  // cartProductThumbnail.add(widget.product.thumbnail);
                },
                icon: Icon(_shoppingCartPressed
                    ? Icons.shopping_cart_checkout
                    : Icons.shopping_cart))
          ],
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
              // const SizedBox(
              //   height: 50,
              // ),
              Divider(),
              Text(
                widget.product.title,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
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
