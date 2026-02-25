import 'package:isar_community/isar.dart';
import 'package:memory_v2/database/alarmRow.dart';

part 'jobrow.g.dart';

@Collection(accessor: 'jobs')
class Job{
  Id id = Isar.autoIncrement;
  late String title;
  late String discription;

  late DateTime addedDay=DateTime.now();
  DateTime? doneDay;

  late bool isDid=false;


  final alarms=IsarLinks<Alarm>();
}