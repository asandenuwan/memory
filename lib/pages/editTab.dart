import 'package:flutter_bloc/flutter_bloc.dart';

import '../database/tabrow.dart';
import 'package:flutter/material.dart' hide Tab;
import '../backend/backend_bloc.dart';
void editTab(Tab t,BuildContext context){
  showDialog(context: context, builder: (context){
    TextEditingController c= TextEditingController();
    c.text=t.tabName;
    return AlertDialog(
      title: Text("Edit tabs"),
      content: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          spacing: 20,
          mainAxisSize: .min,
          children: [
            TextField(
              controller: c,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: "Tab name"
              ),
            ),
            Row(children: [
              ElevatedButton(onPressed: (){
                t.tabName=c.text;
                context.read<BackendBloc>().add(updateTab(tab: t));
                Navigator.pop(context);
              }, child: Text("Enter")),
              ElevatedButton(onPressed: (){
                Navigator.pop(context);
              }, child: Text("Close"))
            ],mainAxisSize: .max,spacing: 20,)
          ],
        ),
      ),
    );
  });
}