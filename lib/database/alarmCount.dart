import 'dart:io';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';

class alarmCounter{
  static late File file;


  static Future<void> init()async{
    final dir=await getApplicationDocumentsDirectory();
    file=File("${dir.path}/alarmCount.json");

    if(! await file.exists()){
      await file.create();
      await file.writeAsString(
          jsonEncode({"count": 0})
      );
    }

  }

  static Future<void>addAlarmCount(int count) async{
    String tmp=await file.readAsString();
    final j=jsonDecode(tmp);
    count+=j["count"] as int;
    file.writeAsString(jsonEncode({"count": count}));
    debugPrint("alarm count: ${count}");
  }

  static Future<int>getAlarmCount()async{
    return await jsonDecode(await file.readAsString())['count'] as int;
  }

}