import 'package:flutter/material.dart';

import '../models/todo_model.dart';
import '../models/user_model.dart';

class AppViewModel extends ChangeNotifier {
  List<Todo> todos = <Todo>[];
  User user = User("Jon Snow");

  Color clrLvl1 = Colors.grey.shade50;
  Color clrLvl2 = Colors.grey.shade200;
  Color clrLvl3 = Colors.grey.shade800;
  Color clrLvl4 = Colors.grey.shade900;

  int get numTodos => todos.length;

  int get numTodosRemaining => todos.where((task) => !task.complete).length;

  String get username => user.username;

  void addTask(Todo newTodo) {
    todos.add(newTodo);
    notifyListeners();
  }

  bool getTodoValue(int todoIndex) {
    return todos[todoIndex].complete;
  }

  String getTodoTitle(int todoIndex) {
    return todos[todoIndex].title;
  }

  void deleteTodo(int todoIndex) {
    todos.removeAt(todoIndex);
    notifyListeners();
  }

  void setTodoValue(int todoIndex, bool todoValue) {
    todos[todoIndex].complete = todoValue;
    notifyListeners();
  }

  void updateUsername(String newUsername) {
    user.username = newUsername;
    notifyListeners();
  }

  void deleteAllTodo() {
    todos.clear();
    notifyListeners();
  }

  void deleteCompletedTodos() {
    todos = todos.where((todo) => !todo.complete).toList();
    notifyListeners();
  }

  void bottomSheetBuilder(Widget bottomSheetView, BuildContext context) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        context: context,
        builder: ((context) {
          return bottomSheetView;
        }));
  }
}
