import 'package:flutter/material.dart';
import 'package:form_validation/src/models/product.dart';
import 'package:form_validation/src/provider/products_provides.dart';
import 'package:form_validation/src/widgets/home/item_product.dart';

class ListProducts extends StatelessWidget {
  final ProductsProvider productsProvider = ProductsProvider();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: productsProvider.loadProducts(),
      builder: (context, AsyncSnapshot<List<ProductModel>> snapshot) {
        if (snapshot.hasData) {
          final products = snapshot.data;
          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, i) => ItemProduct(
              product: products[i],
            ),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
