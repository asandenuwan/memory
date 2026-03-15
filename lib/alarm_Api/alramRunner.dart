import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import '../database/alarmRow.dart';
import 'alarms.dart';
import '../database/alarmCount.dart';

class AlramRunner {

  AlramRunner();

  static Future<void> init() async {
    try{
      await AndroidAlarmManager.initialize();
    }
    catch ( e){}
  }

  static Future<void> specificTimer(DateTime d, String msg, int id) async {
    print("-----------------------------------setAlrmSpecific;;;;;;;;;;;;;;;;;;");
    await AndroidAlarmManager.oneShotAt(
        d, id, specificAlarm, params: {"title": msg},
        exact: false,
        wakeup: true);
    await alarmCounter.addAlarmCount(1);
  }

  static Future<void> intervalTimer(Duration d, String msg, bool repeat,int alarm_id) async {
    print("-----------------------------------setAlrmInterval;;;;;;;;;;;;;;;;;;");
    print("...................................{$alarm_id}");
    DateTime time = DateTime.now().add(d);
    if (repeat) {
      await AndroidAlarmManager.oneShotAt(time, alarm_id, intervalRepeat,
          params: {'title': msg, "duration": d},
          exact: false,
          wakeup: true);
    } else {
      print(
          "-----------------------------------setAlrm no repeat Interval;;;;;;;;;;;;;;;;;;");

      await AndroidAlarmManager.oneShotAt(time,
          alarm_id,
          intervalNoneRepeat,
          params: {'title': msg},
          exact: false,
          wakeup: true);
    }
    await alarmCounter.addAlarmCount(1);
  }

  static Future<void> weeklyTimer(List<DateTime> dateList,int alarm_id,String msg) async {

    print(" q               3333                          weekAlarm timer");
    await alarmCounter.addAlarmCount(alarm_id+dateList.length);

    for (int i = 0; i < dateList.length; i++) {
      await AndroidAlarmManager.oneShotAt(
          dateList[i],
          alarm_id,
          weekAlarm,
          params: {
            'title': msg
          },
          wakeup: true
      );
      alarm_id++;
    }
  }

  static Future<void> loadAlarm(Alarm alarm) async {
    int id=await alarmCounter.getAlarmCount();
    alarm.AlarmId=id+1;

    if (alarm.type == 's') {
      specificTimer(DateTime(
          alarm.year!, alarm.month!, alarm.day!, alarm.H!, alarm.M!, alarm.S!),
          alarm.title!, alarm.AlarmId!);
    }
    else if (alarm.type == 'i') {
      intervalTimer(Duration(
          hours: alarm.H!, minutes: alarm.M!, seconds: alarm.S!, days: 0),
          alarm.title!, false, alarm.AlarmId!);
    }
    else {
      print("---------------------------------------------------weekly alarm--------");
      List<DateTime> TimeList = [];
      List<int> tmpList = [];

      for (int i = 0; i < 7; i++) {
        if (alarm.weekDays![i] == true) {
          tmpList.add(i+1);
        }
      }

      for (int day in tmpList) {
        DateTime now = DateTime.now();
        DateTime date = DateTime(now.year, now.month, now.day,0,0,0,0,0);

        if (day > date.weekday) {
          date = date.add(Duration(days: day - date.weekday,
              hours: alarm.H!,
              minutes: alarm.M!,
              seconds: alarm.S!));
        } else if (day < date.weekday) {
          int D = 7 - date.weekday + day;
          date = date.add(Duration(
              days: D, hours: alarm.H!, minutes: alarm.M!, seconds: alarm.S!));
        } else {
          if (
            date.add(Duration(hours: alarm.H!, minutes: alarm.M!, seconds: alarm.S!)).isAfter(DateTime.now().add(Duration(minutes: 1)))
          ) {
            date = date.add(Duration(hours: alarm.H!, minutes: alarm.M!, seconds: alarm.S!));
          } else {
            date = date.add(Duration(days: 7,
                hours: alarm.H!,
                minutes: alarm.M!,
                seconds: alarm.S!));
          }
        }

        TimeList.add(date);
      }
      print("_______________________________________\n$TimeList ====TimeListLenght:${TimeList.length}");
      weeklyTimer(TimeList,alarm.AlarmId!, alarm.title!);
    }
  }

  static Future<void> cancelAlarm(int id) async {
    await AndroidAlarmManager.cancel(id);
  }
}