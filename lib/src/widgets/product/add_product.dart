import 'dart:io';

import 'package:flutter/material.dart';
import 'package:form_validation/src/models/product.dart';
import 'package:form_validation/src/provider/products_provides.dart';
import 'package:form_validation/src/widgets/product/avalidable_switch.dart';
import 'package:form_validation/src/widgets/product/form_input.dart';

import 'package:form_validation/src/utils/is_number.dart' as utils;
import 'package:form_validation/src/widgets/product/show_photo.dart';

class AddProduct extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  File photo;
  AddProduct({this.scaffoldKey, this.photo});

  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final _formKey = GlobalKey<FormState>();

  ProductModel product = ProductModel(title: '', value: 0.0, available: true);

  final productProvider = ProductsProvider();

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final ProductModel productData = ModalRoute.of(context).settings.arguments;
    if (productData != null) {
      product = productData;
    }

    return Container(
      padding: EdgeInsets.all(15),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            ShowPhoto(photo: widget.photo),
            FormInput(
              initialValue: product.title,
              label: 'Producto',
              autoFocus: true,
              validator: _productValidate,
              onSaved: _saveProductName,
            ),
            FormInput(
              onSaved: _savePrice,
              initialValue: product.value.toString(),
              label: 'Precio',
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              validator: _priceValidate,
            ),
            AvalidableSwitch(
              value: product.available,
              onChanged: (value) {
                product.available = value;
              },
            ),
            RaisedButton.icon(
              onPressed: _isLoading ? null : _submit,
              icon: _isLoading ? Icon(Icons.circle) : Icon(Icons.save),
              label: _isLoading ? Text('Cargando...') : Text('Publicar'),
              color: Colors.deepOrange,
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
            )
          ],
        ),
      ),
    );
  }

  String _productValidate(String value) =>
      value.length < 6 ? 'Ingrese el nombre del producto' : null;

  String _priceValidate(String value) =>
      utils.isNumber(value) ? null : 'Solo se admiten números';

  _submit() async {
    final cantSubmit = !_formKey.currentState.validate();
    if (cantSubmit) return;
    _isLoading = true;
    setState(() {});
    _formKey.currentState.save();

    final Future<bool> Function(ProductModel) saveMethod = (product.id == null)
        ? productProvider.createProduct
        : productProvider.updateProduct;

    final result = await saveMethod(product);

    Future.delayed(Duration(milliseconds: 1000), () => Navigator.pop(context));

    if (result) {
      _showSnackBar('Producto: ${product.title} guardado');
      return;
    }
    _showSnackBar('Error al guardar el producto');
  }

  _saveProductName(String value) {
    product.title = value;
  }

  _savePrice(String value) {
    product.value = num.parse(value) / 1.0;
  }

  _showSnackBar(String message) {
    final snackBar = SnackBar(
      content: Text(message),
      duration: Duration(seconds: 2),
    );
    widget.scaffoldKey.currentState.showSnackBar(snackBar);
  }
}
