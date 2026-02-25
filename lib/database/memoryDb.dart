import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:isar_community/isar.dart';

import 'jobrow.dart';
import 'tabrow.dart';

import 'dart:async';
class memoryDb{
  static late Isar isar;

  static Future<void> init()async{
    final Directory dir=await getApplicationDocumentsDirectory();
    isar=await Isar.open([JobSchema,TabSchema], directory: dir.path);
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

  Future<List<Tab>> getTabs()async{
    if(!isar.isOpen){print("call init before us DB");exit(-1);}

    return await isar.Tabs.where().findAll();
  }

  Future<List<Job>> getJobs(Tab tab)async{
    if(isar.isOpen){
      return await memoryDb.isar.writeTxn(()async{
        await tab.jobs.load();
        return await tab.jobs.toList();
      });
    }else{
      print("call init before us DB");exit(-1);
    }

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
      await isar.jobs.delete(job.id);
      tab.jobs.remove(job);
      await tab.jobs.save();
      await isar.jobs.delete(job.id);
    });
  }

  Future<bool> updateJob(Job job) async {
    return await isar.writeTxn(() async {
      await isar.jobs.put(job);
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
