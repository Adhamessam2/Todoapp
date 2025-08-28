import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileInfo extends StatelessWidget {
  final UserModel user;
  const ProfileInfo({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20.h),
          _buildInfo("Name", user.username),
          _buildInfo("Email", user.email),
          _buildInfo("UID", user.id),
          SizedBox(height: 10.h),
          _buildInfo("Total Todos", "${user.myTodosId.length}"),
          _buildInfo("Finished Todos", "${user.finshedTodos}"),
        ],
      ),
    );
  }

  Widget _buildInfo(String label, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Row(
        children: [
          Text(
            "$label :",
            style: TextStyle(
              fontSize: 20.sp,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            " $value",
            style: TextStyle(fontSize: 20.sp, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
