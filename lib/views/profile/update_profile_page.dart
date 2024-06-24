import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soundhub/bloc/profile/profile_bloc.dart';
import 'package:soundhub/bloc/profile/profile_event.dart';
import 'package:soundhub/bloc/profile/profile_state.dart';
import 'package:soundhub/widgets/app_bars.dart';
import 'package:soundhub/widgets/custom_elevated_button.dart';
import 'package:soundhub/widgets/custom_text_form_field.dart';

class UpdateProfilePage extends StatefulWidget {
  const UpdateProfilePage({super.key});

  @override
  State<UpdateProfilePage> createState() => _UpdateProfilePageState();
}

class _UpdateProfilePageState extends State<UpdateProfilePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<ProfileBloc>().add(ProfileLoad());
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReturnAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
            children: [
              const Text('Profile', style: TextStyle(fontSize: 24),),
              Expanded(
                child: BlocBuilder<ProfileBloc, ProfileState>(
                  builder: (context, state) {
                    if (state is ProfileEmpty) {
                      return const Center(child: Text('Nenhum álbum encontrado.'));
                    } else if (state is ProfileError) {
                      return Center(child: Text(state.message));
                    } else if (state is ProfileLoaded) {
                      _nameController.text = state.user.fullName;
                      _emailController.text = state.user.email;
                      return Form(
                        key: _formKey,
                        child: ListView(
                          children: [
                            CustomTextFormField(
                              controller: _nameController,
                              text: "Name",
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Por favor, insira seu nome';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 20,
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
                            BlocBuilder<ProfileBloc, ProfileState>(
                              builder: (context, state) {
                                if(state is ProfileUpdating) {
                                  return const CircularProgressIndicator();
                                }
                                if(state is ProfileError) {
                                  return Center(
                                    child: Text(state.message),
                                  );
                                }
                                return CustomElevatedButton(
                                    title: "UPDATE",
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        String name = _nameController.text.trim();
                                        String email = _emailController.text.trim();
                                        context.read<ProfileBloc>().add(ProfileUpdate(name: name, email: email));
                                      }
                                    });
                              },
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
          ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }
}