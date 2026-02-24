import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import '../database/jobrow.dart';
import 'alarms.dart';

class AlramApi{

  AlramApi();

  static Future<bool> init()async{
    await AndroidAlarmManager.initialize();
    return true;
  }

  static Future<void> stopwotch({required Duration d,required int id, required Function callback})async{
    await AndroidAlarmManager.oneShot(d, id, callback);
  }

  static Future<void> specificTime(DateTime d,Job j)async{
    await AndroidAlarmManager.oneShotAt(d,j.id ,specificAlarm,params: {"title":j.title});
  }

  static Future<void> cancelAlram(int id)async{
    await AndroidAlarmManager.cancel(id);
  }
}