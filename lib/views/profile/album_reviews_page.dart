import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soundhub/bloc/album_reviews_bloc.dart';
import 'package:soundhub/widgets/app_bars.dart';

class AlbumReviewsPage extends StatefulWidget {
  const AlbumReviewsPage({super.key});

  @override
  State<AlbumReviewsPage> createState() => _AlbumReviewsPageState();
}

class _AlbumReviewsPageState extends State<AlbumReviewsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ReturnAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text('Albuns Ratings'),
            Expanded(
              child: BlocBuilder<AlbumReviewsBloc, AlbumReviewState>(
                builder: (context, state) {
                  return const Center(
                      child: Text('Loading'),
                    );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}