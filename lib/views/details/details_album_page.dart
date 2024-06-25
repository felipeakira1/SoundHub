import 'package:flutter/material.dart';
import 'package:soundhub/models/album.dart';
import 'package:soundhub/widgets/album_info.dart';
import 'package:soundhub/widgets/app_bars.dart';
import 'package:soundhub/widgets/custom_image.dart';
import 'package:soundhub/widgets/review_button.dart';

class DetailsAlbumPage extends StatelessWidget {
  final Album album;
  const DetailsAlbumPage({super.key, required this.album});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ReturnAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomImage(imageUrl: album.imageUrl),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(child: AlbumInformation(title: album.name, informations: [album.artistName])),
                ReviewButton(album: album),
              ],
            ),
          ],
        ),
      )
    );
  }
}