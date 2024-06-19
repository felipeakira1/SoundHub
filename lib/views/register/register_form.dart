import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soundhub/bloc/login/login_bloc.dart';
import 'package:soundhub/bloc/login/login_state.dart';
import 'package:soundhub/bloc/register/register_bloc.dart';
import 'package:soundhub/bloc/register/register_event.dart';
import 'package:soundhub/bloc/register/register_state.dart';
import 'package:soundhub/widgets/custom_elevated_button.dart';
import 'package:soundhub/widgets/custom_text_form_field.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const Text(
              'Faça seu login',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            CustomTextFormField(
              controller: _nameController,
              text: "Name",
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please, insert your name';
                }
                return null;
              },
            ),
            const SizedBox(height: 20,),
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
            const SizedBox(height: 20,),
            CustomTextFormField(
              controller: _usernameController,
              text: "Username",
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira seu username';
                }
                return null;
              },
            ),
            const SizedBox(height: 20,),
            CustomTextFormField(
              controller: _passwordController,
              text: "Password",
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira sua senha';
                }
                return null;
              },
            ),
            CustomTextFormField(
              controller: _confirmPasswordController,
              text: "Password",
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira sua senha';
                }
                if(value != _passwordController.text) {
                  return 'As senhas não coincidem';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            BlocBuilder<RegisterBloc, RegisterState>(
              builder: (context, state) {
                if(state is RegisterLoading) {
                  return const CircularProgressIndicator();
                } else if (state is RegisterError) {
                  return Text('Registration Failed: ${state.message}');
                }
                return CustomElevatedButton(
                    title: "REGISTER",
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        
                        String name = _nameController.text.trim();
                        String email = _emailController.text.trim();
                        String password = _passwordController.text.trim();
                        String username = _usernameController.text.trim();
                        context.read<RegisterBloc>().add(RegisterSubmitted(name: name, email: email, password: password, username: username));
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('User registered successfully!')),
                        );
                        Navigator.of(context).pop();
                      }
                    });
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
}