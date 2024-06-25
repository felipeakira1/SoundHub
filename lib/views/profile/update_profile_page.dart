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
  final TextEditingController _usernameController = TextEditingController();

  @override
  void initState() {
    context.read<ProfileBloc>().add(LoadProfile());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ReturnAppBar(),
      body: BlocListener<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if(state is ProfileUpdated) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Profile updated successfully!')));
          } else if (state is ProfileUpdateError) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Text('Profile', style: TextStyle(fontSize: 24)),
              Expanded(
                child: _buildProfileForm(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileForm() {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        if (state is ProfileEmpty) {
          return const Center(
              child: Text('No profile data found.'));
        } else if (state is ProfileLoadError) {
          return Center(child: Text(state.message));
        } else if (state is ProfileLoaded) {
          _nameController.text = state.name;
          _usernameController.text = state.username;
          return _buildForm();
        } else if (state is ProfileUpdated) {
          _nameController.text = state.name;
          _usernameController.text = state.username;
          return _buildForm();
        } 
        else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 20,
            ),
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
            const SizedBox(height: 20),
            CustomTextFormField(
              controller: _usernameController,
              text: "Username",
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira seu e-mail';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            CustomElevatedButton(
              title: "UPDATE",
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  String name = _nameController.text.trim();
                  String username =
                      _usernameController.text.trim();
                  context.read<ProfileBloc>().add(
                      UpdateProfile(
                          name: name, username: username));
                }
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
    _usernameController.dispose();
    super.dispose();
  }
}
