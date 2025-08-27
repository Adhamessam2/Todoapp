import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todoapp/core/style_manegares/colors.dart';
import 'package:todoapp/features/auth/cubit/logic.dart';
import 'package:todoapp/features/auth/cubit/states.dart';
import 'package:todoapp/features/settings/screens/profile_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Appcolors.blue, Appcolors.navyblue],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            SizedBox(height: 50.h),
            Center(
              child: Text(
                'Settings',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            SizedBox(height: 23.h),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 30,
                      ),
                      title: Text(
                        'Profile',
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      ),
                      trailing: Icon(
                        Icons.chevron_right,
                        color: Colors.white,
                        size: 30,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfileScreen(),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 10.h),
                    Divider(color: Colors.white54, thickness: 1, height: 1),
                    SizedBox(height: 10.h),
                    ListTile(
                      leading: Icon(Icons.work, color: Colors.white, size: 30),
                      title: Text(
                        'Projects',
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      ),
                      trailing: Icon(Icons.chevron_right, color: Colors.white),
                      onTap: () {},
                    ),
                    SizedBox(height: 340.h),
                    BlocBuilder<Authlogic, AuthStates>(
                      builder: (context, state) {
                        final cubit = context.read<Authlogic>();
                        return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                          ),
                          onPressed: () {
                            cubit.logout();
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.logout, color: Colors.red),
                              SizedBox(width: 5.w),
                              Text(
                                "logout",
                                style: TextStyle(color: Colors.red),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
