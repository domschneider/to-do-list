import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/view_models/app_view_model.dart';

class TodoListView extends StatelessWidget {
  const TodoListView({super.key});

  TextStyle? _getTextStyle(bool checked) {
    if (!checked) return null;

    return const TextStyle(
      color: Colors.black,
      decoration: TextDecoration.lineThrough,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(builder: (context, viewModel, child) {
      return Container(
          decoration: BoxDecoration(
              color: viewModel.clrLvl2,
              borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
          child: ListView.separated(
            padding: EdgeInsets.all(15),
            separatorBuilder: (context, index) {
              return SizedBox(height: 15);
            },
            itemCount: viewModel.numTodos,
            itemBuilder: (context, index) {
              return Dismissible(
                  key: UniqueKey(),
                  onDismissed: (direction) {
                    HapticFeedback.mediumImpact();
                    viewModel.deleteTodo(index);
                  },
                  background: Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                        color: Colors.red.shade300,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                        child: Icon(Icons.delete, color: Colors.red.shade700)),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                        color: viewModel.clrLvl1,
                        borderRadius: BorderRadius.circular(20)),
                    child: ListTile(
                      leading: Checkbox(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        side: BorderSide(width: 2, color: viewModel.clrLvl3),
                        checkColor: viewModel.clrLvl1,
                        activeColor: viewModel.clrLvl3,
                        value: viewModel.getTodoValue(index),
                        onChanged: (value) {
                          viewModel.setTodoValue(index, value!);
                        },
                      ),
                      title: Text(viewModel.getTodoTitle(index),
                          style: _getTextStyle(viewModel.getTodoValue(index))),
                      // style: TextStyle(
                      //     color: viewModel.clrLvl4,
                      //     //decoration: TextDecoration.lineThrough,
                      //     fontSize: 17,
                      //     fontWeight: FontWeight.w500))),
                    ),
                  ));
            },
          ));
    });
  }
}
