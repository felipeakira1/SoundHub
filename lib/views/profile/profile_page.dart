import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soundhub/bloc/profile/profile_bloc.dart';
import 'package:soundhub/bloc/profile/profile_event.dart';
import 'package:soundhub/views/profile/update_profile_page.dart';
import 'package:soundhub/views/profile/album_reviews_page.dart';
import 'package:soundhub/widgets/custom_elevated_button.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  leading: const Icon(Icons.account_circle), // Ícone de informações de perfil
                  title: const Text('Profile informations'),
                  onTap: () {
                    // Navegar para UpdateProfilePage com BlocProvider
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const UpdateProfilePage(),
                    ));
                  }
                ),
                ListTile(
                  leading: const Icon(Icons.star), // Ícone de avaliações
                  title: const Text('Album reviews'),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AlbumReviewsPage()));
                  },
                )
              ],
              
            ),
          ),
          Row(
            children: [
              Expanded(child: CustomElevatedButton(
                title: 'SIGN OUT',
                onPressed: () {
                  context.read<ProfileBloc>().add(ProfileSignOut());
                },
              ))
            ],
          )
        ],
      )
    );
  }
}
