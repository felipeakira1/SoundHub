import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soundhub/bloc/authentication/authentication_bloc.dart';
import 'package:soundhub/bloc/authentication/authentication_state.dart';
import 'package:soundhub/views/home/indexed_page.dart';
import 'package:soundhub/views/login/login_page.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(builder: (context, state) {
      if(state is Authenticated) {
        return IndexedPage();
      } else  {
        return LoginPage();
      }
    });
  }
}