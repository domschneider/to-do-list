import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:todo_list/views/add_todo_view.dart';
import 'package:todo_list/views/header_view.dart';
import 'package:todo_list/views/todo_list_view.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          bottom: false,
          child: Column(
            children: [
              // Header View
              Expanded(flex: 1, child: HeaderView()),

              // Task Info View
              //Expanded(flex: 1, child: TodoInfoView()),

              // Task List View
              Expanded(flex: 7, child: TodoListView()),
            ],
          ),
        ),
        floatingActionButton: const AddTodoView());
  }
}
