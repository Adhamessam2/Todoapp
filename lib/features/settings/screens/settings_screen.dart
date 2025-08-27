import 'package:flutter/material.dart';
import 'package:todoapp/core/style_manegares/colors.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.navyblue,
      appBar: AppBar(
        backgroundColor: Appcolors.navyblue,
        centerTitle: true,
        title: Text('Settings', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
