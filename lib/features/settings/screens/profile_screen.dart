import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todoapp/core/style_manegares/colors.dart';
import 'package:todoapp/core/models/user_model.dart';
import 'package:todoapp/features/settings/profileServices/profile_service.dart';
import 'package:todoapp/features/settings/profileServices/profile_widgets.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            "Profile",
            style: TextStyle(color: Colors.white, fontSize: 24.sp),
          ),
        ),
        body: FutureBuilder<UserModel?>(
          future: ProfileService.getUserData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.white),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(
                  "Error: ${snapshot.error}",
                  style: const TextStyle(color: Colors.red),
                ),
              );
            } else if (!snapshot.hasData || snapshot.data == null) {
              return const Center(
                child: Text(
                  "No user data found",
                  style: TextStyle(color: Colors.white),
                ),
              );
            }

            return ProfileInfo(user: snapshot.data!);
          },
        ),
      ),
    );
  }
}
