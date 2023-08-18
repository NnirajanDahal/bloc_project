import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_request/main_page/nvaigationpages/product_page/product_detail_page/prodect_detail.dart';

import '../../../bloc/product_bloc.dart';
import '../../../bloc/product_state.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  void initState() {
    BlocProvider.of<ProductBloc>(context).fetchProduct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 219, 162, 88),
        automaticallyImplyLeading: false,
        title: const Text('Product View Page'),
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductInitial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ProductLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProductLoaded) {
            final product = state.product;
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemCount: product.length,
              itemBuilder: (context, index) {
                final products = product[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ProductDetailPage(product: products)));
                  },
                  child: GridTile(
                    child: Container(
                      margin: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        color: const Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Image.network(
                            product[index].thumbnail,
                            height: 100,
                            fit: BoxFit.fill,
                          ),
                          // Text(product[index].id.toString()),

                          // const SizedBox(
                          //   height: 25,
                          // ),
                          Text(product[index].title),
                          // Text(product[index].description),
                          Text("\$ ${product[index].price}"),
                          // Text(product[index].rating.toString())
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else if (state is ProductError) {
            return Center(child: Text(state.error));
          }
          return Container();
        },
      ),
    );
  }
}
