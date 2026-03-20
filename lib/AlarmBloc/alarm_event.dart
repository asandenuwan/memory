part of 'alarm_bloc.dart';

@immutable
sealed class AlarmEvent {}

final class setAlarm extends AlarmEvent {
  final Alarm alarm;
  setAlarm({required this.alarm});
}

final class getAlarm extends AlarmEvent{
  final Job job;
  getAlarm({required this.job});
}

final class editJobGetAlarm extends AlarmEvent{
  final Job job;
  editJobGetAlarm({required this.job});
}

final class unSetAlarm extends AlarmEvent {}
