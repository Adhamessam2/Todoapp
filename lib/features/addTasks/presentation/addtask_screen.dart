// i made this as an alternative solution
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/core/models/todo_model.dart';
import 'package:todoapp/core/models/user_model.dart';
import 'package:todoapp/core/style_manegares/colors.dart';
import 'package:todoapp/core/widegts/todo_tile.dart';
import 'package:todoapp/features/addTasks/cubit/Add%20tasks&todos/todo_cubit.dart';
import 'package:todoapp/features/addTasks/cubit/Add%20tasks&todos/todo_status.dart';
import 'package:todoapp/features/addTasks/widgets/alert_dialog.dart';
import 'package:todoapp/features/addTasks/widgets/snackbar_custmized.dart';

class AddtaskScreen extends StatelessWidget {
  AddtaskScreen({super.key, required this.currentUser});
  final TextEditingController _titleCtrl = TextEditingController();
  final TextEditingController _desCtrl = TextEditingController();
  final UserModel currentUser;
  DateTime deadline = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodoCubit, States>(
      builder: (context, state) {
        final cubit = context.read<TodoCubit>();
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Appcolors.navyblue,
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
          body: Container(
            decoration: BoxDecoration(gradient: Appcolors.background),
            child: Padding(
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
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Appcolors.navyblue,
            onPressed: () async => {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialogc(
                    desCtrl: _desCtrl,
                    titleCtrl: _titleCtrl,
                    deadline: deadline,
                    addFun: () {
                      print(deadline);
                      cubit.updateTodo(
                        TodoModel(
                          id: '${currentUser.id}${DateTime.now().millisecond}',
                          title: _titleCtrl.text,
                          description: _desCtrl.text,
                          deadline: deadline,
                        ),
                        currentUser.myTodosId,
                      );
                      _titleCtrl.clear();
                      Navigator.pop(context);
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
