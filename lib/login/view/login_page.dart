import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soundhub/authentication/bloc/authentication_bloc.dart';
import 'package:soundhub/login/bloc/login_bloc.dart';
import 'login_form.dart'; // Importe a classe LoginForm

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SoundHub'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => LoginBloc(),
            ),
            BlocProvider(
              create: (context) => AuthenticationBloc(),
            ),
          ],
          child: const LoginForm(),
        ),
      ),
    );
  }
}
