import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soundhub/bloc/usuario_bloc.dart';
import 'package:soundhub/models/user.dart';
import 'package:soundhub/views/widgets/app_bars.dart';
import 'package:soundhub/views/widgets/custom_text_form_field.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({Key? key}) : super(key: key);

  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _nomeUsuarioController = TextEditingController();
  final _senhaController = TextEditingController();
  final _confirmarSenhaController = TextEditingController();

  final List<String> generosMusicais = [
    'Rock',
    'Pop',
    'Jazz',
    'Hip-Hop',
    'Classical',
    'Electronic',
    'Reggae'
  ];

  final Map<String, bool> generosSelecionados = {
    'Rock': false,
    'Pop': false,
    'Jazz': false,
    'Hip-Hop': false,
    'Classical': false,
    'Electronic': false,
    'Reggae': false,
  };

  void _submitForm() {
    // if (_formKey.currentState!.validate()) {
    //   final List<String> generosEscolhidos = generosSelecionados.entries
    //       .where((entry) => entry.value)
    //       .map((entry) => entry.key)
    //       .toList();

    //   final usuario = User(
    //     nomeCompleto: _nomeController.text,
    //     email: _emailController.text,
    //     nomeUsuario: _nomeUsuarioController.text,
    //     senha: _senhaController.text,
    //     generosFavoritos: generosEscolhidos,
    //   );

    //   Provider.of<UserManagementBloc>(context, listen: false).add(RegisterUsuario(usuario: usuario));
    //   showDialog(
    //     context: context,
    //     builder: (BuildContext context) {
    //       return AlertDialog(
    //         title: Text('Cadastro realizado'),
    //         content: Text('Seu cadastro foi realizado com sucesso!'),
    //         actions: <Widget>[
    //           TextButton(
    //             onPressed: () {
    //               Navigator.pop(context); // Fechar o dialog
    //               Navigator.pop(context); // Navegar de volta
    //             },
    //             child: Text('OK'),
    //           ),
    //         ],
    //       );
    //     },
    //   );
    // }
  }

  @override
  void dispose() {
    _nomeController.dispose();
    _emailController.dispose();
    _nomeUsuarioController.dispose();
    _senhaController.dispose();
    _confirmarSenhaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReturnAppBar(),
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
              CustomTextFormField(
                labelText: 'Nome Completo',
                controller: _nomeController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira seu nome completo';
                  }
                  return null;
                },
              ),
              CustomTextFormField(
                labelText: 'E-mail',
                controller: _emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira seu email';
                  }
                  return null;
                },
              ),
              CustomTextFormField(
                labelText: 'Nome de Usuário',
                controller: _nomeUsuarioController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira seu nome de usuário';
                  }
                  return null;
                },
              ),
              CustomTextFormField(
                labelText: 'Senha',
                controller: _senhaController,
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira sua senha';
                  }
                  return null;
                },
              ),
              CustomTextFormField(
                labelText: 'Confirmar Senha',
                controller: _confirmarSenhaController,
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, confirme sua senha';
                  }
                  if (value != _senhaController.text) {
                    return 'As senhas não coincidem';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              const Text(
                'Selecione seus gêneros musicais favoritos:',
                style: TextStyle(color: Colors.white),
              ),
              ...generosMusicais.map((genero) => CheckboxListTile(
                    title: Text(genero, style: TextStyle(color: Colors.white)),
                    value: generosSelecionados[genero],
                    onChanged: (bool? value) {
                      if (value != null) {
                        setState(() {
                          generosSelecionados[genero] = value;
                        });
                      }
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
}
