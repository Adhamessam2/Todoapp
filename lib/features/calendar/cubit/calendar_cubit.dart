import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/features/calendar/cubit/calendar_status.dart';

class CalendarCubit extends Cubit<CalendarStatus> {
  CalendarCubit() : super(InitCalendar());
}
