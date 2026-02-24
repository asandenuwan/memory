import 'package:flutter/material.dart'hide Tab;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memory_v2/database/jobrow.dart';
import '../backend/backend_bloc.dart';

void addJobWidget(BuildContext  context){
  TextEditingController title=TextEditingController();
  TextEditingController Disc=TextEditingController();
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("Add new Job"),
        content: SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: title,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: "Enter the Job",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: Disc,
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: "description",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Job j = Job();
                      j.title = title.text;
                      j.discription = Disc.text;
                      context.read<BackendBloc>().add(addNewJob(job: j));
                      Navigator.pop(context);
                    },
                    child: Text("ENTER"),
                  ),
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text("CANCEL"),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    },
  );
}