import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import '../database/alarmRow.dart';
import 'alarms.dart';

class AlramRunner {

  AlramRunner();

  static Future<bool> init() async {
    await AndroidAlarmManager.initialize();
    return true;
  }

  static Future<void> specificTimer(DateTime d, String msg, int id) async {
    await AndroidAlarmManager.oneShotAt(
        d, id, specificAlarm, params: {"title": msg},
        exact: true,
        wakeup: true);
  }

  static Future<void> intervalTimer(Duration d, String msg, bool repeat, int id) async {
    DateTime time = DateTime.now().add(d);
    if (repeat) {
      await AndroidAlarmManager.oneShotAt(time, id, intervalRepeat,
          params: {'title': msg, 'id': id, "duration": d},
          exact: true,
          wakeup: true);
    } else {
      await AndroidAlarmManager.oneShotAt(time, id, intervalNoneRepeat,
          params: {'title': msg, 'id': id, "duration": d},
          exact: true,
          wakeup: true);
    }
  }

  static Future<void> weeklyTimer(List<DateTime> dateList, List<int> idList, String msg) async {
    for (int i = 0; i < dateList.length; i++) {
      await AndroidAlarmManager.oneShotAt(
          dateList[i], idList[i],
          weekAlarm,
          params: {
            'id': idList[i],
            'date': dateList[i],
            'title': msg
          }
      );
    }
  }

  static Future<void> loadAlarm(Alarm alarm) async {
    if(alarm.type=='s'){
      specificTimer(DateTime(alarm.year!,alarm.month!,alarm.day!,alarm.H!,alarm.M!,alarm.S!),alarm.title!,alarm.id);
    }
    else if(alarm.type=='i'){
      intervalTimer(Duration(hours:alarm.H!,minutes: alarm.M!,seconds:  alarm.S!, days: 0), alarm.title!, false, alarm.id);
    }
    else{

      List<DateTime> TimeList=[];
      List<int> idList=[];
      List<int> tmpList=[];

      for(int i=1;i<=7;i++){
        if(alarm.weekDays![i]==true){
          tmpList.add(i);
        }
      }

      for(int day in tmpList){

        DateTime now= DateTime.now();
        DateTime date=DateTime(now.year,now.month,now.day);

        if(day > date.weekday){
          date=date.add(Duration(days: day-date.weekday,hours: alarm.H!,minutes: alarm.M!,seconds: alarm.S!));
        }else if(day < date.weekday){
          int D=7-date.weekday+day;
          date=date.add(Duration(days: D,hours: alarm.H!,minutes: alarm.M!,seconds: alarm.S!));
        }else{

          if(
          DateTime.now().add(Duration(minutes: 3)).isAfter(
              date.add(Duration(hours: alarm.H!,minutes: alarm.M!,seconds: alarm.S!))
          )
          ){
            date=date.add(Duration(days: 7,hours: alarm.H!,minutes: alarm.M!,seconds: alarm.S!));
          }else{
            date=date.add(Duration(hours: alarm.H!,minutes: alarm.M!,seconds: alarm.S!));
          }
        }

        TimeList.add(date);
        final N=DateTime.now();
        idList.add(int.parse("${N.year}${N.month}${N.day}${N.hour}${N.minute}${N.second}${N.microsecond}${N.microsecond}${alarm.id}"));
      }
      weeklyTimer(TimeList, idList, alarm.title!);
    }
  }

  static Future<void> cancelAlarm(int id) async {
    await AndroidAlarmManager.cancel(id);
  }
}