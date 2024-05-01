import 'package:flutter/material.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({Key? key}) : super(key: key);

  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _senhaController = TextEditingController();
  final TextEditingController _confirmarSenhaController= TextEditingController();
  String _nome = '';
  String _email = '';
  String _nomeUsuario = '';
  String _senha = '';
  String _confirmarSenha = '';

  List<String> generosMusicais = ['Rock', 'Pop', 'Jazz', 'Hip-Hop', 'Classical', 'Electronic', 'Reggae'];
  Map<String, bool> generosSelecionados = {};

  @override
  void initState() {
    super.initState();
    // Inicializa todos os gêneros como não selecionados
    for (var genero in generosMusicais) {
      generosSelecionados[genero] = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SoundHub'),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Text(
                'Cadastre-se!',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Nome Completo',
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                  ),
                ),
                style: const TextStyle(color: Colors.white),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please, insert your full name';
                  }
                  return null;
                },
                onSaved: (value) => _nome = value!,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'E-mail',
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                  ),
                ),
                style: const TextStyle(color: Colors.white),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please, insert your email';
                  }
                  return null;
                },
                onSaved: (value) => _email = value!,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Nome de Usuário',
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                  ),
                ),
                style: const TextStyle(color: Colors.white),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please, insert your username';
                  }
                  return null;
                },
                onSaved: (value) => _nomeUsuario = value!,
              ),
              TextFormField(
                controller: _senhaController,
                decoration: const InputDecoration(
                  labelText: 'Senha',
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                  ),
                ),
                style: const TextStyle(color: Colors.white),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please, insert your password';
                  }
                  return null;
                },
                onSaved: (value) => _senha = _senhaController.text,
              ),

              TextFormField(
                controller: _confirmarSenhaController,
                decoration: const InputDecoration(
                  labelText: 'Confirmar Senha',
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                  ),
                ),
                style: const TextStyle(color: Colors.white),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please, confirm your password';
                  }
                  if (value != _senhaController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
                onSaved: (value) => _confirmarSenha = _confirmarSenhaController.text,
              ),
              const SizedBox(height: 20),
              
              const Text('Selecione seus gêneros musicais favoritos:', style: TextStyle(color: Colors.white)),
              ...generosMusicais.map((genero) => CheckboxListTile(
                title: Text(genero, style: TextStyle(color: Colors.white)),
                value: generosSelecionados[genero],
                onChanged: (bool? value) {
                  setState(() {
                    generosSelecionados[genero] = value!;
                  });
                },
                activeColor: Colors.blue,
                checkColor: Colors.white,
              )),
              ElevatedButton(
                onPressed: _submitForm,
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(const Color(0xffDB1675)),
                ),
                child: const Text(
                  'Cadastrar',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose()
  {
    _senhaController.dispose();
    _confirmarSenhaController.dispose();
    super.dispose();
  }
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      String generosEscolhidos = generosSelecionados.entries.where((entry) => entry.value).map((entry) => entry.key).join(', ');

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Formulário enviado'),
          content: Text(
            'Nome: $_nome\nEmail: $_email\nNome de Usuário: $_nomeUsuario\nSenha: $_senha\nConfirmar Senha: $_confirmarSenha\nGêneros: $generosEscolhidos',
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }
}
