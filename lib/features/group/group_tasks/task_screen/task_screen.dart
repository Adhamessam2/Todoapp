import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/core/models/group_model.dart';
import 'package:todoapp/core/style_manegares/colors.dart';
import 'package:todoapp/core/style_manegares/commonstyle.dart';
import 'package:todoapp/core/widegts/todo_tile.dart';
import 'package:todoapp/features/group/addgroupTasks/cubit/Add%20tasks&todos/todo_cubit.dart';
import 'package:todoapp/features/group/addgroupTasks/presentation/add_task_screen.dart';
import 'package:todoapp/features/group/group_tasks/cubit/group_task_cubit.dart';
import 'package:todoapp/features/group/group_tasks/cubit/group_task_state.dart';
import 'package:todoapp/features/group/todo_details/cubit/todo_details_cubit.dart';
import 'package:todoapp/features/group/todo_details/todo_details_screen.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key, required this.groupModel});
  final GroupModel groupModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Appcolors.navyblue,
        title: Text(groupModel.groupeName, style: Customstyle.mystyle),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BlocProvider(
                    create: (context) => GroupAddTodoCubit(),
                    child: AddGroupTaskScreen(currentGroup: groupModel),
                  ),
                ),
              );
            },
            child: Text("add task"),
          ),
        ],
      ),
      body: BlocConsumer<GroupTaskCubit, GroupTaskState>(
        builder: (context, state) {
          // final cubit = context.read<GroupTaskCubit>();
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Appcolors.lightblue,
                  Appcolors.blue,
                  Appcolors.navyblue,
                ],
              ),
            ),
            child: (state is TodosLoadedState)
                ? ListView.builder(
                    itemCount: state.todos.length,
                    itemBuilder: (context, index) {
                      return TodoTile(
                        todo: state.todos[index],
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BlocProvider(
                                create: (context) => TodoDetailsCubit(),
                                child: TodoDetailsScreen(
                                  todoModel: state.todos[index],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  )
                : (state is TodosLoading)
                ? Center(
                    child: CircularProgressIndicator(
                      color: Appcolors.lightblue, // you can change the color
                      strokeWidth: 4, // thickness of the circle
                    ),
                  )
                : Text(""),
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}
