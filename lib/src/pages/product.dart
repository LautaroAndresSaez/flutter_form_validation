import 'dart:io';

import 'package:flutter/material.dart';
import 'package:form_validation/src/widgets/product/add_product.dart';
import 'package:image_picker/image_picker.dart';

class Product extends StatefulWidget {
  static final String route = 'product';

  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  File photo;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Product'),
        actions: [
          IconButton(
            icon: Icon(Icons.photo_size_select_actual),
            onPressed: _selectPhoto,
          ),
          IconButton(
            icon: Icon(Icons.camera_alt),
            onPressed: _capturePhoto,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: AddProduct(
          scaffoldKey: scaffoldKey,
          photo: photo,
        ),
      ),
    );
  }

  void _selectPhoto() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    photo = File(pickedFile.path);
    if (photo != null) {
      //clean
    }

    setState(() {});
  }

  void _capturePhoto() {}
}
