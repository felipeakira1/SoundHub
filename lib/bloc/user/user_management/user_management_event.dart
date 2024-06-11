abstract class UserEvent {}

// Evento para buscar usuários
// Este evento não tem atributos porque ele simplesmente desencadeia a ação de buscar todos os usuários. 
//Não precisa de informações adicionais.
class FetchAllUsers extends UserEvent {}

// Evento para deletar um usuário
// Possui um atributo id para identificar qual usuario deve ser deletado.
class DeleteUser extends UserEvent {
  final String? id;

  DeleteUser({required this.id});
}