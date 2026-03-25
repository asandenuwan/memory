import 'package:flutter/material.dart' hide Tab;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memory_v2/backend/backend_bloc.dart';
import 'package:memory_v2/styles/decaration.dart';
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

        return Container(
          child: Column(
            children: [
              Container(
                height: 100,
                padding: EdgeInsets.all( 10),
                child: Column(
                  mainAxisAlignment: .spaceEvenly,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        Text("Progress",style: fontStyle.NormalFontStyle(false),),
                        Container(child: Text("${snapshot.currentPage?.doneJob}/${jobs.length} done",style: fontStyle.NormalFontStyle(false)),)
                      ],
                    ),
                    LinearProgressIndicator(
                      value: snapshot.currentPage!.doneJob/jobs.length,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        Text("${snapshot.currentPage!.doneJob} completed",style: fontStyle.NormalFontStyle(false)),
                        Text("${jobs.length - snapshot.currentPage!.doneJob} remaining",style: fontStyle.NormalFontStyle(false))
                      ],
                    )
                  ],
                ),
                decoration:  decaration.summaryCard(),
              ),
             Expanded(
                 child:  ListView.builder(
               itemCount: jobs.length,
               itemBuilder: (context, index) {
                 return TweenAnimationBuilder(
                   tween: Tween<Offset>(begin: Offset(0, 0.05), end: Offset.zero),
                   duration: Duration(milliseconds: 2),
                   curve: Curves.easeOut,
                   builder: (context, offset, child) {
                     return FractionalTranslation(
                       translation: offset,
                       child: Opacity(
                         opacity: 1 - offset.dy / 0.3,
                         child: child,
                       ),
                     );
                   },
                   child: card(
                     job: jobs[index],
                     tab: snapshot.currentPage!.Ctab,
                   ),
                 );
               },
             ))
            ],),
        );
      }
      return Container(child: Text("MailBox empty"),alignment: .center);
    });
  }
}
