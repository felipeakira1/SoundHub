import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soundhub/bloc/authentication/authentication_bloc.dart';
import 'package:soundhub/bloc/profile/profile_bloc.dart';
import 'package:soundhub/bloc/search/search_album_bloc.dart';
import 'package:soundhub/config/app_config.dart';
import 'package:soundhub/views/wrapper.dart';

// Firebase
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: AppConfig.firebaseApiKey,
    authDomain: AppConfig.firebaseAuthDomain,
    projectId: AppConfig.firebaseProjectId,
    storageBucket: AppConfig.firebaseStorageBucket,
    messagingSenderId: AppConfig.firebaseMessagingSenderId,
    appId: AppConfig.firebaseAppId,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthenticationBloc(),
        ),
        BlocProvider(
          create: (context) => SearchAlbumBloc(),
        ),
        BlocProvider(create: (context) => ProfileBloc()),
      ],
      child: MaterialApp(
        home: const Wrapper(),
        theme: ThemeData(
          brightness: Brightness.dark,
        ),
      ),
    );
  }
}

// void _adicionarArtistas(AlbumMusicsManager albumMusicsManager)
// {
//    albumMusicsManager.adicionarArtista(Artista(
//     nome: 'Taylor Swift',
//     anoNascimento: 1989,
//     generoMusical: 'Pop',
//     biografia: 'Taylor Swift é uma cantora e compositora norte-americana...',
//     imageUrl: 'assets/artistas/TaylorSwift.jpg',
//     albuns: [Album(nome: '1989', ano: 2014, genero: 'Pop', artista: 'Taylor Swift', imageUrl: 'assets/albuns/TaylorSwift/1989.jpg')]
//   ));

//   albumMusicsManager.adicionarArtista(Artista(
//     nome: 'The Weeknd',
//     anoNascimento: 1990,
//     generoMusical: 'R&B',
//     biografia: 'The Weeknd, nome artístico de Abel Makkonen Tesfaye, é um cantor, compositor e produtor canadense...',
//     imageUrl: 'assets/artistas/TheWeeknd.jpg'
//   ));

//   albumMusicsManager.adicionarArtista(Artista(
//     nome: 'Ed Sheeran',
//     anoNascimento: 1991,
//     generoMusical: 'Pop',
//     biografia: 'Ed Sheeran é um cantor e compositor britânico...',
//     imageUrl: 'assets/artistas/EdSheeran.jpg'
//   ));
// }

// void _adicionarAlbuns(AlbumMusicsManager albumMusicsManager)
// {
//   albumMusicsManager.adicionarAlbum(Album(nome: '1989', ano: 2014, genero: 'Pop', artista: 'Taylor Swift', imageUrl: 'assets/albuns/TaylorSwift/1989.jpg'));
//   albumMusicsManager.adicionarAlbum(Album(nome: 'After Hours', ano: 2020, genero: 'Pop', artista: 'The Weeknd', imageUrl: 'assets/albuns/TheWeeknd/AfterHours.jpg'));
//   albumMusicsManager.adicionarAlbum(Album(nome: 'Divide', ano: 2017, genero: 'Pop', artista: 'Ed Sheeran', imageUrl: 'assets/albuns/EdSheeran/Divide.jpg'));
//   albumMusicsManager.adicionarAlbum(Album(nome: 'Doo-Wops & Hooligans', ano: 2010, genero: 'Pop', artista: 'Bruno Mars', imageUrl: 'assets/albuns/BrunoMars/DooWops_&_Hooligans.jpg'));

//   // Rock
//   albumMusicsManager.adicionarAlbum(Album(nome: 'Nevermind', ano: 1991, genero: 'Rock', artista: 'Nirvana', imageUrl: 'assets/albuns/Nirvana/Nevermind.jpg'));
//   albumMusicsManager.adicionarAlbum(Album(nome: 'Abbey Road', ano: 1991, genero: 'Rock', artista: 'Beatles', imageUrl: 'assets/albuns/Beatles/AbbeyRoad.jpg'));
//   albumMusicsManager.adicionarAlbum(Album(nome: 'The Dark Side of the Moon', ano: 1973, genero: 'Rock', artista: 'Pink Floyd', imageUrl: 'assets/albuns/PinkFloyd/Dark_Side_of_the_Moon.jpg'));
//   albumMusicsManager.adicionarAlbum(Album(nome: 'Hotel California', ano: 1976, genero: 'Rock', artista: 'Eagles', imageUrl: 'assets/albuns/Eagles/HotelCalifornia.jpg'));

