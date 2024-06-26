import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomImage(imageUrl: album.imageUrl),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(child: AlbumInformation(album: album,)),
                  ReviewButton(album: album),
                ],
              ),
              const SizedBox(height: 20,),
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: const Color(0xff333533),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: album.musics.length,
                  itemBuilder: (context, index) {
                    final music = album.musics[index];
                    return ListTile(
                      title: Text('${index+1} $music'),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}