import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final Stream stream;
  final Function() onPressed;

  SubmitButton({this.stream, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: stream,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return RaisedButton(
            onPressed: snapshot.hasData ? onPressed : null,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            elevation: 0,
            color: Colors.deepOrange,
            textColor: Colors.white,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
              child: Text('Ingresar'),
            ));
      },
    );
  }
}
