import 'alramRunner.dart';
import '../NotificationApi/notification.dart';

@pragma('vm:entry-point')
void specificAlarm(int id,Map<String,dynamic> pams)async{
  print("......................specificAlarm");
  await NotifitaionApi.init();
  await AlramRunner.init();

  await NotifitaionApi.showNification(pams["title"]);
}

@pragma('vm:entry-point')
void weekAlarm(int id,Map<String,dynamic> pams)async{
  print("..............weekAlarm");
  await NotifitaionApi.init();
  await AlramRunner.init();

  String msg=pams["title"];

  await NotifitaionApi.showNification(msg);
  AlramRunner.intervalTimer(Duration(days: 7), msg, true, id);
}

@pragma('vm:entry-point')
void intervalRepeat(int id ,Map<String,dynamic> pams)async{
  print(".....................intervalRepeat");
  await NotifitaionApi.init();
  await AlramRunner.init();

  String msg=pams["title"];
  Duration d=Duration(days: 7);

  await NotifitaionApi.showNification(msg);
  AlramRunner.intervalTimer(d, msg, true, id);
}

@pragma('vm:entry-point')
void intervalNoneRepeat(int id,Map<String,dynamic> pams)async{
  print("........................intervalNoneRepeat");
  await AlramRunner.init();
  await NotifitaionApi.init();

  String msg=pams["title"];

  await NotifitaionApi.showNification(msg);
}