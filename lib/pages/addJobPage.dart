import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memory_v2/styles/decaration.dart';

import '../backend/backend_bloc.dart';
import '../database/jobrow.dart';
import '../widget/alarmTypeWidgets.dart';
import '../AlarmBloc/alarm_bloc.dart';
import 'package:flutter/material.dart' hide Tab;

import 'Tab.dart';

class addJobPage extends StatefulWidget {
  addJobPage({super.key});

  @override
  State<addJobPage> createState() => _addJobPageState();
}

class _addJobPageState extends State<addJobPage> {
  TextEditingController title = TextEditingController();
  TextEditingController Disc = TextEditingController();
  bool isAlarmOn = false;
  int pageOfAlarm = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        flexibleSpace: Container(
          decoration: decaration.TitleAppBar(),
        ),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        centerTitle: true,
        title:Text(
        "Add Job",
        style: fontStyle.Header(),
      ),
      ),
      body: Container(
        margin: .symmetric(vertical: 20),
        padding: .all(10),
        child: Scrollbar(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: .max,
              spacing: 20,
              children: [
                // note: vvvv discription and title container ;
                Container(
                  padding: .symmetric(vertical: 10, horizontal: 20),
                  child: Column(
                    spacing: 10,

                    children: [
                      Text("Title", style: TextStyle(fontSize: 20)),

                      TextField(
                        decoration: decaration.TitleInput(),
                        textAlign: .center,
                        controller: title,
                      ),

                      Text("Description", style: TextStyle(fontSize: 20)),

                      TextField(
                        keyboardType: TextInputType.multiline,
                        maxLines: 10,
                        decoration: decaration.DescriptionInput(),
                        controller: Disc,
                      ),
                    ],
                  ),
                  decoration: decaration.InputContainers(),
                ),

                // note: vvvv alarm cantainer ;
                Container(
                  padding: .symmetric(vertical: 10, horizontal: 20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: isAlarmOn,
                            onChanged: (x) {
                              setState(() {
                                isAlarmOn = x!;
                              });
                            },
                          ),
                          Text("set Alarm"),
                        ],
                      ),
                      isAlarmOn ? Container(
                              child: Column(
                                spacing: 10,
                                children: [
                                  Row(
                                    mainAxisSize: .max,
                                    mainAxisAlignment: .spaceBetween,
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            pageOfAlarm = 0;
                                          });
                                        },
                                        child: Text("specific"),
                                        style: decaration.AlarmSelectingBtn(pageOfAlarm,0),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            pageOfAlarm = 1;
                                          });
                                        },
                                        child: Text("weekly"),
                                        style: decaration.AlarmSelectingBtn(pageOfAlarm,1),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            pageOfAlarm = 2;
                                          });
                                        },
                                        child: Text("interval"),
                                        style: decaration.AlarmSelectingBtn(pageOfAlarm,2),
                                      ),
                                    ],
                                  ),
                                  // Note:container stack and of deference time setup
                                  if (pageOfAlarm == 0)
                                    specificTimer()
                                  else if (pageOfAlarm == 1)
                                    weeklyTimer()
                                  else
                                    intervalTimer(),
                                ],
                              ),
                            )
                          : SizedBox.shrink(),
                    ],
                  ),
                  decoration: decaration.InputContainers(),
                ),

                // note: vvvvv done or clear button ;
                Row(
                  mainAxisSize: .max,
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    Expanded(
                      child:  ElevatedButton(
                      onPressed: () {
                        context.read<AlarmBloc>().add(unSetAlarm());
                        Navigator.pop(context);
                        Navigator.push(context, MaterialPageRoute(builder: (context){return TabWidget();}));
                      },
                      child: Text("Back"),
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.red),
                        foregroundColor: WidgetStatePropertyAll(Colors.white),
                        textStyle: WidgetStatePropertyAll(
                          TextStyle(fontSize: 25),
                        ),
                      ),
                    ),flex: 2,),

                    Expanded(child: ElevatedButton(
                      onPressed: () {
                        Job j = Job();
                        j.title = title.text;
                        j.discription = Disc.text;

                        if(context.read<AlarmBloc>().state is SettedAlarm){
                          SettedAlarm a=context.read<AlarmBloc>().state as SettedAlarm;
                          a.alarm.title=title.text;
                          context.read<BackendBloc>().add(addNewJobAndAlarm(job: j, alarm: a.alarm));

                        }else{context.read<BackendBloc>().add(addNewJob(job: j));}

                        context.read<AlarmBloc>().add(unSetAlarm());
                        Navigator.pop(context);
                        Navigator.push(context, MaterialPageRoute(builder: (context){return TabWidget();}));
                      },
                      child: Text(" Add "),
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.green),
                        foregroundColor: WidgetStatePropertyAll(Colors.white),
                        textStyle: WidgetStatePropertyAll(
                          TextStyle(fontSize: 25),
                        ),
                      ),
                    ),flex: 3,),

                  ],
                ),
              ],
            ),
          ),
        ),
        color: Colors.transparent,
      ),
      backgroundColor: Colors.grey.shade200
      ,
    );
  }
}