//   // Sertanejo
//   albumMusicsManager.adicionarAlbum(Album(nome: 'É Divino', ano: 2014, genero: 'Sertanejo', artista: 'Jorge e Mateus', imageUrl: 'assets/albuns/JorgeMateus/EDivino.jpg'));
//   albumMusicsManager.adicionarAlbum(Album(nome: 'Incerteza', ano: 2016, genero: 'Sertanejo', artista: 'Matheus e Kauan', imageUrl: 'assets/albuns/MatheusKauan/Incerteza.jpg'));
//   albumMusicsManager.adicionarAlbum(Album(nome: 'Ao Vivo em Brasília', ano: 2014, genero: 'Sertanejo', artista: 'Wesley Safadão', imageUrl: 'assets/albuns/WesleySafadao/AoVivoEmBrasilia.jpg'));
//   albumMusicsManager.adicionarAlbum(Album(nome: 'Marília Mendonça: Ao Vivo', ano: 2016, genero: 'Sertanejo', artista: 'Marília Mendonça', imageUrl: 'assets/albuns/MariliaMendonca/AoVivo.jpg'));
// }

// void _adicionarMusicas(AlbumMusicsManager albumManager) {
//   // Músicas do álbum '1989' de Taylor Swift
//   albumManager.adicionarMusica(Musica(nome: 'Welcome to New York', ano: 2014, genero: 'Pop', artista: 'Taylor Swift', imageUrl: 'assets/albuns/TaylorSwift/1989.jpg', album: _getAlbumPorNome(albumManager, '1989')));
//   albumManager.adicionarMusica(Musica(nome: 'Blank Space', ano: 2014, genero: 'Pop', artista: 'Taylor Swift', imageUrl: 'assets/albuns/TaylorSwift/1989.jpg', album: _getAlbumPorNome(albumManager, '1989')));
//   albumManager.adicionarMusica(Musica(nome: 'Style', ano: 2014, genero: 'Pop', artista: 'Taylor Swift', imageUrl: 'assets/albuns/TaylorSwift/1989.jpg', album: _getAlbumPorNome(albumManager, '1989')));
//   albumManager.adicionarMusica(Musica(nome: 'Out of the Woods', ano: 2014, genero: 'Pop', artista: 'Taylor Swift', imageUrl: 'assets/albuns/TaylorSwift/1989.jpg', album: _getAlbumPorNome(albumManager, '1989')));
//   albumManager.adicionarMusica(Musica(nome: 'Shake It Off', ano: 2014, genero: 'Pop', artista: 'Taylor Swift', imageUrl: 'assets/albuns/TaylorSwift/1989.jpg', album: _getAlbumPorNome(albumManager, '1989')));

//   // Músicas do álbum 'After Hours' de The Weeknd
//   albumManager.adicionarMusica(Musica(nome: 'Alone Again', ano: 2020, genero: 'Pop', artista: 'The Weeknd', imageUrl: 'assets/albuns/TheWeeknd/AfterHours.jpg', album: _getAlbumPorNome(albumManager, 'After Hours')));
//   albumManager.adicionarMusica(Musica(nome: 'Too Late', ano: 2020, genero: 'Pop', artista: 'The Weeknd', imageUrl: 'assets/albuns/TheWeeknd/AfterHours.jpg', album: _getAlbumPorNome(albumManager, 'After Hours')));
//   albumManager.adicionarMusica(Musica(nome: 'Hardest to Love', ano: 2020, genero: 'Pop', artista: 'The Weeknd', imageUrl: 'assets/albuns/TheWeeknd/AfterHours.jpg', album: _getAlbumPorNome(albumManager, 'After Hours')));
//   albumManager.adicionarMusica(Musica(nome: 'Scared to Live', ano: 2020, genero: 'Pop', artista: 'The Weeknd', imageUrl: 'assets/albuns/TheWeeknd/AfterHours.jpg', album: _getAlbumPorNome(albumManager, 'After Hours')));
//   albumManager.adicionarMusica(Musica(nome: 'Blinding Lights', ano: 2020, genero: 'Pop', artista: 'The Weeknd', imageUrl: 'assets/albuns/TheWeeknd/AfterHours.jpg', album: _getAlbumPorNome(albumManager, 'After Hours')));

