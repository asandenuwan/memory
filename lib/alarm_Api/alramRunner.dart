import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import '../database/jobrow.dart';
import 'alarms.dart';

class AlramRunner{

  AlramRunner();

  static Future<bool> init()async{
    await AndroidAlarmManager.initialize();
    return true;
  }

  static Future<void> specificTimer(DateTime d,String msg, int id)async{
    await AndroidAlarmManager.oneShotAt(d,id ,specificAlarm,params: {"title":msg},exact: true,wakeup: true);
  }

  static Future<void>intervalTimer(Duration d,String msg,bool repeat,int id)async{
    DateTime time=DateTime.now();
    time.add(d);
    if(repeat){
      await AndroidAlarmManager.oneShotAt(time, id, intervalRepeat,params: {'title':msg,'id':id,"duration":d},exact: true,wakeup: true);
    }else{
      await AndroidAlarmManager.oneShotAt(time, id, intervalNoneRepeat,params:{'title':msg,'id':id,"duration":d},exact: true,wakeup: true );
    }
  }

  static Future<void> weeklyTimer(List<DateTime> dateList,List<int> idList,String msg)async{
    for(int i=0;i<dateList.length;i++){
      await AndroidAlarmManager.oneShotAt(dateList[i], idList[i], specificAlarmRepaet,params: {'id':idList[i],'date':dateList[i],'title':msg});
    }
  }

  static Future<void> cancelAlram(int id)async{
    await AndroidAlarmManager.cancel(id);
  }
}