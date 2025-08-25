// i made this as an alternative solution
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/core/widegts/todo_tile.dart';
import 'package:todoapp/features/addTasks/cubit/Add%20tasks&todos/todo_cubit.dart';
import 'package:todoapp/features/addTasks/cubit/Add%20tasks&todos/todo_status.dart';
import 'package:todoapp/features/addTasks/widgets/alert_dialog.dart';
import 'package:todoapp/features/addTasks/widgets/snackbar_custmized.dart';

class AddtaskScreen extends StatelessWidget {
  AddtaskScreen({super.key});
  final TextEditingController _ctrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodoCubit, States>(
      builder: (context, state) {
        final cubit = context.read<TodoCubit>();
        return Scaffold(
          backgroundColor: Colors.blue,
          appBar: AppBar(
            backgroundColor: Colors.red,
            title: Text(
              "Todo",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            centerTitle: true,
            elevation: 20,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Expanded(
                  child: (state is TodosLoadedState && state.todos.isNotEmpty)
                      ? ListView.builder(
                          itemCount: state.todos.length,
                          itemBuilder: (context, index) {
                            return TodoTile(
                              task: state.todos[index],

                              toggol: () {},
                            );
                          },
                        )
                      : Center(child: Text("No todos yet")),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.red,
            onPressed: () async => {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialogc(
                    ctrl: _ctrl,
                    addFun: () {
                      // cubit.updateTodo(TodoModel(
                      //     task: _ctrl.text,
                      //     id: DateTime.now()
                      //         .millisecondsSinceEpoch
                      //         .toString(),
                      //     isDone: false));
                      // _ctrl.clear();
                      // Navigator.pop(context);
                    },
                  );
                },
              ),
            },
            child: Icon(Icons.add, color: Colors.white),
          ),
        );
      },
      listener: (context, state) {
        if (state is TodosError) {
          SnackbarCustmized(
            message: state.error,
            color: Colors.red,
          ).showSnackBar(context);
        }
        if (state is UpdateTodo) {
          SnackbarCustmized(
            message: "Added Successfully ! ",
            color: Colors.green,
          ).showSnackBar(context);
        }
        if (state is DeleteTodo) {
          SnackbarCustmized(
            message: "Deleted Successfully ! ",
            color: Colors.green,
          ).showSnackBar(context);
        }
        if (state is ToggleTodo) {
          SnackbarCustmized(
            message: state.todo.isCompleted
                ? "Congrats you made it 🙌"
                : "Carry on.\n you can make it 🤞😉",
            color: state.todo.isCompleted ? Colors.green : Colors.red,
          ).showSnackBar(context);
        }
      },
    );
  }
}
