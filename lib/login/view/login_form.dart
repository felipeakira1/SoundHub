import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soundhub/authentication/bloc/authentication_bloc.dart';
import 'package:soundhub/authentication/bloc/authentication_state.dart';
import 'package:soundhub/login/bloc/login_bloc.dart';
import 'package:soundhub/login/bloc/login_event.dart';
import 'package:soundhub/login/bloc/login_state.dart';
import 'package:soundhub/views/components/custom_elevated_button.dart';
import 'package:soundhub/views/components/custom_text_form_field.dart';
import 'package:soundhub/views/screens/cadastro_screen.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is Authenticated) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Login Successful!')),
          );
          // Navegar para a página principal ou outra página relevante
        } else if (state is AuthenticationError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Login Failed')),
          );
        }
      },
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Faça seu login',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            CustomTextFormField(
              controller: _emailController,
              text: "E-mail",
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira seu e-mail';
                }
                if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                  return 'Por favor, insira um e-mail válido';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextFormField(
              controller: _passwordController,
              text: "Password",
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira sua senha';
                }
                if (value.length < 6) {
                  return 'A senha deve ter pelo menos 6 caracteres';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                if(state is LoginLoading) {
                  return const CircularProgressIndicator();
                }
                return CustomElevatedButton(
                    title: "LOGIN",
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        String email = _emailController.text.trim();
                        String password = _passwordController.text.trim();
                        context.read<LoginBloc>().add(
                            LoginSubmitted(email: email, password: password));
                      }
                    });
              },
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CadastroPage()),
                );
              },
              child: Text(
                'Não possui uma conta? Cadastre-se!',
                style: TextStyle(
                  color: Colors.white,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
