import 'package:flutter/material.dart';
import 'package:soundhub/models/musica.dart';

class TelaDetalhesMusica extends StatefulWidget {
  final Musica musica;
  const TelaDetalhesMusica({super.key, required this.musica});

  @override
  State<TelaDetalhesMusica> createState() => _TelaDetalhesMusicaState();
}

class _TelaDetalhesMusicaState extends State<TelaDetalhesMusica> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}