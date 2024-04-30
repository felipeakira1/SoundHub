import 'package:flutter/material.dart';
import 'package:soundhub/views/app_bars.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ReturnAppBar(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Text(
                'Login',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                )
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'E-mail', 
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: UnderlineInputBorder(      
                    borderSide: BorderSide(color: Colors.white), // Cor da linha quando o campo está ativo
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2.0), // Cor da linha quando o campo está focado
                  ),
                ),
                style: const TextStyle(color: Colors.white),
                validator: (value) {
                  if(value == null || value.isEmpty) {
                    return 'Please, insert your email';
                  }
                  return null;
                },
                onSaved: (value) => _email = value!,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Password', 
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: UnderlineInputBorder(      
                    borderSide: BorderSide(color: Colors.white), // Cor da linha quando o campo está ativo
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2.0), // Cor da linha quando o campo está focado
                  ),
                ),
                style: const TextStyle(color: Colors.white),
                validator: (value) {
                  if(value == null || value.isEmpty) {
                    return 'Please, insert your password';
                  }
                  return null;
                },
                onSaved: (value) => _password = value!,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm, 
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(const Color(0xffDB1675)), // Corrigido aqui
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ]),
          )
        )
      );
  }

void _submitForm() {
  if(_formKey.currentState!.validate()) {
    _formKey.currentState!.save();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Formulario enviado'),
        content: Text('Email: $_email\nPassword: $_password'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          )
        ]
      )
    );
  }
}
}