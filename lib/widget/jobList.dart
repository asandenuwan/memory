import 'package:flutter/material.dart' hide Tab;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memory_v2/backend/backend_bloc.dart';
import 'package:memory_v2/widget/card.dart';
import '../database/jobrow.dart';

class Joblist extends StatefulWidget {

   Joblist({super.key});

  @override
  State<Joblist> createState() => _JoblistState();
}

class _JoblistState extends State<Joblist> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BackendBloc,BackendState>(builder: (content,snapshot){
      List<Job> jobs;
      if(snapshot is MailBox){

        jobs=snapshot.currentPage!.jobs!.toList();

        print(jobs.length);

        if(jobs.length==0){return Container(
          alignment: Alignment.center,
          color: Colors.transparent,
          child: Text(
            "No Jobs",
            style: TextStyle(
              color: Colors.green.shade200,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
        );}

        return ListView(
          children: jobs.map((i){return card(job: i,tab: snapshot.currentPage!.Ctab,);}).toList(),
        );
      }
      return Container(child: Text("MailBox empty"),alignment: .center);
    });
  }
}
