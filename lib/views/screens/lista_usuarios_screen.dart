import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soundhub/views/widgets/app_bars.dart';
import '../../bloc/usuario_bloc.dart';

class TelaListaUsuarios extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UsuarioBloc>(context);
    userBloc.add(FetchUsuarios());

    return Scaffold(
      appBar: ReturnAppBar(),
      body: BlocBuilder<UsuarioBloc, UsuarioState>(
        builder: (context, state) {
          if (state.loading) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: state.usuarios.length,
            itemBuilder: (context, index) {
              final user = state.usuarios[index];
              return ListTile(
                title: Text(user.nomeCompleto),
                subtitle: Text(user.email),
              );
            },
          );
        },
      ),
    );
  }
}
