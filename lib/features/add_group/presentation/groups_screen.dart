import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/core/style_manegares/colors.dart';
import 'package:todoapp/core/style_manegares/text_style.dart';
import 'package:todoapp/features/add_group/cubit/group_cubit.dart';
import 'package:todoapp/features/add_group/cubit/group_status.dart';
import 'package:todoapp/features/add_group/widgets/group_tile.dart';

class GroupesScreen extends StatelessWidget {
  const GroupesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<GroupCubit, GroupStatus>(
        builder: (context, state) {
          return Container(
            decoration: BoxDecoration(gradient: Appcolors.background),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text("Groups", style: CustmizedTextStyle.headerText),
                    SizedBox(height: 15),
                    Flexible(
                      child: (state is LoadingGroups)
                          ? ListView.separated(
                              itemCount: state.groups.length,
                              itemBuilder: (context, index) {
                                return GroupTile(
                                  title: state.groups[index].groupeName,
                                  onTap: () {},
                                );
                              },
                              separatorBuilder: (context, index) =>
                                  SizedBox(height: 16),
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
