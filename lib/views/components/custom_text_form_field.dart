import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String text;
  final bool obscureText;
  final FormFieldValidator<String>? validator;

  const CustomTextFormField({super.key, required this.controller, required this.text, this.obscureText = false, this.validator});

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