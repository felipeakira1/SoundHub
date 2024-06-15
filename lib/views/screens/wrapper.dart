import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soundhub/bloc/user/login/authentication_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soundhub/views/screens/home_screen.dart';
import 'package:soundhub/views/screens/login_screen.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(builder: (context, state) {
      if(state is Authenticated) {
        // Adicionar providers.
        return HomePage();
      } else  {
        return LoginScreen();
      }
    });
  }
}