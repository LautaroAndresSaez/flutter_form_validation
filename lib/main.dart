import 'package:flutter/material.dart';
import 'package:form_validation/src/bloc/provider.dart';
import 'package:form_validation/src/pages/home.dart';
import 'package:form_validation/src/routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Form validation',
        initialRoute: Home.route,
        routes: getRoutes(),
        theme: ThemeData(primaryColor: Colors.deepOrange),
      ),
    );
  }
}
