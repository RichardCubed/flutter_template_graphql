import 'dart:core';
import 'package:flutter/material.dart';

class MyFormField extends StatelessWidget {
  final String labelText;
  final FormFieldSetter onSaved;
  final FormFieldValidator validator;

  MyFormField({this.onSaved, this.validator, this.labelText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: labelText,
        errorStyle: TextStyle(color: Colors.red),
      ),
      validator: validator,
      onSaved: onSaved,
    );
  }
}
