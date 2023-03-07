import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;
  final String name;

  MyTextFormField({required this.validator, required this.onChanged, required this.name});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      onChanged: onChanged,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: name,
      ),
    );
  }
}
