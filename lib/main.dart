import 'package:flutter/material.dart';
import 'package:soundhub/managers/albuns_musicas_manager.dart';
import 'package:soundhub/managers/usuarios_manager.dart';
import 'package:soundhub/models/album.dart';
import 'package:soundhub/models/musica.dart';
import 'package:soundhub/models/usuario.dart';
import 'views/screens/homeScreen.dart';

void main() {
  final AlbumMusicsManager albumMusicsManager = AlbumMusicsManager();
  final UsuariosManager usuariosManager = UsuariosManager();
  _adicionarAlbuns(albumMusicsManager);
  _adicionarMusicas(albumMusicsManager);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme:  ThemeData(
        brightness: Brightness.dark,
      ),
    );
  }
}

void _adicionarAlbuns(AlbumMusicsManager albumMusicsManager)
{
  albumMusicsManager.adicionarAlbum(Album(nome: '1989', ano: 2014, genero: 'Pop', artista: 'Taylor Swift', imageUrl: 'assets/albuns/TaylorSwift/1989.jpg'));
  albumMusicsManager.adicionarAlbum(Album(nome: 'After Hours', ano: 2020, genero: 'Pop', artista: 'The Weeknd', imageUrl: 'assets/albuns/TheWeeknd/AfterHours.jpg'));
  albumMusicsManager.adicionarAlbum(Album(nome: 'Divide', ano: 2017, genero: 'Pop', artista: 'Ed Sheeran', imageUrl: 'assets/albuns/EdSheeran/Divide.jpg'));
  albumMusicsManager.adicionarAlbum(Album(nome: 'Doo-Wops & Hooligans', ano: 2010, genero: 'Pop', artista: 'Bruno Mars', imageUrl: 'assets/albuns/BrunoMars/DooWops_&_Hooligans.jpg'));
  albumMusicsManager.adicionarAlbum(Album(nome: 'Nevermind', ano: 1991, genero: 'Rock', artista: 'Nirvana', imageUrl: 'assets/albuns/Nirvana/Nevermind.jpg'));
  albumMusicsManager.adicionarAlbum(Album(nome: 'Abey Road', ano: 1991, genero: 'Rock', artista: 'Beatles', imageUrl: 'assets/albuns/Beatles/AbbeyRoad.jpg'));
  albumMusicsManager.adicionarAlbum(Album(nome: 'The Dark Side of the Moon', ano: 1973, genero: 'Rock', artista: 'Pink Floyd', imageUrl: 'assets/albuns/PinkFloyd/Dark_Side_of_the_Moon.jpg'));
}

