import 'package:flutter/material.dart';
import 'dart:io';

class ShowPhoto extends StatelessWidget {
  final File photo;
  ShowPhoto({this.photo});

  @override
  Widget build(BuildContext context) {
    return _show();
  }

  Widget _show() {
    if (photo?.path == null) {
      return Image(
          image: AssetImage(photo?.path ?? 'assets/img/no-image.png'),
          height: 300,
          fit: BoxFit.cover);
    }
    return Container();
  }
}
