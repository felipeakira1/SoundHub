
import 'package:flutter/material.dart';
import 'package:soundhub/views/screens/perfil_screen.dart';
import 'package:soundhub/views/screens/pesquisa_screen.dart';

class SoundHubDrawer extends StatelessWidget{
  SoundHubDrawer({super.key});

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
                  MaterialPageRoute(builder: (context) => PesquisaTabBarNavigation()),
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
            ListTile(
              title: Text('Sair'),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Sair do Programa'),
                      content: Text('Você realmente deseja sair do programa?'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            // Aqui você poderia adicionar lógica adicional para "sair" do seu aplicativo, se necessário
                            Navigator.of(context).pop();  // Fecha o AlertDialog
                          },
                          child: Text('Sim'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();  // Apenas fecha o AlertDialog sem mais ações
                          },
                          child: Text('Não'),
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

