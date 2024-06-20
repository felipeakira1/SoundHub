import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soundhub/bloc/authentication/authentication_bloc.dart';
import 'package:soundhub/bloc/authentication/authentication_state.dart';
import 'package:soundhub/bloc/profile/profile_bloc.dart';
import 'package:soundhub/bloc/profile/profile_event.dart';
import 'package:soundhub/bloc/profile/profile_state.dart';
import 'package:soundhub/models/user.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    context.read<ProfileBloc>().add(ProfileLoad());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const Text('Profile', style: TextStyle(fontSize: 24),),
          Expanded(
            child: BlocBuilder<ProfileBloc, ProfileState>(
              builder: (context, state) {
                if (state is ProfileEmpty) {
                  return Center(child: Text('Nenhum álbum encontrado.'));
                } else if (state is ProfileError) {
                  return Center(child: Text(state.message));
                } else if (state is ProfileLoaded) {
                  return Form(
                    key: _formKey,
                    child: ListView(
                      children: [
                        TextFormField(
                          initialValue: state.user.fullName,
                        ),
                        TextFormField(
                          initialValue: state.user.email,
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                // Aqui você pode adicionar lógica para atualizar os dados no servidor
                                ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(content: Text('Salvando alterações...')));
                              }
                            },
                            child: Text('Salvar Alterações'),
                          ),
                      ],
                    ),
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      )
    );

  }
}