//   // Músicas do álbum 'Divide' de Ed Sheeran
//   albumManager.adicionarMusica(Musica(nome: 'Eraser', ano: 2017, genero: 'Pop', artista: 'Ed Sheeran', imageUrl: 'assets/albuns/EdSheeran/Divide.jpg', album: _getAlbumPorNome(albumManager, 'Divide')));
//   albumManager.adicionarMusica(Musica(nome: 'Castle on the Hill', ano: 2017, genero: 'Pop', artista: 'Ed Sheeran', imageUrl: 'assets/albuns/EdSheeran/Divide.jpg', album: _getAlbumPorNome(albumManager, 'Divide')));
//   albumManager.adicionarMusica(Musica(nome: 'Dive', ano: 2017, genero: 'Pop', artista: 'Ed Sheeran', imageUrl: 'assets/albuns/EdSheeran/Divide.jpg', album: _getAlbumPorNome(albumManager, 'Divide')));
//   albumManager.adicionarMusica(Musica(nome: 'Shape of You', ano: 2017, genero: 'Pop', artista: 'Ed Sheeran', imageUrl: 'assets/albuns/EdSheeran/Divide.jpg', album: _getAlbumPorNome(albumManager, 'Divide')));
//   albumManager.adicionarMusica(Musica(nome: 'Perfect', ano: 2017, genero: 'Pop', artista: 'Ed Sheeran', imageUrl: 'assets/albuns/EdSheeran/Divide.jpg', album: _getAlbumPorNome(albumManager, 'Divide')));

//   // Músicas do álbum 'Doo-Wops & Hooligans' de Bruno Mars
//   albumManager.adicionarMusica(Musica(nome: 'Grenade', ano: 2010, genero: 'Pop', artista: 'Bruno Mars', imageUrl: 'assets/albuns/BrunoMars/DooWops_&_Hooligans.jpg', album: _getAlbumPorNome(albumManager, 'Doo-Wops & Hooligans')));
//   albumManager.adicionarMusica(Musica(nome: 'Just the Way You Are', ano: 2010, genero: 'Pop', artista: 'Bruno Mars', imageUrl: 'assets/albuns/BrunoMars/DooWops_&_Hooligans.jpg', album: _getAlbumPorNome(albumManager, 'Doo-Wops & Hooligans')));
//   albumManager.adicionarMusica(Musica(nome: 'Our First Time', ano: 2010, genero: 'Pop', artista: 'Bruno Mars', imageUrl: 'assets/albuns/BrunoMars/DooWops_&_Hooligans.jpg', album: _getAlbumPorNome(albumManager, 'Doo-Wops & Hooligans')));
//   albumManager.adicionarMusica(Musica(nome: 'Runaway Baby', ano: 2010, genero: 'Pop', artista: 'Bruno Mars', imageUrl: 'assets/albuns/BrunoMars/DooWops_&_Hooligans.jpg', album: _getAlbumPorNome(albumManager, 'Doo-Wops & Hooligans')));
//   albumManager.adicionarMusica(Musica(nome: 'The Lazy Song', ano: 2010, genero: 'Pop', artista: 'Bruno Mars', imageUrl: 'assets/albuns/BrunoMars/DooWops_&_Hooligans.jpg', album: _getAlbumPorNome(albumManager, 'Doo-Wops & Hooligans')));

//   // Músicas do álbum 'Nevermind' de Nirvana
//   albumManager.adicionarMusica(Musica(nome: 'Smells Like Teen Spirit', ano: 1991, genero: 'Rock', artista: 'Nirvana', imageUrl: 'assets/albuns/Nirvana/Nevermind.jpg', album: _getAlbumPorNome(albumManager, 'Nevermind')));
//   albumManager.adicionarMusica(Musica(nome: 'In Bloom', ano: 1991, genero: 'Rock', artista: 'Nirvana', imageUrl: 'assets/albuns/Nirvana/Nevermind.jpg', album: _getAlbumPorNome(albumManager, 'Nevermind')));
//   albumManager.adicionarMusica(Musica(nome: 'Come as You Are', ano: 1991, genero: 'Rock', artista: 'Nirvana', imageUrl: 'assets/albuns/Nirvana/Nevermind.jpg', album: _getAlbumPorNome(albumManager, 'Nevermind')));
//   albumManager.adicionarMusica(Musica(nome: 'Breed', ano: 1991, genero: 'Rock', artista: 'Nirvana', imageUrl: 'assets/albuns/Nirvana/Nevermind.jpg', album: _getAlbumPorNome(albumManager, 'Nevermind')));
//   albumManager.adicionarMusica(Musica(nome: 'Lithium', ano: 1991, genero: 'Rock', artista: 'Nirvana', imageUrl: 'assets/albuns/Nirvana/Nevermind.jpg', album: _getAlbumPorNome(albumManager, 'Nevermind')));

