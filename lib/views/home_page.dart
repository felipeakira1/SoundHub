import 'package:flutter/material.dart';
import 'package:soundhub/views/app_bars.dart';
import 'package:soundhub/models/album.dart';
import 'package:soundhub/models/album_manager.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final AlbumManager albumManager = AlbumManager();

  @override
  Widget build(BuildContext context) {
    List<Album> albumsPop = albumManager.albums.where((album) => album.genero == 'Pop').toList();
    return Scaffold(
      appBar: HomePageAppBar(),
      drawer: const Drawer(),
      body: Container(
        constraints: const BoxConstraints.expand(height: 300),
        child: ListView(
          padding: const EdgeInsets.all(8.0),
          children: [
            Text(albumsPop.length.toString()),
            const Text('Albuns pop', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white)),
            Container(
              height: 250,
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: albumsPop.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(albumsPop[index].nome),
                            actions: [
                              TextButton(onPressed: () {
                                Navigator.of(context).pop();
                              }, child: const Text('Fechar'))
                            ],
                          );
                        }
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8.0),
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            albumsPop[index].imageUrl,
                            width: 120,
                            height: 120,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            albumsPop[index].nome,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                              ),
                            ),
                          Text(
                            albumsPop[index].autor,
                            style: const TextStyle(fontSize: 14.0),
                          ),
                          Text(
                            albumsPop[index].ano.toString(),
                            style: const TextStyle(fontSize: 14.0),
                          ),
                        ],
                      ),
                    ),
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