import 'package:isar_community/isar.dart';

part 'jobrow.g.dart';

@Collection(accessor: 'jobs')
class Job{
  @Index(unique: true)
  Id id = Isar.autoIncrement;
  late String title;
  late String discription;

  late DateTime addedDay=DateTime.now();
  DateTime? doneDay;

  late bool isDid=false;
}