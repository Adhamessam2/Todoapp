import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/core/style_manegares/colors.dart';
import 'package:todoapp/features/add_group/cubit/group_cubit.dart';
import 'package:todoapp/features/add_group/presentation/add_group_screen.dart';
import 'package:todoapp/features/settings/widgets/option_widget.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Appcolors.navyblue,
      ),
      body: Container(
        decoration: BoxDecoration(gradient: Appcolors.background),
        child: Column(
          children: [
            OptionsWidget(icon: Icons.person, title: "Profile", onTap: () {}),
            OptionsWidget(
              icon: Icons.group,
              title: "Groups",
              onTap: () {
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
            ),
          ],
        ),
      ),
    );
  }
}