//   // Músicas do álbum 'Abey Road' dos Beatles
//   albumManager.adicionarMusica(Musica(nome: 'Come Together', ano: 1969, genero: 'Rock', artista: 'Beatles', imageUrl: 'assets/albuns/Beatles/AbbeyRoad.jpg', album: _getAlbumPorNome(albumManager, 'Abey Road')));
//   albumManager.adicionarMusica(Musica(nome: 'Something', ano: 1969, genero: 'Rock', artista: 'Beatles', imageUrl: 'assets/albuns/Beatles/AbbeyRoad.jpg', album: _getAlbumPorNome(albumManager, 'Abey Road')));
//   albumManager.adicionarMusica(Musica(nome: 'Maxwell\'s Silver Hammer', ano: 1969, genero: 'Rock', artista: 'Beatles', imageUrl: 'assets/albuns/Beatles/AbbeyRoad.jpg', album: _getAlbumPorNome(albumManager, 'Abey Road')));
//   albumManager.adicionarMusica(Musica(nome: 'Oh! Darling', ano: 1969, genero: 'Rock', artista: 'Beatles', imageUrl: 'assets/albuns/Beatles/AbbeyRoad.jpg', album: _getAlbumPorNome(albumManager, 'Abey Road')));
//   albumManager.adicionarMusica(Musica(nome: 'Octopus\'s Garden', ano: 1969, genero: 'Rock', artista: 'Beatles', imageUrl: 'assets/albuns/Beatles/AbbeyRoad.jpg', album: _getAlbumPorNome(albumManager, 'Abey Road')));

//   // Músicas do álbum 'The Dark Side of the Moon' do Pink Floyd
//   albumManager.adicionarMusica(Musica(nome: 'Speak to Me', ano: 1973, genero: 'Rock', artista: 'Pink Floyd', imageUrl: 'assets/albuns/PinkFloyd/Dark_Side_of_the_Moon.jpg', album: _getAlbumPorNome(albumManager, 'The Dark Side of the Moon')));
//   albumManager.adicionarMusica(Musica(nome: 'Breathe', ano: 1973, genero: 'Rock', artista: 'Pink Floyd', imageUrl: 'assets/albuns/PinkFloyd/Dark_Side_of_the_Moon.jpg', album: _getAlbumPorNome(albumManager, 'The Dark Side of the Moon')));
//   albumManager.adicionarMusica(Musica(nome: 'On the Run', ano: 1973, genero: 'Rock', artista: 'Pink Floyd', imageUrl: 'assets/albuns/PinkFloyd/Dark_Side_of_the_Moon.jpg', album: _getAlbumPorNome(albumManager, 'The Dark Side of the Moon')));
//   albumManager.adicionarMusica(Musica(nome: 'Time', ano: 1973, genero: 'Rock', artista: 'Pink Floyd', imageUrl: 'assets/albuns/PinkFloyd/Dark_Side_of_the_Moon.jpg', album: _getAlbumPorNome(albumManager, 'The Dark Side of the Moon')));
//   albumManager.adicionarMusica(Musica(nome: 'Money', ano: 1973, genero: 'Rock', artista: 'Pink Floyd', imageUrl: 'assets/albuns/PinkFloyd/Dark_Side_of_the_Moon.jpg', album: _getAlbumPorNome(albumManager, 'The Dark Side of the Moon')));
// }

// Album? _getAlbumPorNome(AlbumMusicsManager albumManager, String nomeAlbum) {
//   return albumManager.albums.firstWhere((album) => album.nome == nomeAlbum);
// }


