import 'package:flutter/material.dart'hide Tab;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memory_v2/database/jobrow.dart';
import '../backend/backend_bloc.dart';

void editJobWidget(BuildContext  context,Job job){
  TextEditingController title=TextEditingController();
  TextEditingController Disc=TextEditingController();

  title.text=job.title;
  Disc.text=job.discription;

  showDialog(context: context,builder: (context){
    return AlertDialog(
      title: Text("Add new Job"),
      content:
      Container(

        child: Column(
          mainAxisSize: .min,
          mainAxisAlignment: .center,
          spacing: 20,
          children: [
            TextField(
              controller: title,
              textAlign: .center,
              decoration: InputDecoration(
                  hintText: "Enter the Job",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
              ),
            ),
            TextField(
              controller: Disc,
              textAlign: .left,
              decoration: InputDecoration(
                  hintText: "discription",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
              ),
              keyboardType: TextInputType.multiline,
              maxLines: 10,
            ),
            Row(children: [
              ElevatedButton(
                  onPressed: (){
                    job.title=title.text;
                    job.discription=Disc.text;
                    context.read<BackendBloc>().add(updateJob(job));
                    Navigator.pop(context);
                  },
                child: Text("ENTER")),

                ElevatedButton(
                    onPressed: (){
                      Navigator.pop(context);
                    }, child: Text("cencel"))
            ],

             mainAxisAlignment: .spaceBetween,mainAxisSize: .max,)
          ],
        ),

      ) ,
    );
  });
}