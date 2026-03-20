import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:memory_v2/database/alarmRow.dart';
import 'package:memory_v2/database/jobrow.dart';
import 'package:meta/meta.dart';
import '../database/memoryDb.dart';
part 'alarm_event.dart';

part 'alarm_state.dart';

class AlarmBloc extends Bloc<AlarmEvent, AlarmState> {
  AlarmBloc() : super(emptyAlarm()) {
    on<AlarmEvent>((event, emit) {});

    on<setAlarm>((event,emit){
      emit(SettedAlarm(alarm: event.alarm));
    });

     on<getAlarm>((event,emit)async{
      Alarm? alarm=await memoryDb().getAlarm(event.job);
      if(alarm!=null){
        emit(SettedAlarm(alarm: alarm));
      }else{
        debugPrint("alarm is empty");
      }
    });

    on<editJobGetAlarm>((event,emit)async{
      Alarm? alarm=await memoryDb().getAlarm(event.job);
      if(alarm!=null){
        editJobSettedAlarm x=editJobSettedAlarm(alarm: alarm);
        if(alarm.type=='w'){
          x.type='weekly alarm';
          x.Date='Days: ';
          List<String> days=['mon ','tue ','wed ','thu ','fri ','sat ','sun'];
          for(int i=0;i<7;i++){
            if(alarm.weekDays![i]==true){
              x.Date+=days[i];
            }
          }
          x.Date+="| Time: ${alarm.H}:${alarm.M}:${alarm.S}";
          debugPrint(" ========================data:  ${x.Date}");
        }
        else if(alarm.type=='s'){
          x.type='specific alarm';
          x.Date=' Date: ${alarm.day}-${alarm.month}-${alarm.year} | Time: ${alarm.H}:${alarm.M}:${alarm.S}';
        }
        else{
          x.type='interval alarm';
          x.Date='Time: ${alarm.H}:${alarm.M}:${alarm.S}';
        }
        emit(x);
      }else{
        debugPrint("alarm is empty");
      }
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
