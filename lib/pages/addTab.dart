import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide Tab;
import 'package:flutter_bloc/flutter_bloc.dart';
import '../backend/backend_bloc.dart';

import "../database/tabrow.dart";

void addTabWidget(BuildContext  context){
  final c=TextEditingController();
  showDialog(context: context,
    builder: (context){
      return AlertDialog(
        title: Text("New Tab"),
        content: TextField(
          controller: c,
          decoration: InputDecoration(
              hintText: "Enter tab name",
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
          ),
        ),
        actions: [
          Row(children: [
            TextButton(onPressed: () => Navigator.pop(context), child: Row(children: [Icon(Icons.clear),Text("cancel")],)),

            TextButton(onPressed: (){
              final name = c.text.trim();
              if (name.isNotEmpty) {
                final t = Tab();
                t.tabName = name;
                context.read<BackendBloc>().add(addNewTab(t));
              }
              Navigator.pop(context);
            }, child: Row(children: [Icon(Icons.add),Text("Ok")],))
          ],
          mainAxisSize: .max,mainAxisAlignment: .spaceBetween,)
        ],

      );
  });
}