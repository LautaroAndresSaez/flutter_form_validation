import 'package:flutter/material.dart';
import 'package:form_validation/src/widgets/login/background_info.dart';
import 'package:form_validation/src/widgets/login/circle.dart';

class BackgroundLogin extends StatelessWidget {
  final _colors = [
    Color.fromRGBO(145, 16, 50, 1.0),
    Color.fromRGBO(138, 76, 92, 1.0),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final backgroundHeight = .4 * size.height;

    return Stack(children: [
      Container(
        height: backgroundHeight,
        width: double.infinity,
        decoration: BoxDecoration(gradient: LinearGradient(colors: _colors)),
      ),
      Positioned(
        top: backgroundHeight * .3,
        left: size.width * .1,
        child: Circle(),
      ),
      Positioned(
        top: -40,
        right: -30,
        child: Circle(),
      ),
      Positioned(
        bottom: -50,
        right: -10,
        child: Circle(),
      ),
      Positioned(
        bottom: 120,
        right: 20,
        child: Circle(),
      ),
      Positioned(
        bottom: -50,
        left: -20,
        child: Circle(),
      ),
      BackgroundInfo()
    ]);
  }
}
