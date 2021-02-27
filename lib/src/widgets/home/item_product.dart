import 'package:flutter/material.dart';
import 'package:form_validation/src/models/product.dart';
import 'package:form_validation/src/pages/product.dart';
import 'package:form_validation/src/provider/products_provides.dart';

class ItemProduct extends StatelessWidget {
  final ProductModel product;
  final ProductsProvider _productsProvider = ProductsProvider();
  ItemProduct({this.product});

  @override
  Widget build(BuildContext context) {
    final title = product.title;
    final value = product.value;
    final id = product.id;
    return Dismissible(
      key: UniqueKey(),
      background: Container(
        color: Colors.redAccent,
      ),
      onDismissed: (direction) {
        _productsProvider.deleteProduct(id);
      },
      child: ListTile(
        title: Text('$title - \$$value'),
        subtitle: Text(id),
        onTap: () {
          Navigator.pushNamed(context, Product.route, arguments: product);
        },
      ),
    );
  }
}
