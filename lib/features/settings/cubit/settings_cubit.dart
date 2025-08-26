import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/features/settings/cubit/settings_status.dart';

class SettingsCubit extends Cubit<SettingsStatus> {
  SettingsCubit() : super(InitSettings());
}
