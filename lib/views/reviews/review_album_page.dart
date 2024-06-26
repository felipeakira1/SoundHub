import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soundhub/bloc/album_review_bloc.dart';
import 'package:soundhub/models/album.dart';
import 'package:soundhub/models/album_review.dart';
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
        .add(LoadAlbumReview(albumId: widget.album.uid ?? ''));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ReturnAppBar(),
      body: BlocListener<AlbumReviewBloc, AlbumReviewState>(
        listener: (context, state) {
          if (state is AlbumReviewFound) {
            _rating = state.review.rating;
            _descriptionController.text = state.review.description;
          }
          if (state is AlbumReviewSubmitted) {
            ScaffoldMessenger.of(context)
              ..removeCurrentSnackBar()
              ..showSnackBar(
                  const SnackBar(
                    content: Text('Review Added Successfully!'),
                    duration: Duration(seconds: 2),
                  ));
            Future.delayed(const Duration(seconds: 2), () {
              Navigator.of(context).pop();
            });
          } else if(state is AlbumReviewUpdated) {
            ScaffoldMessenger.of(context)
              ..removeCurrentSnackBar()
              ..showSnackBar(
                const SnackBar(
                  content: Text('Review Updated Successfully!'),
                  duration: Duration(seconds: 2),
                ));
            Future.delayed(const Duration(seconds: 2), () {
              Navigator.of(context).pop();
            });
          }
        },
        child: BlocBuilder<AlbumReviewBloc, AlbumReviewState>(
          builder: (context, state) {
            if(state is LoadAlbumReview) {
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
                          child: AlbumInformation(album: widget.album)),
                    ],
                  ),
                  const SizedBox(height: 20),
                  buildRatingSection(),
                  const SizedBox(height: 20),
                  buildDescriptionField(),
                  const SizedBox(height: 20),
                  BlocBuilder<AlbumReviewBloc, AlbumReviewState>(
                    builder: (context, state) {
                      if(state is AlbumReviewLoading) {
                        return const Center(child: CircularProgressIndicator(),);
                      } else if (state is AlbumReviewNotFound) {
                        return CustomElevatedButton(
                          title: 'SUBMIT REVIEW',
                          onPressed: () {
                            context.read<AlbumReviewBloc>().add(
                                  SubmitAlbumReview(
                                      rating: _rating,
                                      description: _descriptionController.text,
                                      albumId: widget.album.uid ?? ''),
                                );
                          },
                        );
                      } else if (state is AlbumReviewFound) {
                        return CustomElevatedButton(
                          title: 'UPDATE REVIEW',
                          onPressed: () {
                            context.read<AlbumReviewBloc>().add(
                              UpdateAlbumReview(
                                reviewId: state.review.uid,
                                rating: _rating, 
                                description: _descriptionController.text, )
                            );
                          },
                        );
                      } else if (state is AlbumReviewError) {
                        return Text(state.message);
                      } else {
                        return const Text('');
                      }
                    },
                  )
                  
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
