import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soundhub/bloc/user/user_management/user_management_event.dart';
import 'package:soundhub/bloc/user/user_management/user_management_state.dart';
import 'package:soundhub/data_providers/user_provider.dart';
import 'package:soundhub/models/user.dart';

class UserManagementBloc extends Bloc<UserEvent, UserState> {
  final UserProvider userProvider = UserProvider();

  UserManagementBloc() : super(UsersLoading()) {
    on<FetchAllUsers>((event, emit) async {
      emit(UsersLoading());
      try {
        List<User> users = await userProvider.getAllUsers();
        if(users.isEmpty) {
          emit(UsersEmpty());
        } else {
          emit(UsersLoaded(users: users));
        }
      } catch (e) {
        emit(UsersError(message: 'Error fetching users: $e'));
      }
    });
    UserProvider.instance.stream.listen((user) {
      add(FetchAllUsers());
    });
  }
  
}