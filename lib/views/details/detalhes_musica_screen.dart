import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:soundhub/models/musica.dart';
import 'package:soundhub/views/rate/avaliar_musica_screen.dart';
import 'package:soundhub/widgets/app_bars.dart';

class TelaDetalhesMusica extends StatelessWidget {
  final Musica musica;
  const TelaDetalhesMusica({super.key, required this.musica});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ReturnAppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8, // 80% da largura da tela
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: MediaQuery.of(context).size.width * 0.6,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(musica.imageUrl),
                      fit: BoxFit.cover,
                    ),
                    
                    borderRadius: BorderRadius.circular(10.0),
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
                          Text(musica.nome, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),),
                          Text(musica.artista, style: TextStyle(fontSize: 18, color: Colors.white),),
                          Text(musica.ano.toString(), style: TextStyle(fontSize: 18, color: Colors.white),),
                          SizedBox(height: 20),
                          
                        ],
                      ),
                    ),
                    ElevatedButton.icon(
                          icon: Icon(Icons.thumb_up, color: Colors.white),
                          label: Text('Avaliar', style: TextStyle(fontSize: 18, color: Colors.white),),
                          onPressed: () {
                            Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TelaAvaliarMusica(musica: musica)),
                            );
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color(0xffDB1675)), // Corrigido aqui
                          ),
                        ),
                  ],
                ),
                
              ],
            ),
          ),
        ),
      )
    );
  }
}