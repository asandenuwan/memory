part of 'alarm_bloc.dart';

@immutable
sealed class AlarmState {}

final class emptyAlarm extends AlarmState {}

final class SettedAlarm extends AlarmState{
  final Alarm alarm;
  SettedAlarm({required this.alarm});
}

final class editJobSettedAlarm extends AlarmState{
  final Alarm alarm;
  late String type;
  late String Date;
  editJobSettedAlarm({required this.alarm});
}