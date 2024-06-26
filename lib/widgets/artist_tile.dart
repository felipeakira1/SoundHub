import 'package:flutter/material.dart';
import 'package:soundhub/models/artist.dart';
import 'package:soundhub/views/details/details_artist_page.dart';

class ArtistTile extends StatelessWidget {
  final Artist artist;

  const ArtistTile({super.key, required this.artist});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias, // Adiciona clipping com bordas suaves
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), // Borda arredondada para o cartão
      ),
      child: InkWell(
        onTap: () {
          // Ação ao tocar no tile, por exemplo, abrir uma tela de detalhes do artista
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsArtistPage(artist: artist),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, // Estende os filhos horizontalmente
          children: [
            Expanded(
              child: Image.network(
                artist.imageUrl,
                fit: BoxFit.cover, // Cobrir o espaço disponível sem perder a proporção
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                artist.name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis, // Adiciona "..." se o texto for muito longo
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'test',
                style: TextStyle(fontSize: 14),
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }
}
