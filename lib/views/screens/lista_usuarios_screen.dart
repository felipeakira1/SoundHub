import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soundhub/models/usuario.dart';
import 'package:soundhub/views/widgets/app_bars.dart';
import '../../bloc/usuario_bloc.dart';

class TelaListaUsuarios extends StatelessWidget {

  void _deleteUser(BuildContext context, String? id) {
    final usuarioBloc = BlocProvider.of<UsuarioBloc>(context);
    usuarioBloc.add(DeleteUsuario(id: id));
  }

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UsuarioBloc>(context);
    userBloc.add(FetchUsuarios());
    
    return Scaffold(
      appBar: ReturnAppBar(),
      body: BlocBuilder<UsuarioBloc, UsuarioState>(
        builder: (context, state) {
          if (state is UsuarioLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is UsuariosEmpty) {
            return Center(child: Text("Não há usuários cadastrados"));
          } else if (state is UsuarioError) {
            return Center(child: Text('${state.message}'));
          } else if (state is ListState) {
            return ListView.builder(
              itemCount: state.usuarios.length,
              itemBuilder: (context, index) {
                final user = state.usuarios[index];
                return ListTile(
                  title: Text(user.nomeCompleto),
                  subtitle: Text(user.email),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => _deleteUser(context, user.id),
                  ),
                  onTap: () => _showUserDetails(context, user),
                );
              },
            );
          } else {
            return Center(child: Text('Nenhum usuário encontrado.'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => BlocProvider.of<UsuarioBloc>(context).add(FetchUsuarios()),
        child: const Icon(Icons.refresh),
      ),
    );
  }

  void _showUserDetails(BuildContext context, Usuario user) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Detalhes do Usuário", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Text("ID: ${user.id}"),
              Text("Nome Completo: ${user.nomeCompleto}"),
              Text("Email: ${user.email}"),
              Text("Nome de Usuário: ${user.nomeUsuario}"),
              Text("Senha: ${user.senha}"),  // Consider security implications of displaying passwords
              Text("Gêneros Favoritos: ${user.generosFavoritos.join(', ')}"),
            ],
          ),
        );
      },
    );
  }
}
