
import 'package:flutter/material.dart';
import 'package:soundhub/views/screens/searchScreen.dart';
import 'package:soundhub/views/screens/perfil_screen.dart';

class SoundHubDrawer extends StatelessWidget{
  SoundHubDrawer({super.key});

  @override
  Widget build(BuildContext context)
  {
    return Drawer(
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
            ListTile(
              title: Text('Perfil'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TelaPerfil()),
                );
              },
            ),
          ],
        ),
      );
  }
}

