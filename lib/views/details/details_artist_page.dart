import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soundhub/bloc/details_artist_bloc.dart';
import 'package:soundhub/models/artist.dart';
import 'package:soundhub/views/details/details_album_page.dart';
import 'package:soundhub/widgets/app_bars.dart';

class DetailsArtistPage extends StatefulWidget {
  final Artist artist;
  const DetailsArtistPage({super.key, required this.artist});

  @override
  State<DetailsArtistPage> createState() => _DetailsArtistPageState();
}

class _DetailsArtistPageState extends State<DetailsArtistPage> {
  @override
  void initState() {
    super.initState();
    context.read<DetailsArtistBloc>().add(FetchAlbums(artistId: widget.artist.uid ?? ''));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ReturnAppBar(),  // Supondo que você tenha uma AppBar com funcionalidade de retorno
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(child: Image.asset(widget.artist.imageUrl)),
                const SizedBox(width: 20,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.artist.name, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),),
                      Text("Musical genres: ${widget.artist.musicalGenres}", style: const TextStyle(fontSize: 18, color: Colors.white),),
                      Text("Birth year: ${widget.artist.birthYear}", style: const TextStyle(fontSize: 18, color: Colors.white),),
                    ],
                  )
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text("Biography", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(widget.artist.biography, style: const TextStyle(fontSize: 16, color: Colors.white), textAlign: TextAlign.justify),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text("Albums", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
            ),
            BlocBuilder<DetailsArtistBloc, DetailsArtistState>(
              builder: (context, state) {
                if(state is AlbumsEmpty) {
                  return const Center(child: Text('No albums founded'),);
                } else if (state is AlbumsLoaded) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.albums.length,
                    itemBuilder: (context, index) {
                      final album = state.albums[index];
                      return ListTile(
                        leading: Image.asset(album.imageUrl, width: 56, height: 56, fit: BoxFit.cover),
                        title: Text(album.name),
                        subtitle: Text(album.year.toString()),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailsAlbumPage(album: album)));
                        },
                      );
                    });
                } else {
                  return const Center(child: CircularProgressIndicator(),);
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
