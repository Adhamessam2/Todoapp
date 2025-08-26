import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/core/widgets/authgate.dart';
import 'package:todoapp/features/auth/cubit/auth_logic.dart';
import 'package:todoapp/features/auth/login/login_screen.dart';
import 'package:todoapp/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseAuth.instance.signOut;
  runApp(Todoapp());
}

class Todoapp extends StatefulWidget {
  const Todoapp({super.key});

  @override
  State<Todoapp> createState() => _TodoappState();
}

class _TodoappState extends State<Todoapp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(create: (context) => AuthCubit(), child: Authgate()),
    );
  }
}
