import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:memory_v2/database/alarmRow.dart';
import 'package:meta/meta.dart';
import '../alarm_Api/alramRunner.dart';

part 'alarm_event.dart';

part 'alarm_state.dart';

class AlarmBloc extends Bloc<AlarmEvent, AlarmState> {
  AlarmBloc() : super(emptyAlarm()) {
    on<AlarmEvent>((event, emit) {});

    on<setAlarm>((event,emit){
      emit(SettedAlarm(alarm: event.alarm));
    });

    // note: unset alarm so after reusing same data removed
    on<unSetAlarm>((event, emit) {
        emit(emptyAlarm());
    });
  }

  DateTime getDayOfWeekDay(int weekdayOfalarm) {
    DateTime d = DateTime.now();
    if (weekdayOfalarm > d.weekday) {
      return d.add(Duration(days: weekdayOfalarm - d.weekday));
    }
    return d.add(Duration(days: (7 - d.weekday + weekdayOfalarm)));
  }
}
