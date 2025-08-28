import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileInfo extends StatelessWidget {
  final String? label;
  final String? value;
  ProfileInfo(String s, username, {super.key, this.label, this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Text(
        "$label: $value",
        style: TextStyle(fontSize: 20.sp, color: Colors.white),
      ),
    );
  }
}