void _adicionarMusicas(AlbumMusicsManager albumManager) {
  // Músicas do álbum '1989' de Taylor Swift
  albumManager.adicionarMusica(Musica(nome: 'Welcome to New York', ano: 2014, genero: 'Pop', artista: 'Taylor Swift', imageUrl: 'assets/albuns/TaylorSwift/1989.jpg', album: _getAlbumPorNome(albumManager, '1989')));
  albumManager.adicionarMusica(Musica(nome: 'Blank Space', ano: 2014, genero: 'Pop', artista: 'Taylor Swift', imageUrl: 'assets/albuns/TaylorSwift/1989.jpg', album: _getAlbumPorNome(albumManager, '1989')));
  albumManager.adicionarMusica(Musica(nome: 'Style', ano: 2014, genero: 'Pop', artista: 'Taylor Swift', imageUrl: 'assets/albuns/TaylorSwift/1989.jpg', album: _getAlbumPorNome(albumManager, '1989')));
  albumManager.adicionarMusica(Musica(nome: 'Out of the Woods', ano: 2014, genero: 'Pop', artista: 'Taylor Swift', imageUrl: 'assets/albuns/TaylorSwift/1989.jpg', album: _getAlbumPorNome(albumManager, '1989')));
  albumManager.adicionarMusica(Musica(nome: 'Shake It Off', ano: 2014, genero: 'Pop', artista: 'Taylor Swift', imageUrl: 'assets/albuns/TaylorSwift/1989.jpg', album: _getAlbumPorNome(albumManager, '1989')));

  // Músicas do álbum 'After Hours' de The Weeknd
  albumManager.adicionarMusica(Musica(nome: 'Alone Again', ano: 2020, genero: 'Pop', artista: 'The Weeknd', imageUrl: 'assets/albuns/TheWeeknd/AfterHours.jpg', album: _getAlbumPorNome(albumManager, 'After Hours')));
  albumManager.adicionarMusica(Musica(nome: 'Too Late', ano: 2020, genero: 'Pop', artista: 'The Weeknd', imageUrl: 'assets/albuns/TheWeeknd/AfterHours.jpg', album: _getAlbumPorNome(albumManager, 'After Hours')));
  albumManager.adicionarMusica(Musica(nome: 'Hardest to Love', ano: 2020, genero: 'Pop', artista: 'The Weeknd', imageUrl: 'assets/albuns/TheWeeknd/AfterHours.jpg', album: _getAlbumPorNome(albumManager, 'After Hours')));
  albumManager.adicionarMusica(Musica(nome: 'Scared to Live', ano: 2020, genero: 'Pop', artista: 'The Weeknd', imageUrl: 'assets/albuns/TheWeeknd/AfterHours.jpg', album: _getAlbumPorNome(albumManager, 'After Hours')));
  albumManager.adicionarMusica(Musica(nome: 'Blinding Lights', ano: 2020, genero: 'Pop', artista: 'The Weeknd', imageUrl: 'assets/albuns/TheWeeknd/AfterHours.jpg', album: _getAlbumPorNome(albumManager, 'After Hours')));

  // Músicas do álbum 'Divide' de Ed Sheeran
  albumManager.adicionarMusica(Musica(nome: 'Eraser', ano: 2017, genero: 'Pop', artista: 'Ed Sheeran', imageUrl: 'assets/albuns/EdSheeran/Divide.jpg', album: _getAlbumPorNome(albumManager, 'Divide')));
  albumManager.adicionarMusica(Musica(nome: 'Castle on the Hill', ano: 2017, genero: 'Pop', artista: 'Ed Sheeran', imageUrl: 'assets/albuns/EdSheeran/Divide.jpg', album: _getAlbumPorNome(albumManager, 'Divide')));
  albumManager.adicionarMusica(Musica(nome: 'Dive', ano: 2017, genero: 'Pop', artista: 'Ed Sheeran', imageUrl: 'assets/albuns/EdSheeran/Divide.jpg', album: _getAlbumPorNome(albumManager, 'Divide')));
  albumManager.adicionarMusica(Musica(nome: 'Shape of You', ano: 2017, genero: 'Pop', artista: 'Ed Sheeran', imageUrl: 'assets/albuns/EdSheeran/Divide.jpg', album: _getAlbumPorNome(albumManager, 'Divide')));
  albumManager.adicionarMusica(Musica(nome: 'Perfect', ano: 2017, genero: 'Pop', artista: 'Ed Sheeran', imageUrl: 'assets/albuns/EdSheeran/Divide.jpg', album: _getAlbumPorNome(albumManager, 'Divide')));

  // Músicas do álbum 'Doo-Wops & Hooligans' de Bruno Mars
  albumManager.adicionarMusica(Musica(nome: 'Grenade', ano: 2010, genero: 'Pop', artista: 'Bruno Mars', imageUrl: 'assets/albuns/BrunoMars/DooWops_&_Hooligans.jpg', album: _getAlbumPorNome(albumManager, 'Doo-Wops & Hooligans')));
  albumManager.adicionarMusica(Musica(nome: 'Just the Way You Are', ano: 2010, genero: 'Pop', artista: 'Bruno Mars', imageUrl: 'assets/albuns/BrunoMars/DooWops_&_Hooligans.jpg', album: _getAlbumPorNome(albumManager, 'Doo-Wops & Hooligans')));
  albumManager.adicionarMusica(Musica(nome: 'Our First Time', ano: 2010, genero: 'Pop', artista: 'Bruno Mars', imageUrl: 'assets/albuns/BrunoMars/DooWops_&_Hooligans.jpg', album: _getAlbumPorNome(albumManager, 'Doo-Wops & Hooligans')));
  albumManager.adicionarMusica(Musica(nome: 'Runaway Baby', ano: 2010, genero: 'Pop', artista: 'Bruno Mars', imageUrl: 'assets/albuns/BrunoMars/DooWops_&_Hooligans.jpg', album: _getAlbumPorNome(albumManager, 'Doo-Wops & Hooligans')));
  albumManager.adicionarMusica(Musica(nome: 'The Lazy Song', ano: 2010, genero: 'Pop', artista: 'Bruno Mars', imageUrl: 'assets/albuns/BrunoMars/DooWops_&_Hooligans.jpg', album: _getAlbumPorNome(albumManager, 'Doo-Wops & Hooligans')));

  // Músicas do álbum 'Nevermind' de Nirvana
  albumManager.adicionarMusica(Musica(nome: 'Smells Like Teen Spirit', ano: 1991, genero: 'Rock', artista: 'Nirvana', imageUrl: 'assets/albuns/Nirvana/Nevermind.jpg', album: _getAlbumPorNome(albumManager, 'Nevermind')));
  albumManager.adicionarMusica(Musica(nome: 'In Bloom', ano: 1991, genero: 'Rock', artista: 'Nirvana', imageUrl: 'assets/albuns/Nirvana/Nevermind.jpg', album: _getAlbumPorNome(albumManager, 'Nevermind')));
  albumManager.adicionarMusica(Musica(nome: 'Come as You Are', ano: 1991, genero: 'Rock', artista: 'Nirvana', imageUrl: 'assets/albuns/Nirvana/Nevermind.jpg', album: _getAlbumPorNome(albumManager, 'Nevermind')));
  albumManager.adicionarMusica(Musica(nome: 'Breed', ano: 1991, genero: 'Rock', artista: 'Nirvana', imageUrl: 'assets/albuns/Nirvana/Nevermind.jpg', album: _getAlbumPorNome(albumManager, 'Nevermind')));
  albumManager.adicionarMusica(Musica(nome: 'Lithium', ano: 1991, genero: 'Rock', artista: 'Nirvana', imageUrl: 'assets/albuns/Nirvana/Nevermind.jpg', album: _getAlbumPorNome(albumManager, 'Nevermind')));

  // Músicas do álbum 'Abey Road' dos Beatles
  albumManager.adicionarMusica(Musica(nome: 'Come Together', ano: 1969, genero: 'Rock', artista: 'Beatles', imageUrl: 'assets/albuns/Beatles/AbbeyRoad.jpg', album: _getAlbumPorNome(albumManager, 'Abey Road')));
  albumManager.adicionarMusica(Musica(nome: 'Something', ano: 1969, genero: 'Rock', artista: 'Beatles', imageUrl: 'assets/albuns/Beatles/AbbeyRoad.jpg', album: _getAlbumPorNome(albumManager, 'Abey Road')));
  albumManager.adicionarMusica(Musica(nome: 'Maxwell\'s Silver Hammer', ano: 1969, genero: 'Rock', artista: 'Beatles', imageUrl: 'assets/albuns/Beatles/AbbeyRoad.jpg', album: _getAlbumPorNome(albumManager, 'Abey Road')));
  albumManager.adicionarMusica(Musica(nome: 'Oh! Darling', ano: 1969, genero: 'Rock', artista: 'Beatles', imageUrl: 'assets/albuns/Beatles/AbbeyRoad.jpg', album: _getAlbumPorNome(albumManager, 'Abey Road')));
  albumManager.adicionarMusica(Musica(nome: 'Octopus\'s Garden', ano: 1969, genero: 'Rock', artista: 'Beatles', imageUrl: 'assets/albuns/Beatles/AbbeyRoad.jpg', album: _getAlbumPorNome(albumManager, 'Abey Road')));

  // Músicas do álbum 'The Dark Side of the Moon' do Pink Floyd
  albumManager.adicionarMusica(Musica(nome: 'Speak to Me', ano: 1973, genero: 'Rock', artista: 'Pink Floyd', imageUrl: 'assets/albuns/PinkFloyd/Dark_Side_of_the_Moon.jpg', album: _getAlbumPorNome(albumManager, 'The Dark Side of the Moon')));
  albumManager.adicionarMusica(Musica(nome: 'Breathe', ano: 1973, genero: 'Rock', artista: 'Pink Floyd', imageUrl: 'assets/albuns/PinkFloyd/Dark_Side_of_the_Moon.jpg', album: _getAlbumPorNome(albumManager, 'The Dark Side of the Moon')));
  albumManager.adicionarMusica(Musica(nome: 'On the Run', ano: 1973, genero: 'Rock', artista: 'Pink Floyd', imageUrl: 'assets/albuns/PinkFloyd/Dark_Side_of_the_Moon.jpg', album: _getAlbumPorNome(albumManager, 'The Dark Side of the Moon')));
  albumManager.adicionarMusica(Musica(nome: 'Time', ano: 1973, genero: 'Rock', artista: 'Pink Floyd', imageUrl: 'assets/albuns/PinkFloyd/Dark_Side_of_the_Moon.jpg', album: _getAlbumPorNome(albumManager, 'The Dark Side of the Moon')));
  albumManager.adicionarMusica(Musica(nome: 'Money', ano: 1973, genero: 'Rock', artista: 'Pink Floyd', imageUrl: 'assets/albuns/PinkFloyd/Dark_Side_of_the_Moon.jpg', album: _getAlbumPorNome(albumManager, 'The Dark Side of the Moon')));
}

Album? _getAlbumPorNome(AlbumMusicsManager albumManager, String nomeAlbum) {
  return albumManager.albums.firstWhere((album) => album.nome == nomeAlbum);
}


