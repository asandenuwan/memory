part of 'alarm_bloc.dart';

@immutable
sealed class AlarmState {}

final class emptyAlarm extends AlarmState {}

final class SettedAlarm extends AlarmState{
  final Alarmcontainer? alarm;
  SettedAlarm({required this.alarm});
}