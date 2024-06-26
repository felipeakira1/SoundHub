import 'package:flutter/material.dart';
import 'package:soundhub/models/artist.dart';
import 'package:soundhub/widgets/app_bars.dart';

class DetailsArtistPage extends StatefulWidget {
  final Artist artist;
  const DetailsArtistPage({super.key, required this.artist});

  @override
  State<DetailsArtistPage> createState() => _DetailsArtistPageState();
}

class _DetailsArtistPageState extends State<DetailsArtistPage> {
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
          ],
        ),
      ),
    );
  }
}
