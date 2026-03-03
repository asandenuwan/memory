import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:memory_v2/database/alarmRow.dart';
import 'package:meta/meta.dart';
import 'alarmContainer.dart';
import '../alarm_Api/alramRunner.dart';

part 'alarm_event.dart';

part 'alarm_state.dart';

class AlarmBloc extends Bloc<AlarmEvent, AlarmState> {
  AlarmBloc() : super(emptyAlarm()) {
    on<AlarmEvent>((event, emit) {});

    // note: add Alarm
    on<addAlarm>((event, emit) {
      setAlarm? cState;
      if (!(state is setAlarm)) {
        return;
      }
      cState = state as setAlarm;

      //----------------------------------------------------------
      if (cState.alarm!.type == 's') {
        Alarmcontainer? a = cState.alarm;
        DateTime d = DateTime(a!.year, a!.month, a!.day, a!.H, a!.M, a!.S);
        AlramRunner.specificTimer(
          d,
          a.title,
          Random.secure().nextInt(99 * 100 + 1 - 99) + 99,
        );
        // FIXME: fix this before DEPLOY [Random Id maker] ;
      }
      else if (cState.alarm!.type == 'w') {
        List<DateTime> weekDay = [];
        int count = 1;
        DateTime D = DateTime.now();
        D.weekday;

        for (bool i in cState.alarm!.weekDays) {
          if (i) {
            DateTime targetDay = getDayOfWeekDay(count);
            DateTime alarmTime = DateTime(
              targetDay.year,
              targetDay.month,
              targetDay.day,
              cState.alarm!.H,
              cState.alarm!.M,
              cState.alarm!.S,
            );

            if (!alarmTime.isBefore(
              DateTime.now().add(Duration(seconds: 10)),
            )) {
              weekDay.add(alarmTime.add(Duration(days: 7)));
            }
          }
          count++;
        }
        AlramRunner.weeklyTimer(
          weekDay,
          List.generate(count, (i) {
            return Random.secure().nextInt(99 * 99);
          }),
          cState.alarm!.title,
        );

        // FIXME: fix this before DEPLOY [Random Id maker] ;
      }
      else if (cState.alarm!.type == 'i') {
        Duration d = Duration(
          hours: cState.alarm!.H,
          minutes: cState.alarm!.M,
          seconds: cState.alarm!.S,
        );
        AlramRunner.intervalTimer(
          d,
          cState.alarm!.title,
          cState.alarm!.repeat,
          Random.secure().nextInt(99 * 100 + 1 - 99) + 99,
        );
        // FIXME: fix this before DEPLOY [Random Id maker] ;
      } else {
        print("error");
      }
    });

    // note: set Alarm in state so after agars complite ui can reuse data of alarm
    on<setAlarm>((event, emit) {});
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
