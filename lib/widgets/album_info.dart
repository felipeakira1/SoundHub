import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AlbumInformation extends StatelessWidget {
  String title;
  List<String> informations;

  AlbumInformation({
    super.key,
    required this.title,
    required this.informations,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
        ...informations.map((information) => Text(information, style: const TextStyle(fontSize: 18, color: Colors.white),))
      ],
    );
  }
}
