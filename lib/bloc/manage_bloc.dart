// class ManageBloc extends Bloc<ManageEvent, ManageState> {
//   ManageBloc() : super(InsertState(noteList: [])) {
//     on<SubmitEvent>((event, emit) {
//       // pode ser ou update ou insert state
//       if(state is UpdateState) {
//         RestProvider.helper.updateNote(
//           (state as UpdateState).noteId,
//           event.note,
//         );
//       } else {
        
//       }
//       RestProvider.helper.insertNote(event.note);
//     });

//     on<DeleteEvent>((event, emit) {
//       RestProvider.helper.deleteNote(event.noteId);
//     });

//     on<GetNoteListEvent>((event, emit) async {
//       List<Note> noteList = await RestProvider.helper.getNoteList();
//       if(state is UpdateState) {
//         emit(UpdateState(noteId: (state as UpdateState).noteId, noteList: noteList));
//       } else {
//         emit(InsertState(noteList: noteList));
//       }
//     });

//     on<UpdateRequest>((event, emit) {
//       emit(UpdateState(
//         noteId: noteId,
//         noteList: state.noteList,
//       ))
    
//     on<UpdateCancel>((event, emit) {
//       emit(InsertState(
//         noteList: state.noteList,
//       ))
//     })
//     })
//     }
//   }

//   /*
//   Eventos
//   */
//   abstract class ManageEvent {}

//   class SubmitEvent extends ManageEvent {
//   Note note;
//   SubmitEvent({required this.note});
// }

// class DeleteEvent extends ManageEvent {
// String noteId;
// DeleteEvent({required this.noteId});
// }

// class GetNoteListEvent extends ManageEvent {}

// class UpdateRequest extends ManageEvent {}
// /*
// Estados
// */
// abstract class ManageState {
//   List<Note> noteList;

//   ManageList({required this.noteList});
// }

// class InsertState extends ManageState {
//   InsertState({required super.noteList});
// }

// class UpdateState extends ManageState {
//   String noteId;
//   UpdateState({
//     required this.noteId,
//     required super.noteList,
//   });
// }