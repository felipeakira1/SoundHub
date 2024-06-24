import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soundhub/widgets/app_bars.dart';

class AlbumReviewsPage extends StatefulWidget {
  const AlbumReviewsPage({super.key});

  @override
  State<AlbumReviewsPage> createState() => _AlbumReviewsPageState();
}

class _AlbumReviewsPageState extends State<AlbumReviewsPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: ReturnAppBar(),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Albuns Ratings'),
            Expanded(
              child: BlocBuilder<PlacehodlerBloc, PlaceholderState(
                builder: (context, state) {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}