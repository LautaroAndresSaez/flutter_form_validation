import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormInput extends StatelessWidget {
  final String initialValue;
  final String label;
  final TextInputType keyboardType;
  final bool autoFocus;
  final Function validator;
  final Function(String) onSaved;

  FormInput(
      {this.label,
      this.keyboardType,
      this.autoFocus: false,
      this.validator,
      this.initialValue,
      this.onSaved});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      initialValue: initialValue,
      validator: validator,
      autofocus: autoFocus,
      keyboardType: keyboardType,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: label),
    );
  }
}
