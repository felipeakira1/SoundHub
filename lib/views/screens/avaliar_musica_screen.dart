import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:soundhub/models/album.dart';
import 'package:soundhub/models/musica.dart';
import 'package:soundhub/views/widgets/app_bars.dart';

class TelaAvaliarMusica extends StatefulWidget {
  final Musica musica;
  const TelaAvaliarMusica({super.key, required this.musica});

  @override
  State<TelaAvaliarMusica> createState() => _TelaAvaliarMusicaState();
}

class _TelaAvaliarMusicaState extends State<TelaAvaliarMusica> {
  int _notaSelecionada = 0;
  TextEditingController _textEditingController = TextEditingController();

  Widget _buildBola(int index) {
    bool selecionada = index < _notaSelecionada;
    return GestureDetector(
      onTap: () {
        setState(() {
          _notaSelecionada = index + 1;
        });
      },
      child: Container(
        width: 30,
        height: 30,
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: selecionada ? Color(0xffDB1675) : Color(0xff333533),
        ),
      ),
    );
  }
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
                      image: AssetImage(widget.musica.imageUrl),
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
                          Text(widget.musica.nome, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),),
                          Text(widget.musica.artista, style: TextStyle(fontSize: 18, color: Colors.white),),
                          Text(widget.musica.ano.toString(), style: TextStyle(fontSize: 18, color: Colors.white),),
                          SizedBox(height: 20),
                          
                        ],
                      ),
                    ),
                    
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Nota: $_notaSelecionada / 10', style: TextStyle(fontSize: 18),),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(10, (index) => _buildBola(index)),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _textEditingController,
                  maxLines: null,
                  decoration: const InputDecoration(
                    hintText: 'Descrição',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () 
                        {
                          // verificar se usuario esta logado
                          _submitForm();
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color(0xffDB1675)), // Corrigido aqui
                        ),
                        child: const Text(
                          'Enviar',
                          style: TextStyle(color: Colors.white),
                        ),
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

  void _submitForm() {
    // if (_formKey.currentState!.validate()) {
    //   _formKey.currentState!.save();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
      backgroundColor: Color(0xff333533),
      title: const Text('Obrigado por contribuir!'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Você avaliou a musica', style: TextStyle(fontSize:  22, fontWeight: FontWeight.bold, color: Colors.white)),
          SizedBox(height: 20),
          Row(
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(widget.musica.imageUrl),
                    fit: BoxFit.cover,
                  ),
                  
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // Alinha o texto à esquerda
                  mainAxisAlignment: MainAxisAlignment.start, // Alinha os itens ao topo da Column
                
                  children: [
                    Text(widget.musica.nome, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),),
                    Text(widget.musica.artista, style: TextStyle(fontSize: 16, color: Colors.white),),
                    Text(widget.musica.ano.toString(), style: TextStyle(fontSize: 16, color: Colors.white),),
                    Text('Nota: $_notaSelecionada / 10', style: TextStyle(fontSize: 16, color: Colors.white),),
                    Text('Descrição: ${_textEditingController.text}', style: TextStyle(fontSize: 16, color: Colors.white),),
                    SizedBox(height: 20),
                    
                  ],
                ),
              ),
              
            ],
          ),
        ],
      ),
      actions: <Widget>[
        Row(
          children: [
            Expanded(
              child: TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('VOLTAR'),
              ),
            ),
          ],
        )
    ]));
    }
  // }
}