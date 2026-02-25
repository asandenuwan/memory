import 'package:isar_community/isar.dart';

@Collection(accessor:"Alarms")
class Alarm{
  Id id=Isar.autoIncrement;
  late String title;
  late bool repeat;
  late bool delay;
}