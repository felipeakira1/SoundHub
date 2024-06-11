import 'package:flutter_bloc/flutter_bloc.dart';
import '../data_providers/user_provider.dart';
import '../models/usuario.dart';

/*
  Eventos
*/
abstract class UsuarioEvent {}

// Evento para buscar usuários
class FetchUsuarios extends UsuarioEvent {}

class RegisterUsuario extends UsuarioEvent {
  final Usuario usuario;

  RegisterUsuario({required this.usuario});
}

class DeleteUsuario extends UsuarioEvent {
  final String? id;

  DeleteUsuario({required this.id});
}

/*
  Estados
*/
abstract class UsuarioState {}

class UsuarioLoading extends UsuarioState {}

class UsuarioError extends UsuarioState {
  final String message;
  UsuarioError({required this.message});
}

class InsertState extends UsuarioState {
  final Usuario usuario;
  InsertState({required this.usuario});
}

class ListState extends UsuarioState {
  final List<Usuario> usuarios;
  ListState({required this.usuarios});
}

class UsuariosEmpty extends UsuarioState {}

class UsuarioBloc extends Bloc<UsuarioEvent, UsuarioState> {
  final UserProvider dataProvider = UserProvider();

  UsuarioBloc() : super(UsuarioLoading()) {
    on<FetchUsuarios>(_onFetchUsuarios);
    on<RegisterUsuario>(_onRegisterUsuario);
    on<DeleteUsuario>(_onDeleteUsuario);
  }

  Future<void> _onFetchUsuarios(event, emit) async {
    emit(UsuarioLoading());
    try {
      List<Usuario> users = await dataProvider.getAllUsuarios();
      if(users.isEmpty) {
        emit(UsuariosEmpty());
      } else {
        emit(ListState(usuarios: users));
      }
    } catch (e) {
      emit(UsuarioError(message: 'Error fetching users: $e'));
    }
  }

  Future<void> _onRegisterUsuario(event, emit) async {
    emit(UsuarioLoading());
    try {
      Usuario newUser = await dataProvider.registerUsuario(event.usuario);
      emit(InsertState(usuario: newUser));  // Emite um estado de inserção após o registro bem-sucedido
      add(FetchUsuarios());  // Atualiza a lista após a inserção
    } catch (e) {
      emit(UsuarioError(message: 'Error registering user: $e'));
    }
  }

  Future<void> _onDeleteUsuario(event, emit) async {
    emit(UsuarioLoading());
    try {
      await dataProvider.deleteUsuario(event.id);
      add(FetchUsuarios());
    } catch (e) {
      emit(UsuarioError(message: 'Error deleting user: $e'));
    }
  }
}
