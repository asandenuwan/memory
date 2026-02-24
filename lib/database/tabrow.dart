import 'package:isar_community/isar.dart';
import 'jobrow.dart';

part 'tabrow.g.dart';

@Collection(accessor: 'Tabs')
class Tab{
  @Index(unique:true)
  Id id=Isar.autoIncrement;
  late String tabName;
  final jobs=IsarLinks<Job>();

}