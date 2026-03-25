import 'package:flutter/material.dart' hide Tab;
import 'package:flutter_bloc/flutter_bloc.dart';
import '../styles/decaration.dart';
import '../widget/jobList.dart';
import '../widget/menu.dart';
import '../backend/backend_bloc.dart';
import 'addJobPage.dart';

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
            backgroundColor: Colors.transparent, // required!
            elevation: 0,
            flexibleSpace: Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              decoration: decaration.TitleAppBar(),
            ),

            iconTheme: IconThemeData(
              color: Colors.white,
            ),
            
            title: Text(
              states.currentPage!.Ctab.tabName,
              style: fontStyle.TabHeader(),
            )
          ),
          drawer: menuList(context),

          floatingActionButton:Container(
            child:  FloatingActionButton(
              onPressed: () async {
                if(states.currentPage!.Ctab.id >=0){
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context){return addJobPage();}));
                }
              },
              child: Icon(Icons.add,color: Colors.white,),
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            decoration: decaration.addJobButton(),
          ),

          body: Container(
            child: Joblist(),
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey.shade100
            ),
          )
        );
      }

      return Scaffold(appBar: AppBar(title: Text("Error"),),);
    }
    );
  }
}
