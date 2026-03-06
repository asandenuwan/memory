part of 'backend_bloc.dart';

@immutable
sealed class BackendEvent {}

class addNewTab extends BackendEvent{
  final Tab tab;
  addNewTab(this.tab);
}

class updateTab extends BackendEvent{
  final Tab tab;
  updateTab({required this.tab});
}

class addNewJob extends BackendEvent{
  final Job job;
  addNewJob({required this.job});
}

class addNewJobAndAlarm extends BackendEvent{
  final Job job;
  final Alarm alarm;
  addNewJobAndAlarm({required this.job,required this.alarm});
}

class loadAlarm extends BackendEvent{
  final Alarm alarm;
  loadAlarm({required this.alarm});
}

class updateJob extends BackendEvent{
  final Job job;
  updateJob(this.job);
}

class loadTabs extends BackendEvent{}

class loadPage extends BackendEvent{
  final Tab tab;
  loadPage(this.tab);
}

class deleteTab extends BackendEvent{
  final Tab tab;
  deleteTab(this.tab);
}

class deleteJob extends BackendEvent{
  final Job job;
  final Tab tab;
  deleteJob({required this.job, required this.tab});
}

class init extends BackendEvent{}