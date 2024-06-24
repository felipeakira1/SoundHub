// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String text;
  final bool obscureText;
  final FormFieldValidator<String>? validator;
  final String? initialValue;
  final bool enabled;

  const CustomTextFormField({
    super.key,
    this.controller,
    required this.text,
    this.obscureText = false,
    this.validator,
    this.initialValue,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: const TextStyle(
            fontSize: 18.0,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 10),
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          initialValue: controller == null ? initialValue : null,
          enabled: enabled,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.black54,
            hintText: text,
            hintStyle: const TextStyle(
              color: Colors.white54,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: const BorderSide(
                color: Colors.white,
                width: 1.0,
              ),
            ),
          ),
          style: const TextStyle(
            color: Colors.white,
          ),
          validator: validator,
        ),
      ],
    );
  }
}
