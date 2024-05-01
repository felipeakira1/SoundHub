import 'package:flutter/material.dart';
import 'package:soundhub/views/app_bars.dart';
import 'package:soundhub/models/album.dart';
import 'package:soundhub/models/album_manager.dart';
import 'package:soundhub/views/searchScreen.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final AlbumManager albumManager = AlbumManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomePageAppBar(),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'Soundhub',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Menu Inicial'),
              onTap: () {
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
            ),
            ListTile(
              title: Text('Pesquisar'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TelaDePesquisa()),
                );
              },
            ),
          ],
        ),
      ),
      body: Container(
        constraints: const BoxConstraints.expand(),
        child: ListView(
          padding: const EdgeInsets.all(8.0),
          children: [
            buildSection('Albuns Pop', 'Pop'),
            buildSection('Albuns Rock', 'Rock'),
          ],
        ),
      ),

    );
  }

  Widget buildSection(String title, String genero) {
    List<Album> albumsGenero = albumManager.albums.where((album) => album.genero == genero).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title, 
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
          textAlign: TextAlign.start,
        ),
        Container(
            height: 250,
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: albumsGenero.length,
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(albumsGenero[index].nome),
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
                              albumsGenero[index].imageUrl,
                              width: 120,
                              height: 120,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              albumsGenero[index].nome,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                ),
                              ),
                            Text(
                              albumsGenero[index].autor,
                              style: const TextStyle(fontSize: 14.0),
                            ),
                            Text(
                              albumsGenero[index].ano.toString(),
                              style: const TextStyle(fontSize: 14.0),
                            ),
                          ],
                        ),
                      ),
                    );
                }
            )
        ),
      ],
    );
  }
}