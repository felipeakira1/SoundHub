import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soundhub/authentication/bloc/authentication_bloc.dart';
import 'package:soundhub/authentication/bloc/authentication_state.dart';
import 'package:soundhub/views/screens/home_screen.dart';
import 'package:soundhub/login/view/login_page.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(builder: (context, state) {
      if(state is Authenticated) {
        // Adicionar providers.
        return HomePage();
      } else  {
        return LoginPage();
      }
    });
  }
}