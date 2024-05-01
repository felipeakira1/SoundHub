import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:soundhub/models/album.dart';
import 'package:soundhub/views/widgets/app_bars.dart';

class AlbumDetailsScreen extends StatelessWidget {
  final Album album;
  const AlbumDetailsScreen({super.key, required this.album});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ReturnAppBar(),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8, // 80% da largura da tela
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(album.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Envolve a Column em um Expanded para que ela ocupe todo o espaço necessário
                  // exceto o espaço que o botão irá ocupar.
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start, // Alinha o texto à esquerda
                      mainAxisAlignment: MainAxisAlignment.start, // Alinha os itens ao topo da Column
        
                      children: [
                        Text(album.nome, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),),
                        Text(album.artista, style: TextStyle(fontSize: 18, color: Colors.white),),
                        Text(album.ano.toString(), style: TextStyle(fontSize: 18, color: Colors.white),),
                        SizedBox(height: 20),
                        
                      ],
                    ),
                  ),
                  ElevatedButton.icon(
                        icon: Icon(Icons.thumb_up, color: Colors.white),
                        label: Text('Avaliar', style: TextStyle(fontSize: 18, color: Colors.white),),
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color(0xffDB1675)), // Corrigido aqui
                        ),
                      ),
                ],
              ),
              Container(
                  height: 250,
                  decoration: const BoxDecoration(
                    color: Color(0xff333533)
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ListView.builder(
                      itemCount: album.musicas.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                        title: Text(album.musicas[index].nome),
                        subtitle: Text(album.musicas[index].artista),
                        // Adicione aqui a navegação para a tela de detalhes do álbum ao ser clicado
                        onTap: () {
                          // Adicione a navegação para a tela de detalhes do álbum aqui
                        },
                      );
                      }
                  )
              ),
            ],
          ),
        ),
      )
    );
  }
}