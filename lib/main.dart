import 'package:flutter/material.dart';
import 'package:soundhub/models/album_manager.dart';
import 'package:soundhub/models/album.dart';
import 'views/homeScreen.dart';

void main() {
  AlbumManager albumManager = AlbumManager();
  albumManager.add(Album(nome: '1989', ano: 2014, genero: 'Pop', autor: 'Taylor Swift', imageUrl: 'assets/albuns/TaylorSwift/1989.jpg'));
  albumManager.add(Album(nome: 'After Hours', ano: 2020, genero: 'Pop', autor: 'The Weeknd', imageUrl: 'assets/albuns/TheWeeknd/AfterHours.jpg'));
  albumManager.add(Album(nome: 'Divide', ano: 2017, genero: 'Pop', autor: 'Ed Sheeran', imageUrl: 'assets/albuns/EdSheeran/Divide.jpg'));
  albumManager.add(Album(nome: 'Doo-Wops & Hooligans', ano: 2010, genero: 'Pop', autor: 'Bruno Mars', imageUrl: 'assets/albuns/BrunoMars/DooWops_&_Hooligans.jpg'));
  albumManager.add(Album(nome: 'Nevermind', ano: 1991, genero: 'Rock', autor: 'Nirvana', imageUrl: 'assets/albuns/Nirvana/Nevermind.jpg'));
  albumManager.add(Album(nome: 'Abey Road', ano: 1991, genero: 'Rock', autor: 'Beatles', imageUrl: 'assets/albuns/Beatles/AbbeyRoad.jpg'));
  albumManager.add(Album(nome: 'The Dark Side of the Moon', ano: 1973, genero: 'Rock', autor: 'Pink Floyd', imageUrl: 'assets/albuns/PinkFloyd/Dark_Side_of_the_Moon.jpg'));
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