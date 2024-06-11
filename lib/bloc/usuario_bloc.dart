// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../data_providers/user_provider.dart';
// import '../models/user.dart';

// /*
//   Eventos
// */


// /*
//   Estados
// */
// abstract class UsuarioState {}

// class UsuarioLoading extends UsuarioState {}

// class UsuarioError extends UsuarioState {
//   final String message;
//   UsuarioError({required this.message});
// }

// class InsertState extends UsuarioState {
//   final User usuario;
//   InsertState({required this.usuario});
// }

// class ListState extends UsuarioState {
//   final List<User> usuarios;
//   ListState({required this.usuarios});
// }

// class UsuariosEmpty extends UsuarioState {}

// class UsuarioBloc extends Bloc<UsuarioEvent, UsuarioState> {
//   final UserProvider dataProvider = UserProvider();

//   UsuarioBloc() : super(UsuarioLoading()) {
//     on<FetchUsuarios>(_onFetchUsuarios);
//     on<RegisterUsuario>(_onRegisterUsuario);
//     on<DeleteUsuario>(_onDeleteUsuario);
//   }

//   Future<void> _onFetchUsuarios(event, emit) async {
//     emit(UsuarioLoading());
//     try {
//       List<User> users = await dataProvider.getAllUsers();
//       if(users.isEmpty) {
//         emit(UsuariosEmpty());
//       } else {
//         emit(ListState(usuarios: users));
//       }
//     } catch (e) {
//       emit(UsuarioError(message: 'Error fetching users: $e'));
//     }
//   }

//   Future<void> _onRegisterUsuario(event, emit) async {
//     emit(UsuarioLoading());
//     try {
//       User newUser = await dataProvider.registerUsuario(event.usuario);
//       emit(InsertState(usuario: newUser));  // Emite um estado de inserção após o registro bem-sucedido
//       add(FetchUsuarios());  // Atualiza a lista após a inserção
//     } catch (e) {
//       emit(UsuarioError(message: 'Error registering user: $e'));
//     }
//   }

//   Future<void> _onDeleteUsuario(event, emit) async {
//     emit(UsuarioLoading());
//     try {
//       await dataProvider.deleteUsuario(event.id);
//       add(FetchUsuarios());
//     } catch (e) {
//       emit(UsuarioError(message: 'Error deleting user: $e'));
//     }
//   }
// }
