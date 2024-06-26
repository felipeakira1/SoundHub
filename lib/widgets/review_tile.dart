import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soundhub/bloc/user_album_reviews_bloc.dart';
import 'package:soundhub/models/album_review.dart';
import 'package:soundhub/views/details/details_album_page.dart';
import 'package:soundhub/views/reviews/review_album_page.dart';
import 'package:soundhub/widgets/custom_elevated_button.dart';

class ReviewTile extends StatelessWidget {
  final AlbumReview review;

  const ReviewTile({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailsAlbumPage(album: review.album))),
      child: Card(
        elevation: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Image.network(review.album.imageUrl, fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                review.album.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                'Rating: ${review.rating}/10',
                style: const TextStyle(fontSize: 14),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                review.description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ReviewAlbumPage(album: review.album)));
                  }, 
                  icon: const Icon(Icons.update), 
                  label: const Text('Update', style: TextStyle(fontSize: 12),)),
                ElevatedButton.icon(
                  onPressed: () {
                    context.read<UserAlbumReviewsBloc>().add(DeleteUserAlbumReview(albumReviewId: review.uid));
                  }, 
                  icon: const Icon(Icons.delete), 
                  label: const Text('Delete', style: TextStyle(fontSize: 12),)),
              ],
            )
          ],
        ),
      ),
    );
  }
}