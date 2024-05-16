import 'package:flutter_bloc/flutter_bloc.dart';
import '../provider/data_provider.dart';
import '../models/usuario.dart';

// Classe base abstrata para os eventos de Usuario
abstract class UsuarioEvent {}

// Evento para buscar usuários
class FetchUsuarios extends UsuarioEvent {}

class RegisterUsuario extends UsuarioEvent {
  final Usuario usuario;

  RegisterUsuario(this.usuario);
}

class UsuarioState {
  List<Usuario> usuarios;
  bool loading;
  String? error;

  UsuarioState({this.usuarios = const [], this.loading = false, this.error});
}

class UsuarioBloc extends Bloc<UsuarioEvent, UsuarioState> {
  final DataProvider dataProvider = DataProvider();

  UsuarioBloc() : super(UsuarioState(usuarios: [], loading: false)) {
    on<FetchUsuarios>((event, emit) async {
      emit(UsuarioState(loading: true));
        try {
          List<Usuario> users = await dataProvider.fetchAllUsuarios();
          emit(UsuarioState(usuarios: users, loading: false));
        } catch (e) {
          emit(UsuarioState(loading: false));
          print('Error fetching users: $e');
        }
    });
    on<RegisterUsuario>((event, emit) async {
      emit(UsuarioState(loading: true, usuarios: state.usuarios));
      try {
        await dataProvider.registerUsuario(event.usuario);
        add(FetchUsuarios()); // Fetch users after registering a new one
      } catch (e) {
        emit(UsuarioState(loading: false, usuarios: state.usuarios, error: 'Error registering user: $e'));
      }
    });

    
          
  }
}
