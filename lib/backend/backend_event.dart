part of 'backend_bloc.dart';

@immutable
sealed class BackendEvent {}

class addNewTab extends BackendEvent{
  late final Tab tab;
  addNewTab(this.tab);
}

class updateTab extends BackendEvent{
  late final Tab tab;
  updateTab({required this.tab});
}

class addNewJob extends BackendEvent{
  late final Job job;
  addNewJob({required this.job});
}

class updateJob extends BackendEvent{
  late final Job job;
  updateJob(this.job);
}

class loadTabs extends BackendEvent{}

class loadPage extends BackendEvent{
  late final Tab tab;
  loadPage(this.tab);
}

class deleteTab extends BackendEvent{
  late final Tab tab;
  deleteTab(this.tab);
}

class deleteJob extends BackendEvent{
  late final Job job;
  late final Tab tab;
  deleteJob({required this.job, required this.tab});
}

class init extends BackendEvent{}