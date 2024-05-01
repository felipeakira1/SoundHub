import 'package:flutter/material.dart';
import 'package:soundhub/models/album.dart';
import 'package:soundhub/views/screens/datalhes_album_screen.dart';

class AlbumTile extends StatelessWidget {
  final Album album;

  const AlbumTile({super.key, required this.album});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => DetalhesAlbumScreen(album: album)),
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
                album.imageUrl,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image),
              ),
            ),
    
            const SizedBox(height: 8.0),
            Text(album.nome, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0), maxLines: 1, overflow: TextOverflow.ellipsis,),
            Text(album.artista, style: const TextStyle(fontSize: 14.0)),
            Text(album.ano.toString(), style: const TextStyle(fontSize: 14.0)),
          ],
        ),
      ),
    );
  }
}