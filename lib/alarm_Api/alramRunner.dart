import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:android_intent_plus/android_intent.dart';
import 'package:android_intent_plus/flag.dart';

import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import '../database/alarmRow.dart';
import 'alarms.dart';

class AlramRunner {

  AlramRunner();

  static Future<void> init() async {
    if (Platform.isAndroid) {
      final exactAlarm = await Permission.scheduleExactAlarm.status;
      if (!exactAlarm.isGranted) {
        // Opens "Alarms & Reminders" settings page directly
        final intent = AndroidIntent(
          action: 'android.settings.REQUEST_SCHEDULE_EXACT_ALARM',
          flags: <int>[Flag.FLAG_ACTIVITY_NEW_TASK],
        );
        await intent.launch();
      }
    }
    try{
      await AndroidAlarmManager.initialize();
    }
    catch ( e){}
  }

  static Future<void> specificTimer(DateTime d, String msg, int id) async {
    debugPrint("-----------------------------------setAlrmSpecific;;;;;;;;;;;;;;;;;;");
    debugPrint("--------------------------Specifc alarm:$d");
    await AndroidAlarmManager.oneShotAt(
        d, id, specificAlarm, params: {"title": msg},
        exact: true,
        wakeup: true);
  }

  static Future<void> intervalTimer(Duration d, String msg, bool repeat,int alarm_id) async {
    debugPrint("-----------------------------------setAlrmInterval;;;;;;;;;;;;;;;;;;");
    debugPrint("...................................{$alarm_id}");
    DateTime time = DateTime.now().add(d);
    if (repeat) {
      await AndroidAlarmManager.oneShotAt(time, alarm_id, intervalRepeat,
          params: {'title': msg},
          exact: true,
          wakeup: true);
    } else {
      debugPrint(
          "-----------------------------------setAlrm no repeat Interval;;;;;;;;;;;;;;;;;;");

      await AndroidAlarmManager.oneShotAt(time,
          alarm_id,
          intervalNoneRepeat,
          params: {'title': msg},
          exact: true,
          wakeup: true);
    }
  }

  static Future<void> weeklyTimer(List<DateTime> dateList,int alarm_id,String msg) async {

    debugPrint(" q               3333                          weekAlarm timer");

    for (int i = 0; i < dateList.length; i++) {
      await AndroidAlarmManager.oneShotAt(
          dateList[i],
          alarm_id,
          weekAlarm,
          params: {
            'title': msg
          },
          wakeup: true,
          exact:true
      );
      alarm_id++;
    }
  }

  static Future<void> loadAlarm(Alarm alarm) async {
    debugPrint("---------------------------------------------------load alarm--------");
    if (alarm.type == 's') {
      print("---------------------------------------------------specificTimer alarm--------");
      specificTimer(DateTime(
          alarm.year!, alarm.month!, alarm.day!, alarm.H!, alarm.M!, alarm.S!),
          alarm.title!, alarm.AlarmId!);
    }
    else if (alarm.type == 'i') {
      debugPrint("---------------------------------------------------intervalTimer alarm--------");
      intervalTimer(Duration(
          hours: alarm.H!, minutes: alarm.M!, seconds: alarm.S!, days: 0),
          alarm.title!, false, alarm.AlarmId!);
    }
    else {
      debugPrint("---------------------------------------------------weekly alarm--------");
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
      debugPrint("_______________________________________\n$TimeList ====TimeListLenght:${TimeList.length}");
      weeklyTimer(TimeList,alarm.AlarmId!, alarm.title!);
    }
  }

  static Future<void> cancelAlarm(Alarm alarm) async {
    debugPrint("===========Alarm id delete=========${alarm.AlarmId}");

    if (alarm.AlarmId == null) {
      debugPrint("===========Alarm id is null, skipping cancel=========");
      return;
    }

    if(alarm.type=='w'){
      int c=0;
      for(int i=0;i<alarm.weekDays!.length;i++){
        if(alarm.weekDays![i]==true){
          print("alarm id==================${alarm.AlarmId}");
          await AndroidAlarmManager.cancel(alarm.AlarmId!+c);
          c++;
        }
      }
    }
    else{
      debugPrint("alarm id==================${alarm.AlarmId}");
      await AndroidAlarmManager.cancel(alarm.AlarmId!);
    }
  }
}