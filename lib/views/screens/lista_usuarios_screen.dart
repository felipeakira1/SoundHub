import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soundhub/bloc/user/user_management/user_management_bloc.dart';
import 'package:soundhub/bloc/user/user_management/user_management_event.dart';
import 'package:soundhub/bloc/user/user_management/user_management_state.dart';
import 'package:soundhub/models/user.dart';
import 'package:soundhub/views/widgets/app_bars.dart';

class TelaListaUsuarios extends StatelessWidget {
  void _deleteUser(BuildContext context, String? id) {
    final userManagementBloc = BlocProvider.of<UserManagementBloc>(context);
    userManagementBloc.add(DeleteUser(id: id));
  }

  @override
  Widget build(BuildContext context) {
    final userManagementBloc = BlocProvider.of<UserManagementBloc>(context);

    // Lança evento para carregar todos os usuários
    userManagementBloc.add(FetchAllUsers());
    
    return Scaffold(
      appBar: const ReturnAppBar(),
      body: BlocBuilder<UserManagementBloc, UserState>(
        builder: (context, state) {
          if (state is UsersLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is UsersEmpty) {
            return const Center(child: Text("Não há usuários cadastrados"));
          } else if (state is UsersError) {
            return Center(child: Text('${state.message}'));
          } else if (state is UsersLoaded) {
            return ListView.builder(
              itemCount: state.users.length,
              itemBuilder: (context, index) {
                final user = state.users[index];
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
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => BlocProvider.of<UsuarioBloc>(context).add(FetchUsuarios()),
      //   child: const Icon(Icons.refresh),
      // ),
    );
  }

  void _showUserDetails(BuildContext context, User user) {
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
