part of 'alarm_bloc.dart';

@immutable
sealed class AlarmEvent {}

final class setAlarm extends AlarmEvent {
  final Alarm alarm;
  setAlarm({required this.alarm});
}


final class unSetAlarm extends AlarmEvent {}
