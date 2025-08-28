import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todoapp/core/style_manegares/colors.dart';
import 'package:todoapp/core/style_manegares/commonstyle.dart';
import 'package:todoapp/features/calendar/cubit/calendar_cubit.dart';
import 'package:todoapp/features/calendar/cubit/calendar_status.dart';

// ignore: must_be_immutable
class CalendarScreen extends StatelessWidget {
  CalendarScreen({super.key});
  DateTime today = DateTime.now();
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

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
        body: SafeArea(
          child: BlocConsumer<CalendarCubit, CalendarStatus>(
            builder: (context, state) {
              final cubit = context.read<CalendarCubit>();

              return Padding(
                padding: EdgeInsets.all(
                  (width > height) ? height * 0.04 : width * 0.04,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(
                            (width > height) ? height * 0.01 : width * 0.01,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Icon(
                            size: (width > height)
                                ? height * 0.05
                                : width * 0.05,
                            Icons.keyboard_arrow_left,
                            color: Appcolors.textcolor,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            style: Customstyle.mystyle,
                            "Mange your Time",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: (width > height) ? height * 0.04 : width * 0.04,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: (state is InitCalendar)
                          ? TableCalendar(
                              headerStyle: HeaderStyle(
                                titleCentered: true,
                                formatButtonVisible: false,
                                titleTextStyle: TextStyle(
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                  fontSize: (width > height)
                                      ? height * 0.05
                                      : width * 0.05,
                                ),
                              ),
                              focusedDay: state.today,
                              firstDay: DateTime(2010, 1, 1),
                              lastDay: DateTime(2030, 12, 30),
                              selectedDayPredicate: (day) =>
                                  isSameDay(state.selectedDay, day),
                              onDaySelected: (selectedDay, focusedDay) {
                                cubit.selectDay(selectedDay);
                              },
                              onDayLongPressed: (selectedDay, focusedDay) {
                                cubit.selectDay(selectedDay);
                                cubit.showTasks(selectedDay);
                              },
                            )
                          : SizedBox(),
                    ),
                  ],
                ),
              );
            },
            listener: (context, state) {
              if (state is LoadingTasks) {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      elevation: 5,
                      content: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                            colors: [Appcolors.blue, Appcolors.navyblue],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                        child: ListView.builder(
                          itemCount: state.userTodos.length,
                          itemBuilder: (context, index) {},
                        ),
                      ),
                    );
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
