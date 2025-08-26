// i made this as an alternative solution
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/core/models/todo_model.dart';
import 'package:todoapp/core/style_manegares/colors.dart';
import 'package:todoapp/core/widgets/button.dart';
import 'package:todoapp/core/widgets/custmized_text_field.dart';
import 'package:todoapp/features/addTasks/cubit/Add%20tasks&todos/todo_cubit.dart';
import 'package:todoapp/features/addTasks/cubit/Add%20tasks&todos/todo_status.dart';

class AddtaskScreen extends StatelessWidget {
  AddtaskScreen({super.key});
  final TextEditingController _titleCtrl = TextEditingController();
  final TextEditingController _desCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return BlocConsumer<TodoCubit, States>(
      builder: (context, state) {
        final cubit = context.read<TodoCubit>();
        return Container(
          decoration: BoxDecoration(gradient: Appcolors.background),
          child: Padding(
            padding: EdgeInsets.all(width * 0.07),
            child: Column(
              spacing: height * 0.02,
              children: [
                SizedBox(height: height * 0.03),
                Text(
                  "Adding new Task",
                  style: TextStyle(fontSize: 32, color: Colors.white),
                ),
                CustmizedTextField(ctrl: _titleCtrl, lable: "Task Title"),
                SizedBox(height: 5),
                CustmizedTextField(ctrl: _desCtrl, lable: "Taks Description"),
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
                  lable: 'add task',
                  size: 'big',
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
        );
      },
      listener: (context, state) {},
    );
  }
}
