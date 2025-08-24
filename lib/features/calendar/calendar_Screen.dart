import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todoapp/core/style_manegares/colors.dart';
import 'package:todoapp/core/style_manegares/commonstyle.dart';
import 'package:todoapp/features/calendar/cubit/calendar_cubit.dart';
import 'package:todoapp/features/calendar/cubit/calendar_status.dart';

class CalendarScreen extends StatelessWidget {
  CalendarScreen({super.key});
  DateTime today = DateTime.now();
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
        body: SafeArea(
          child: BlocConsumer<CalendarCubit, CalendarStatus>(
            builder: (context, state) {
              final cubit = context.read<CalendarCubit>();

              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Icon(
                            size: 32,
                            Icons.keyboard_arrow_left,
                            color: const Color(0xff1AA2C0),
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
                                  color: Colors.white,
                                  fontSize: 24,
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
                      title: Text(
                        "Tasks deadline in ${state.selectedDay.toString().split(' ')[0]}",
                      ),
                      content: Container(),
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
