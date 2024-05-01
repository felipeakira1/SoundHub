import 'package:flutter/material.dart';
import 'package:soundhub/models/album.dart';
import 'package:soundhub/models/musica.dart';
import 'package:soundhub/views/screens/album_details_screen.dart';
import 'package:soundhub/views/screens/musica_detalhes_screen.dart';

class MusicaTile extends StatelessWidget {
  final Musica musica;

  const MusicaTile({super.key, required this.musica});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => TelaDetalhesMusica(musica: musica)),
      ),

      child: Container(
        margin: const EdgeInsets.all(8.0),
        width: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0), // Define o raio do border
              child: Image.asset(
                musica.imageUrl,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image),
              ),
            ),
    
            const SizedBox(height: 8.0),
            Text(musica.nome, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0), maxLines: 1, overflow: TextOverflow.ellipsis,),
            Text(musica.artista, style: const TextStyle(fontSize: 14.0)),
            Text(musica.ano.toString(), style: const TextStyle(fontSize: 14.0)),
          ],
        ),
      ),
    );
  }
}