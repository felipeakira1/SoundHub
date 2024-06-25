import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soundhub/bloc/album_review_bloc.dart';
import 'package:soundhub/models/album.dart';
import 'package:soundhub/widgets/album_info.dart';
import 'package:soundhub/widgets/app_bars.dart';
import 'package:soundhub/widgets/custom_elevated_button.dart';
import 'package:soundhub/widgets/custom_text_form_field.dart';

class ReviewAlbumPage extends StatefulWidget {
  final Album album;
  const ReviewAlbumPage({super.key, required this.album});

  @override
  State<ReviewAlbumPage> createState() => _ReviewAlbumPageState();
}

class _ReviewAlbumPageState extends State<ReviewAlbumPage> {
  final TextEditingController _descriptionController = TextEditingController();
  int _rating = 0;

  @override
  void initState() {
    super.initState();
    context
        .read<AlbumReviewBloc>()
        .add(CheckForExistingReview(albumId: widget.album.uid ?? ''));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ReturnAppBar(),
      body: BlocListener<AlbumReviewBloc, AlbumReviewState>(
        listener: (context, state) {
          if (state is ExistingReviewFound) {
            _rating = state.review.rating;
            _descriptionController.text = state.review.description;
          }
          if (state is AddAlbumReviewSuccess) {
            ScaffoldMessenger.of(context)
              ..removeCurrentSnackBar()
              ..showSnackBar(
                  const SnackBar(content: Text('Review Added Successfully!')));
          } else if (state is AddAlbumReviewFailure) {
            ScaffoldMessenger.of(context)
              ..removeCurrentSnackBar()
              ..showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        child: BlocBuilder<AlbumReviewBloc, AlbumReviewState>(
          builder: (context, state) {
            if(state is CheckForExistingReview) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is AlbumReviewError) {
              return Center(child: Text(state.message),);
            } else {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(child: Image.asset(widget.album.imageUrl)),
                      const SizedBox(width: 20),
                      Expanded(
                          child: AlbumInformation(
                              title: widget.album.name,
                              informations: [
                            widget.album.artistName,
                            widget.album.year.toString(),
                          ])),
                    ],
                  ),
                  const SizedBox(height: 20),
                  buildRatingSection(),
                  const SizedBox(height: 20),
                  buildDescriptionField(),
                  const SizedBox(height: 20),
                  CustomElevatedButton(
                    title: 'SUBMIT REVIEW',
                    onPressed: () {
                      context.read<AlbumReviewBloc>().add(
                            SubmitAlbumReview(
                                rating: _rating,
                                description: _descriptionController.text,
                                albumId: widget.album.uid ?? ''),
                          );
                    },
                  ),
                ],
              ),
            );
            }
          },
        ),
      ),
    );
  }

  Widget buildRatingSection() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Rating: ${_rating.toString()}/10',
              style: const TextStyle(fontSize: 18, color: Colors.white),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(10, (index) => buildRatingCircle(index)),
        ),
      ],
    );
  }

  Widget buildRatingCircle(int index) {
    bool isSelected = index < _rating;
    return GestureDetector(
      onTap: () {
        setState(() {
          _rating = index + 1;
        });
      },
      child: Container(
        width: 30,
        height: 30,
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? Colors.pink : Colors.grey,
        ),
      ),
    );
  }

  Widget buildDescriptionField() {
    return CustomTextFormField(
      text: 'Description',
      controller: _descriptionController,
    );
  }
}
