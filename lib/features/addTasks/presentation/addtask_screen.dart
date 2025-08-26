// i made this as an alternative solution
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/core/models/todo_model.dart';
import 'package:todoapp/features/addTasks/cubit/Add%20tasks&todos/todo_cubit.dart';
import 'package:todoapp/features/addTasks/cubit/Add%20tasks&todos/todo_status.dart';
import 'package:todoapp/features/addTasks/widgets/button.dart';
import 'package:todoapp/features/addTasks/widgets/custmized_todo_field.dart';

class AddtaskScreen extends StatelessWidget {
  AddtaskScreen({super.key});
  final TextEditingController _titleCtrl = TextEditingController();
  final TextEditingController _desCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return BlocConsumer<TodoCubit, States>(
      builder: (context, state) {
        final cubit = context.read<TodoCubit>();
        return AlertDialog(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          content: SizedBox(
            height: height,
            child: Column(
              children: [
                CustmizedTodoField(ctrl: _titleCtrl),
                SizedBox(height: 5),
                CustmizedTodoField(ctrl: _desCtrl),
                SizedBox(height: 15),
                SizedBox(
                  height: 300,
                  width: 300,
                  child: CalendarDatePicker(
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2010),
                    lastDate: DateTime(2030),
                    onDateChanged: (value) {
                      cubit.deadline = value;
                    },
                  ),
                ),
                Button(
                  addFun: () {
                    cubit.addTask(
                      TodoModel(
                        id: '${cubit.currentUser.id}${DateTime.now().millisecond}',
                        title: _titleCtrl.text,
                        description: _desCtrl.text,
                        deadline: cubit.deadline,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          title: Text("Add Task"),
        );
      },
      listener: (context, state) {},
    );
  }
}
