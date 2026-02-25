import 'package:memory_v2/database/jobrow.dart';
import 'alram.dart';
void specificAlarm(Map<String,dynamic> pams){
  print(pams["title"]);

}

void specificAlarmRepaet(Map<String,dynamic> pams){
  print(pams["title"]);
  DateTime d=pams['date'];
  String title=pams["title"];
  int id=pams['id'];
  AlramApi.specificTimer(d,title,id);
}

void intervalRepeat(Map<String,dynamic> pams){
  print(pams["title"]);

  String msg=pams["title"];
  int id=pams['id'];
  Duration d=pams['duration'];


  AlramApi.intervalTimer(d, msg, true, id);
}

void intervalNoneRepeat(Map<String,dynamic> pams){

  String msg=pams["title"];
  int id=pams['id'];
  Duration d=pams['duration'];
}