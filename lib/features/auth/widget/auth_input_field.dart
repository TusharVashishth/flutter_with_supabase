import 'package:flutter/material.dart';
import 'package:promptia/util/type_def.dart';

class AuthInputField extends StatelessWidget {
  final String label, hintText;
  final bool isPasswordField;
  final TextEditingController controller;
  final ValidatorCallback? validatorCallback;
  const AuthInputField({
    super.key,
    required this.label,
    required this.hintText,
    required this.controller,
    this.validatorCallback,
    this.isPasswordField = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validatorCallback,
      obscureText: isPasswordField,
      decoration: InputDecoration(
          label: Text(label),
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black, width: 1.5),
            borderRadius: BorderRadius.circular(20),
          ),
          focusColor: Colors.black,
          labelStyle: const TextStyle(color: Colors.black)),
    );
  }
}
