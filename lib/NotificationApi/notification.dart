import 'dart:math';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotifitaionApi{

  static final FlutterLocalNotificationsPlugin notificationsPlugin = FlutterLocalNotificationsPlugin();
  static late final AndroidNotificationDetails androidNotificationDetails;
  static late final NotificationDetails details;
  static int idCount=0;
  static bool isSetup=false;
  static Future<void> init()async{
    const AndroidInitializationSettings androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings settings = InitializationSettings(android: androidSettings);

    await notificationsPlugin.initialize(settings);

    androidNotificationDetails=AndroidNotificationDetails("memoryV_2", "memory",
        importance: Importance.max,
        priority: Priority.max,
        channelDescription: 'Reminder notifications',
        playSound: true,
        enableVibration: true,
        fullScreenIntent: true
    );
    try{
      if(isSetup==false){
        details=NotificationDetails(android: androidNotificationDetails);
        isSetup=true;
      }
    }catch (e){
      print("==========================${e}");
    }


  }

  static Future<void> showNification(String msg)async{
    await notificationsPlugin.show(idCount, "Job remaind", msg, details);
    idCount++;
    print(idCount);
  }

}