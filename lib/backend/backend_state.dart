part of 'backend_bloc.dart';

@immutable
sealed class BackendState {}

final class TabList extends BackendState{
   final List<Tab>? tabs;
  TabList(this.tabs);
}

final class CurrentPage extends BackendState{
   final List<Job>? jobs;
   final Tab Ctab;
  CurrentPage({required this.Ctab,required this.jobs});
}

final class MailBox extends BackendState{
  final CurrentPage? currentPage;
  final TabList? tabList;

  MailBox({required this.currentPage, required this.tabList});
}


final class INIT extends BackendState{}