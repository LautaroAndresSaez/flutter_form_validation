import 'package:flutter/material.dart';
import 'package:form_validation/src/pages/product.dart';
import 'package:form_validation/src/widgets/home/list_products.dart';

class Home extends StatelessWidget {
  static final String route = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: ListProducts(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, Product.route);
        },
        backgroundColor: Colors.deepOrange,
        child: Icon(Icons.add),
      ),
    );
  }
}
