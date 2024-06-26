import 'package:flutter/material.dart';
import 'package:soundhub/models/album.dart';
import 'package:soundhub/views/details/details_artist_page.dart';

// ignore: must_be_immutable
class AlbumInformation extends StatelessWidget {
  Album album;

  AlbumInformation({
    super.key,
    required this.album
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(album.name, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
        TextButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailsArtistPage(artist: album.artist)));
          }, 
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Text(
            album.artist.name, 
            style: const TextStyle(fontSize: 18, color: Colors.white),
          )
        ),
        Text(album.year.toString(), style: const TextStyle(fontSize: 18, color: Colors.white),),
      ],
    );
  }
}
