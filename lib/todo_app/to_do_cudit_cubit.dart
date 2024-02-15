import 'dart:developer';

import 'package:bloc_demo/todo_app/to_do_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ToDoCubit extends Cubit<List<ToDoModel>> {
  ToDoCubit() : super([]);

  void addToDo(String title, desc) {
    if (title.isEmpty) {
      addError('Title Not Add Empty');
      return;
    }
    final todo = ToDoModel(title: title, desc: desc, creteAt: DateTime.now());
    // state.add(todo);
    // emit([...state]);
    emit([...state, todo]);
  }

  @override
  void onChange(Change<List<ToDoModel>> change) {
    // TODO: implement onChange
    super.onChange(change);
    log(change.toString());
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    // TODO: implement onError
    super.onError(error, stackTrace);
    log(error.toString());
  }
}
