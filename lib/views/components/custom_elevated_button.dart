import 'package:flutter/material.dart';

typedef Callback<T> = void Function(T value);

class CustomElevatedButton<T> extends StatelessWidget {
  final String title;
  final void Function() onPressed;

  const CustomElevatedButton({super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: onPressed, 
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFE91E63), // Cor de fundo do botão
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              textStyle: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // Arredondamento dos cantos
              ),
            ),
            child: Text(
              title, 
              style: const TextStyle(color: Colors.white),
            )
          ),
        ),
      ],
    );
  }
}