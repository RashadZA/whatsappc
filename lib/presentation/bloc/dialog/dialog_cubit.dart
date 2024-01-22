import 'package:flutter_bloc/flutter_bloc.dart';
part 'dialog_state.dart';

class DialogCubit extends Cubit<DialogState> {
  DialogCubit() : super(DialogInitialState());

  void show() => emit(DialogVisibleState());

  void hide() => emit(DialogHiddenState());
}