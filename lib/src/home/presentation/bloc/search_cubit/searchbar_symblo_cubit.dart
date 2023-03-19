import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBarSymbolCubit extends Cubit<bool> {
  bool isOpened = false;

  SearchBarSymbolCubit(super.isOpened);

  void changeState({bool? state}) {
    if (state != null) {
      isOpened = state;
      emit(isOpened);
    } else {
      if (!isOpened) {
        isOpened = true;
        emit(isOpened);
      } else {
        isOpened = false;
        emit(isOpened);
      }
    }
  }
}
