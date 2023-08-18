import 'package:flutter/material.dart';
import 'package:get_request/main_page/nvaigationpages/product_page/product_detail_page/prodect_detail.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("Cart"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 708,
            child: Expanded(
              child: ListView.builder(
                itemCount: cartProductTitle.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    // leading: Image(image: cartProductThumbnail[index]),
                    leading: Icon(Icons.done),
                    title: Text(cartProductTitle[index]),
                    subtitle: Text("\$ " + cartProductPrice[index].toString()),
                    trailing: IconButton(
                        onPressed: () {
                          setState(() {
                            cartProductTitle.removeAt(index);
                            cartProductPrice.removeAt(index);
                          });
                        },
                        icon: Icon(
                          Icons.remove_shopping_cart,
                          color: Colors.red,
                        )),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
