import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../product_bloc.dart';
import '../states.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    final productBloc = BlocProvider.of<ProductBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductInitial) {
            return const Center(child: Text('Initial state'));
          } else if (state is ProductLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProductLoaded) {
            final product = state.product;
            return ListView.builder(
              itemCount: product.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Image.network(product[index].thumbnail),
                    Text(product[index].id.toString()),
                    Text(product[index].title),
                    Text(product[index].description),
                    Text(product[index].price.toString()),
                    Text(product[index].rating.toString())
                  ],
                );
              },
            );
            // Center(
            //   child:
            //   Column(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [

            //       // Image.network(product.thumbnail),
            //       // const SizedBox(height: 16),
            //       // Text(product.title, style: const TextStyle(fontSize: 20)),
            //       // Text(product.description),
            //       // Text('Price: \$${product.price.toStringAsFixed(2)}'),
            //       // Text('Rating: ${product.rating.toString()}'),
            //     ],
            //   ),
            // );
          } else if (state is ProductError) {
            return Center(child: Text(state.error));
          }
          return Container();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          productBloc.fetchProduct();
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
