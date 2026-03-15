import 'package:isar_community/isar.dart';

// types
//__________________
// specific -s
// weekly   -w
// interval -i
//------------------

part 'alarmRow.g.dart';

@Collection(accessor:"Alarms")
class Alarm{
  late String type;
  String? title;
  Id id=Isar.autoIncrement;
  int? AlarmId;
  int? year;
  int? month;
  int? day;
  int? H;
  int? M;
  int? S;
  List<bool>? weekDays;
  bool repeat=false;
}