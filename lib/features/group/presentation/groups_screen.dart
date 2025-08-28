import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/core/style_manegares/colors.dart';
import 'package:todoapp/core/style_manegares/commonstyle.dart';
import 'package:todoapp/features/group/cubit/group_cubit.dart';
import 'package:todoapp/features/group/cubit/group_status.dart';
import 'package:todoapp/features/group/group_tasks/cubit/group_task_cubit.dart';
import 'package:todoapp/features/group/group_tasks/task_screen/task_screen.dart';
import 'package:todoapp/features/group/presentation/add_group_screen.dart';
import 'package:todoapp/features/group/widgets/group_tile.dart';

class GroupesScreen extends StatelessWidget {
  const GroupesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Appcolors.navyblue,
        title: Text("Groups", style: Customstyle.mystyle),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BlocProvider(
                    create: (context) => GroupCubit(),
                    child: AddGroupScreen(),
                  ),
                ),
              );
            },
            child: Text("Add Group"),
          ),
        ],
      ),
      body: BlocConsumer<GroupCubit, GroupStatus>(
        builder: (context, state) {
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
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.all(width * 0.05),
                child: Column(
                  children: [
                    SizedBox(height: height * 0.02),
                    SizedBox(
                      width: width,
                      height: height * 0.7,
                      child: (state is LoadingGroups)
                          ? ListView.separated(
                              itemCount: state.groups.length,
                              itemBuilder: (context, index) {
                                return GroupTile(
                                  title: state.groups[index].groupeName,
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => BlocProvider(
                                          create: (context) => GroupTaskCubit()
                                            ..loadGroupTodos(
                                              state.groups[index],
                                            ),
                                          child: TaskScreen(
                                            groupModel: state.groups[index],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                              separatorBuilder: (context, index) =>
                                  SizedBox(height: height * 0.02),
                            )
                          : Text("no groups yet"),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}
