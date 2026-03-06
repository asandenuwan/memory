import 'alramRunner.dart';
import '../NotificationApi/notification.dart';

@pragma('vm:entry-point')
void specificAlarm(Map<String,dynamic> pams)async{

  await NotifitaionApi.showNification(pams["title"]);
}

@pragma('vm:entry-point')
void weekAlarm(Map<String,dynamic> pams)async{

  DateTime d=pams['date'];
  String msg=pams["title"];
  int id=pams['id'];

  await NotifitaionApi.showNification(msg);
  AlramRunner.intervalTimer(Duration(days: 7), msg, true, id);
}

@pragma('vm:entry-point')
void intervalRepeat(Map<String,dynamic> pams)async{

  String msg=pams["title"];
  int id=pams['id'];
  Duration d=pams['duration'];

  await NotifitaionApi.showNification(msg);
  AlramRunner.intervalTimer(d, msg, true, id);
}

@pragma('vm:entry-point')
void intervalNoneRepeat(Map<String,dynamic> pams)async{
  String msg=pams["title"];

  await NotifitaionApi.showNification(msg);
}