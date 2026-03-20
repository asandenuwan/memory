import 'package:flutter/material.dart' hide Tab;
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widget/jobList.dart';
import '../widget/menu.dart';
import '../backend/backend_bloc.dart';
import 'addJobPage.dart';
import '../NotificationApi/notification.dart';

class TabWidget extends StatefulWidget {
  TabWidget({super.key});

  @override
  State<TabWidget> createState() => _TabState();
}

class _TabState extends State<TabWidget> {

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<BackendBloc,BackendState>(builder:(context,states) {
      if(states is MailBox){
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
              title: Text(states.currentPage!.Ctab.tabName, style: TextStyle(
                color: Colors.white,
              ),),
              backgroundColor: Colors.black,
            iconTheme: IconThemeData(
              color: Colors.white,
            ),
          ),
          drawer: menuList(context),

          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              debugPrint("check");
              if(states.currentPage!.Ctab.id >=0){
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context){return addJobPage();}));
              }
            },
            child: Icon(Icons.add,color: Colors.white,),
            backgroundColor: Colors.black,

          ),

          body: Container(
            child: Joblist(),
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),color: Colors.lime.shade200),
          )
        );
      }

      return Scaffold(appBar: AppBar(title: Text("Error"),),);
    }
    );
  }
}
