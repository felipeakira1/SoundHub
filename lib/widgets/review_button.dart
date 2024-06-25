import 'package:flutter/material.dart';

import 'package:soundhub/models/album.dart';
import 'package:soundhub/views/reviews/review_album_page.dart';

class ReviewButton extends StatelessWidget {
  Album album;
  ReviewButton({
    super.key,
    required this.album,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: const Icon(Icons.thumb_up, color: Colors.white),
      label: const Text('Avaliar', style: TextStyle(fontSize: 18, color: Colors.white),),
      onPressed: () {
        Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ReviewAlbumPage(album: album)),
        );
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
            const Color(0xffDB1675)),
      ),
    );
  }
}
