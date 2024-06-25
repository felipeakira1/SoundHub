import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soundhub/bloc/user_album_reviews_bloc.dart';
import 'package:soundhub/models/album_review.dart';
import 'package:soundhub/widgets/app_bars.dart';

class AlbumReviewsPage extends StatefulWidget {
  const AlbumReviewsPage({super.key});

  @override
  State<AlbumReviewsPage> createState() => _AlbumReviewsPageState();
}

class _AlbumReviewsPageState extends State<AlbumReviewsPage> {
  @override
  void initState() {
    super.initState();
    context.read<UserAlbumReviewsBloc>().add(LoadUserAlbumReviews());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ReturnAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text('Your Album Reviews', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
            Expanded(
              child: BlocBuilder<UserAlbumReviewsBloc, UserAlbumReviewsState>(
                 builder: (context, state) {
                  if (state is UserAlbumReviewsLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is UserAlbumReviewsLoaded) {
                    return buildAlbumReviewsGrid(state.reviews);
                  } else if (state is UserAlbumReviewsError) {
                    return Center(child: Text(state.message));
                  }
                  return const Center(child: Text('No reviews found'));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildAlbumReviewsGrid(List<AlbumReview> reviews) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Adjust number of columns
        crossAxisSpacing: 10, // Space between columns
        mainAxisSpacing: 10, // Space between rows
        childAspectRatio: 3/4, // Aspect ratio of each grid tile
      ),
      itemCount: reviews.length,
      itemBuilder: (context, index) {
        return buildReviewTile(reviews[index]);
      },
    );
  }

  Widget buildReviewTile(AlbumReview review) {
    return Card(
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Image.network(
              review.album.imageUrl,
              fit: BoxFit.cover,
            ),
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
        ],
      ),
    );
  }
}