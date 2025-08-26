import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/core/style_manegares/colors.dart';
import 'package:todoapp/core/widgets/todo_tile.dart';
import 'package:todoapp/features/home/cubit/home/home_cubit.dart';
import 'package:todoapp/features/home/cubit/home/home_status.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStatus>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Appcolors.navyblue,
            title: const Text(
              "Todo",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            centerTitle: true,
            elevation: 20,
          ),
          body: Container(
            decoration: BoxDecoration(gradient: Appcolors.background),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Expanded(
                    child: (state is TodosLoadedState && state.todos.isNotEmpty)
                        ? ListView.builder(
                            itemCount: state.todos.length,
                            itemBuilder: (context, index) {
                              return TodoTile(
                                task: state.todos[index].title,
                                isDone: state.todos[index].isCompleted,
                                onTap: () {},
                                onSlid: (BuildContext context) {},
                              );
                            },
                          )
                        : const Center(child: Text("No todos yet")),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
