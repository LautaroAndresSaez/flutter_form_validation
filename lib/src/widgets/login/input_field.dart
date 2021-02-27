import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final TextInputType type;
  final IconData iconName;
  final String hintText;
  final String label;
  final bool isPassword;
  final Stream stream;
  final Function(String) onChanged;

  InputField(
      {@required this.type,
      @required this.iconName,
      this.hintText,
      this.label,
      this.isPassword: false,
      this.stream,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: stream,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            onChanged: onChanged,
            keyboardType: type,
            obscureText: isPassword,
            decoration: InputDecoration(
                icon: Icon(iconName, color: Colors.deepOrange),
                hintText: hintText,
                labelText: label,
                errorText: snapshot.error),
          ),
        );
      },
    );
  }
}
