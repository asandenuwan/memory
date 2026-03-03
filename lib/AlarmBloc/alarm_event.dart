part of 'alarm_bloc.dart';

@immutable
sealed class AlarmEvent {}

final class addAlarm extends AlarmEvent {
  final int LastIdCreated;

  addAlarm({required this.LastIdCreated});
}

final class setAlarm extends AlarmEvent {
  final Alarmcontainer? alarm;

  setAlarm({required this.alarm});
}

final class unSetAlarm extends AlarmEvent {}
