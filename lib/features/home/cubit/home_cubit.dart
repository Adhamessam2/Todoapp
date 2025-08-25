import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/features/home/cubit/home_status.dart';

class HomeCubit extends Cubit<HomeStatus> {
  HomeCubit() : super(InitHome());
}
