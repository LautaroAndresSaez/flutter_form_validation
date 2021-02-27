import 'package:flutter/material.dart';
import 'package:form_validation/src/pages/home.dart';
import 'package:form_validation/src/pages/login.dart';
import 'package:form_validation/src/pages/product.dart';

Map<String, WidgetBuilder> getRoutes() {
  return {
    Home.route: (context) => Home(),
    Login.route: (context) => Login(),
    Product.route: (context) => Product(),
  };
}
