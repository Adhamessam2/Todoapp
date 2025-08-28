import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/core/models/todo_model.dart';
import 'package:todoapp/core/style_manegares/colors.dart';
import 'package:todoapp/core/style_manegares/commonstyle.dart';
import 'package:todoapp/core/widegts/authgate.dart';
import 'package:todoapp/core/widegts/button2.dart';
import 'package:todoapp/core/widegts/snackbar_custmized.dart';
import 'package:todoapp/features/addTasks/cubit/nav_cubit.dart';
import 'package:todoapp/features/auth/cubit/logic.dart';
import 'package:todoapp/features/group/todo_details/cubit/todo_details_cubit.dart';
import 'package:todoapp/features/group/todo_details/cubit/todo_details_status.dart';
import 'package:todoapp/features/home/presentation/screens/home_screen.dart';

class TodoDetailsScreen extends StatelessWidget {
  const TodoDetailsScreen({super.key, required this.todoModel});
  final TodoModel todoModel;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Appcolors.navyblue,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => BlocProvider(
                  create: (context) => Authlogic(),
                  child: Authgate(),
                ),
              ),
            );
          },
          icon: Icon(Icons.arrow_back_ios, color: Appcolors.lightblue),
        ),
      ),
      body: Container(
        color: Appcolors.navyblue,
        child: SafeArea(
          child: Stack(
            children: [
              Container(decoration: BoxDecoration(color: Appcolors.lightblue)),
              ClipPath(
                clipper: CurvedClipper(),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Container(
                  height: height * 0.42,
                  decoration: BoxDecoration(color: Appcolors.navyblue),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                child: BlocConsumer<TodoDetailsCubit, TodoDetailsStatus>(
                  builder: (context, state) {
                    final cubit = context.read<TodoDetailsCubit>();
                    return ListView(
                      children: [
                        SizedBox(height: height * 0.12),
                        Text(
                          todoModel.title,
                          style: Customstyle.headerText.copyWith(
                            fontSize: width * 0.1,
                          ),
                        ),
                        Text(
                          "Todo deadline : ${todoModel.deadline.toString().split(" ")[0]}",
                          style: Customstyle.headerText.copyWith(
                            fontSize: width * 0.04,
                          ),
                        ),
                        SizedBox(height: height * 0.145),
                        Text(
                          todoModel.description,
                          style: Customstyle.headerText.copyWith(
                            color: Appcolors.lightblue,
                            fontSize: width * 0.05,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: height * 0.02),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Button2(
                              lable: "done",
                              icon: Icons.done_all_sharp,
                              color: Colors.green,
                              onTap: () {
                                cubit.toggolTodo(todoModel);
                              },
                            ),
                            Button2(
                              lable: "delete",
                              icon: Icons.delete_outlined,
                              color: Appcolors.navyblue,
                              onTap: () {
                                cubit.deleteTodo(todoModel);
                              },
                            ),
                            Button2(
                              lable: "edit",
                              icon: Icons.edit_outlined,
                              color: Colors.amberAccent,
                              onTap: () {},
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                  listener: (context, state) {
                    if (state is ToggolTodo) {
                      SnackbarCustmized(
                        color: state.color,
                        message: state.message,
                        time: 1,
                      ).showSnackBar(context);
                    }
                    if (state is DeleteTodo) {
                      SnackbarCustmized(
                        color: state.color,
                        message: state.message,
                        time: 1,
                      ).showSnackBar(context);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BlocProvider(
                            create: (context) => NavCubit(),
                            child: HomeScreen(),
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CurvedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 100);

    // 🟡 منحنى دائري
    path.quadraticBezierTo(
      size.width / 2,
      size.height, // النقطة اللي في النص (قمة المنحنى)
      size.width,
      size.height - 100, // النقطة الأخيرة
    );

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CurvedClipper oldClipper) => false;
}
