
import 'package:flutter/material.dart';
import 'package:soundhub/views/admin/add_album_page.dart';
import 'package:soundhub/views/profile/profile_page.dart';
import 'package:soundhub/views/search/search_page.dart';

class CustomDrawer extends StatelessWidget{
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context)
  {
    return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              child: Text(
                'Soundhub',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text('Menu Inicial'),
              onTap: () {
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
            ),
            ListTile(
              title: const Text('Pesquisar'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SearchPage()),
                );
              },
            ),
            ListTile(
              title: const Text('Perfil'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfilePage()),
                );
              },
            ),
            ListTile(
              title: const Text('Add album'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AddAlbumPage()),
                );
              },
            ),
            ListTile(
              title: const Text('Sair'),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Sair do Programa'),
                      content: const Text('Você realmente deseja sair do programa?'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            // Aqui você poderia adicionar lógica adicional para "sair" do seu aplicativo, se necessário
                            Navigator.of(context).pop();  // Fecha o AlertDialog
                          },
                          child: const Text('Sim'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();  // Apenas fecha o AlertDialog sem mais ações
                          },
                          child: const Text('Não'),
                        ),
                      ],
                    );
                  },
                );
              },
            ),

          ],
        ),
      );
  }
}

