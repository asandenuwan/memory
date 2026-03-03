import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../database/memoryDb.dart';
import '../database/tabrow.dart';
import '../database/jobrow.dart';
import '../database/alarmRow.dart';
import '../AlarmBloc/alarmContainer.dart';

part 'backend_event.dart';
part 'backend_state.dart';

class BackendBloc extends Bloc<BackendEvent, BackendState> {
  BackendBloc():super(INIT()) {

    on<init>((event,emit)async{// runs only first time
       List<Tab> L=await memoryDb().getTabs();
       List<Job> j=[];
       final Tab t;
       if(L.isEmpty){
         t=Tab();
         t.tabName="Wellcome to Memory";
       }else{
         t=L[0];
         L[0].jobs.load();
         j=L[0].jobs.toList();
       }
      emit(
        MailBox(currentPage: CurrentPage(Ctab: t, jobs: j), tabList: TabList(L))
      );
    });

    on<loadTabs>((event,emit)async{// when add new tab
      List<Tab> L=await memoryDb().getTabs();
      if(L.isEmpty){L=[];}

      Tab T=Tab();
      List<Job> j=[];
      if(state is MailBox){
        final mailBox = state as MailBox;
        T=mailBox.currentPage!.Ctab;

        j=mailBox.currentPage!.jobs!.toList();
      }
      emit(
          MailBox(
          currentPage: CurrentPage(Ctab: T, jobs: j),
          tabList: TabList(L)
      )
      );
    });

    on<loadPage>((event,emit)async{// when switch to other page
      final jobs = await memoryDb().getJobs(event.tab);
      final tabs = await memoryDb().getTabs();
      emit(
        MailBox(
          currentPage: CurrentPage(Ctab: event.tab, jobs: jobs),
          tabList: TabList(tabs),
        ),);
    });

    on<addNewTab>((event, emit) async {// add new tab
      await memoryDb().addTab(T:event.tab);

      emit(MailBox(currentPage: CurrentPage(Ctab: event.tab, jobs: []), tabList: TabList(await memoryDb().getTabs())));

    });

    on<addNewJob>((E,emit)async {//add new job i gona get current tab from CurrentPage state using state var
      try{
        if (state is MailBox) {
          final box = state as MailBox;

          await memoryDb().addJob(tab: box.currentPage!.Ctab, job: E.job);

          List<Job> j = await memoryDb().getJobs(box.currentPage!.Ctab);

          //--------------------loadPage event-------------------
          // add(loadPage(await box.currentPage!.Ctab));

          emit(MailBox(currentPage: CurrentPage(Ctab: box.currentPage!.Ctab, jobs: j), tabList: box.tabList));
          //--------------------------------------------------------
          
        }
      }catch (e){
        print("-------------error-------------------- $e ;;;;;;;;;;;;;;;;;;;");
      }
    });

    on<deleteTab>((event,emit)async{
      await memoryDb().deleteTab(event.tab);
      List<Tab>L=await memoryDb().getTabs();

      if(L.isEmpty){
        Tab t=Tab();
        t.tabName="empty";
        emit(MailBox(currentPage: CurrentPage(Ctab: t, jobs: []), tabList: TabList([])));
      }

        await L[0].jobs.load();
      emit(MailBox(currentPage: CurrentPage(Ctab: L[0], jobs: L[0].jobs.toList()), tabList: TabList(L)));
    });

    on<deleteJob>((event,emit)async{
      await memoryDb().deleteJob(event.job, event.tab);
      final jobs = await memoryDb().getJobs(event.tab);
      final tabs = await memoryDb().getTabs();
      emit(
        MailBox(
          currentPage: CurrentPage(Ctab: event.tab, jobs: jobs),
          tabList: TabList(tabs),
        ),);
    });

    on<updateJob>((event,emit)async{
      await memoryDb().updateJob(event.job);
      MailBox cur=state as MailBox;
      add(loadPage(cur.currentPage!.Ctab));
    });

    on<updateTab>((event,emit)async{
      await memoryDb().updateTab(event.tab);
      add(loadTabs());
    });

    add(init());
  }

}
