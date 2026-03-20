import 'dart:io';

import 'package:memory_v2/database/alarmRow.dart';
import 'package:path_provider/path_provider.dart';
import 'package:isar_community/isar.dart';

import '../alarm_Api/alramRunner.dart';

import 'jobrow.dart';
import 'tabrow.dart';

import 'dart:async';
class memoryDb{
  static late Isar isar;

  static Future<void> init()async{
    final Directory dir=await getApplicationDocumentsDirectory();
    isar=await Isar.open([JobSchema,TabSchema,AlarmSchema], directory: dir.path);
  }

  Future<void> addTab({required Tab T})async{
    if(isar.isOpen){
      var tab=T;

      await isar.writeTxn(()async{
        final jobs = await T.jobs.toList();
        tab.jobs.addAll(jobs);
        await isar.Tabs.put(tab);
      });
    }else{
      print("run init before use DB");
    }
  }

  Future<void> addJob({required Tab tab,required Job job})async{
    if(isar.isOpen){
      return await memoryDb.isar.writeTxn(()async{
        await isar.jobs.put(job);

        tab.jobs.add(job);
        await tab.jobs.save();
      });
    }else{
      print("run init before use DB");
    }
  }

  Future<void> addJobAndAlarm({required Tab tab,required Job job, required Alarm alarm})async{
    if(isar.isOpen){
      return await memoryDb.isar.writeTxn(()async{
        print("alarm id==================${alarm.AlarmId}");
        await isar.jobs.put(job);

        await isar.Alarms.put(alarm);

        job.alarm.value=alarm;
        await job.alarm.save();

        tab.jobs.add(job);
        await tab.jobs.save();
      });
    }else{
      print("run init before use DB");
    }
  }


  Future<List<Tab>> getTabs()async{
    if(!isar.isOpen){print("call init before us DB");exit(-1);}

    return await isar.Tabs.where().findAll();
  }

  Future<List<Job>> getJobs(Tab tab)async{
    if(isar.isOpen){

      return await memoryDb.isar.txn(()async{
        await tab.jobs.load();
        return await tab.jobs.toList();
      });
    }else{
      print("call init before us DB");exit(-1);
    }

  }

  Future<Alarm?> getAlarm(Job job)async{
    return await isar.txn(() async {
      await job.alarm.load();
      Alarm? alarm= job.alarm.value;
      print("---------------${alarm?.AlarmId??"no alarm"}");
      return alarm;
    });
  }


  Future<void>deleteTab(Tab tab)async{
    if(!isar.isOpen){print("call init before us DB");exit(-1);}

    await isar.writeTxn(() async{
      await tab.jobs.load();
      for(Job j in tab.jobs.toList()){
        await isar.jobs.delete(j.id);
      }
      await isar.Tabs.delete(tab.id);
    });

  }

  Future<void>deleteJob(Job job,Tab tab)async{
    if(!isar.isOpen){print("call init before us DB");exit(-1);}
    await isar.writeTxn(() async{

      await job.alarm.load();
      print("test 1");
      if (await job.alarm.value!=null) {
        print("test 2");
        await AlramRunner.cancelAlarm(job.alarm.value!);
        await isar.Alarms.delete(job.alarm.value!.id);
        print("test 3");
      }else{
        print("no alarm");
      }
      print("test 4");
      await isar.jobs.delete(job.id);
      tab.jobs.remove(job);
      await tab.jobs.save();
      await isar.jobs.delete(job.id);
    });
  }

  Future<void>deleteAlarm(Alarm alarm)async{
    await isar.writeTxn(() async {
      isar.Alarms.delete(alarm.id);
    });
  }

  Future<bool> updateJob(Job job) async {
    print("updateJob");
    return await isar.writeTxn(() async {
      await isar.jobs.put(job);
      return true;
    });
  }

  Future<bool> updateJobWithAlarm(Job job,Alarm alarm) async {
    print("updateJobWithAlarm func");
    return await isar.writeTxn(() async {
      await job.alarm.load();
      print("object");
      await isar.Alarms.put(alarm);
      print("object");
      job.alarm.value=alarm;
      await job.alarm.save();
      print("object");
      await isar.jobs.put(job);
      print("object");
      await job.alarm.save();
      return true;
    });
  }

  Future<bool> updateTab(Tab tab) async {
    return await isar.writeTxn(() async {
      await isar.Tabs.put(tab);
      return true;
    });
  }

}
