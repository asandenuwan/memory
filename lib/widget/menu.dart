import 'package:flutter/material.dart' hide Tab;
import "package:flutter_bloc/flutter_bloc.dart";
import "package:memory_v2/pages/editTab.dart";

import "../database/tabrow.dart";
import "../backend/backend_bloc.dart";
import '../pages/addTab.dart';

Drawer menuList(BuildContext context){
  return Drawer(
    backgroundColor: Colors.black54,
    child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: .min,
      children: [
        SizedBox(height: 30,),
       Text("Tabs",style: TextStyle(color: Colors.white,fontWeight: .bold,fontSize: 30),),
       Divider(color: Colors.white,thickness: 3,),
       Expanded( child:  BlocBuilder<BackendBloc,BackendState>(
            builder:(context,snapshot){
              final List<Tab>? tabs = (snapshot is MailBox && snapshot.tabList!.tabs!.length !=0) ? snapshot.tabList!.tabs : <Tab>[];


              if(tabs!.isEmpty){return Expanded(child: Container(color: Colors.transparent,));}

               return ListView.builder(itemCount: tabs.length ,itemBuilder: (context,index){
                 Tab i=tabs[index];
                 return Dismissible(
                     key: ValueKey(i.id),
                     direction: DismissDirection.endToStart,
                     onDismissed: (_) {
                       Future.microtask(() {
                         context.read<BackendBloc>().add(deleteTab(i));
                       });
                     },
                     child: InkWell(
                       child:Container(child: Text(
                         i.tabName,
                         style: TextStyle(fontSize: 20,color: Colors.white),
                       ),
                         decoration: BoxDecoration(color: Colors.white24,borderRadius: BorderRadius.circular(20),border: Border.all(color: Colors.white,width: 2)),
                         padding: EdgeInsets.all(10),
                         alignment: Alignment.center,
                         margin: EdgeInsets.only(bottom: 10),
                       ),
                       onTap:(){
                         context.read<BackendBloc>().add(loadPage(i));
                         Navigator.pop(context);;
                       },
                       onLongPress: (){
                         return editTab(i, context);
                       },
                     )
                 );
               });
            }
            )
        ),
        ElevatedButton(onPressed: (){
            return addTabWidget(context);
          },
          child:Text("add Tab",style: TextStyle(fontSize: 20,color: Colors.white)),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            side: BorderSide(color: Colors.white,width: 2)
          ),
        )
      ],

    )),
  );
}