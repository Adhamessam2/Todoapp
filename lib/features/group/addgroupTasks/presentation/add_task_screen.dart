// i made this as an alternative solution
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todoapp/core/models/group_model.dart';
import 'package:todoapp/core/models/todo_model.dart';
import 'package:todoapp/core/style_manegares/colors.dart';
import 'package:todoapp/core/style_manegares/commonstyle.dart';
import 'package:todoapp/core/widegts/button.dart';
import 'package:todoapp/core/widegts/custmized_text_field.dart';
import 'package:todoapp/core/widegts/snackbar_custmized.dart';
import 'package:todoapp/features/group/addgroupTasks/cubit/Add%20tasks&todos/todo_cubit.dart';
import 'package:todoapp/features/group/addgroupTasks/cubit/Add%20tasks&todos/todo_status.dart';

class AddGroupTaskScreen extends StatelessWidget {
  AddGroupTaskScreen({super.key, required this.currentGroup});
  final TextEditingController _titleCtrl = TextEditingController();
  final TextEditingController _desCtrl = TextEditingController();
  final GroupModel currentGroup;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Appcolors.navyblue,
        title: Text(currentGroup.groupeName, style: Customstyle.mystyle),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Appcolors.lightblue, Appcolors.blue, Appcolors.navyblue],
          ),
        ),
        child: Column(
          children: [
            BlocConsumer<GroupAddTodoCubit, GroupAddStates>(
              builder: (context, state) {
                final cubit = context.read<GroupAddTodoCubit>();
                return Padding(
                  padding: EdgeInsets.all(width * 0.04),
                  child: SizedBox(
                    height: height * 0.8,
                    child: ListView(
                      children: [
                        CustmizedTextField(
                          ctrl: _titleCtrl,
                          lable: "Task Title",
                        ),
                        SizedBox(height: 5),
                        CustmizedTextField(
                          ctrl: _desCtrl,
                          lable: "Task Description",
                        ),
                        SizedBox(height: height * 0.05),
                        Container(
                          height: height * 0.5,
                          width: width * 0.6,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: TableCalendar(
                            calendarStyle: CalendarStyle(
                              defaultTextStyle: TextStyle(
                                color: Appcolors.navyblue,
                                fontWeight: FontWeight.w600,
                              ),
                              selectedTextStyle: TextStyle(
                                color: Appcolors.lightblue,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              selectedDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Appcolors.blue,
                              ),
                              todayDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Appcolors.lightblue,
                              ),
                            ),
                            headerStyle: HeaderStyle(
                              titleCentered: true,
                              formatButtonVisible: false,
                              titleTextStyle: TextStyle(
                                color: Appcolors.navyblue,
                                fontSize: (width > height)
                                    ? height * 0.05
                                    : width * 0.05,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            focusedDay: (state is InitCalendarAdd)
                                ? state.today
                                : DateTime.now(),
                            firstDay: DateTime(2010, 1, 1),
                            lastDay: DateTime(2030, 12, 30),
                            selectedDayPredicate: (day) => isSameDay(
                              (state is InitCalendarAdd)
                                  ? state.selectedDay
                                  : DateTime.now(),
                              day,
                            ),
                            onDaySelected: (selectedDay, focusedDay) {
                              cubit.selectDay(selectedDay);
                            },
                            onDayLongPressed: (selectedDay, focusedDay) {
                              cubit.selectDay(selectedDay);
                            },
                          ),
                        ),
                        SizedBox(height: height * 0.05),
                        Button(
                          lable: 'add task',
                          size: 'big',
                          addFun: () {
                            cubit.addGroupTask(
                              TodoModel(
                                id: '${cubit.currentUser.id}${DateTime.now().millisecond}',
                                title: _titleCtrl.text,
                                description: _desCtrl.text,
                                deadline: cubit.deadline,
                              ),
                              currentGroup,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
              listener: (context, state) {
                if (state is TodoAddSucc) {
                  SnackbarCustmized(
                    time: 1,
                    message: state.message,
                    color: Colors.green,
                  ).showSnackBar(context);
                  _desCtrl.clear();
                  _titleCtrl.clear();
                }
                if (state is TodosError) {
                  SnackbarCustmized(
                    time: 1,
                    message: state.error,
                    color: Colors.red,
                  ).showSnackBar(context);
                  _desCtrl.clear();
                  _titleCtrl.clear();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
