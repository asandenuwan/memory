import 'package:flutter_bloc/flutter_bloc.dart';

import '../backend/backend_bloc.dart';
import '../database/jobrow.dart';
import '../widget/alarmTypeWidgets.dart';
import '../AlarmBloc/alarm_bloc.dart';
import 'package:flutter/material.dart';

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
        title: Title(
          color: Colors.black,
          child: Text(
            "Add Job",
            style: TextStyle(
              fontSize: 30,
              fontWeight: .bold,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        centerTitle: true,
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
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          fillColor: Colors.orangeAccent,
                          filled: true,
                        ),
                        textAlign: .center,
                        controller: title,
                      ),

                      Text("Description", style: TextStyle(fontSize: 20)),

                      TextField(
                        keyboardType: TextInputType.multiline,
                        maxLines: 10,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          fillColor: Colors.white70,
                          filled: true,
                        ),
                        controller: Disc,
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 1),
                    color: Colors.yellowAccent.shade100,
                  ),
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
                                        style: ButtonStyle(
                                          backgroundColor: (pageOfAlarm == 0)
                                              ? WidgetStatePropertyAll(
                                                  Colors.green,
                                                )
                                              : WidgetStatePropertyAll(
                                                  Colors.blueGrey,
                                                ),
                                          foregroundColor:
                                              WidgetStatePropertyAll(
                                                Colors.white,
                                              ),
                                          textStyle: WidgetStatePropertyAll(
                                            TextStyle(fontSize: 15),
                                          ),
                                        ),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            pageOfAlarm = 1;
                                          });
                                        },
                                        child: Text("weekly"),
                                        style: ButtonStyle(
                                          backgroundColor: (pageOfAlarm == 1)
                                              ? WidgetStatePropertyAll(
                                                  Colors.green,
                                                )
                                              : WidgetStatePropertyAll(
                                                  Colors.blueGrey,
                                                ),
                                          foregroundColor:
                                              WidgetStatePropertyAll(
                                                Colors.white,
                                              ),
                                          textStyle: WidgetStatePropertyAll(
                                            TextStyle(fontSize: 15),
                                          ),
                                        ),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            pageOfAlarm = 2;
                                          });
                                        },
                                        child: Text("interval"),
                                        style: ButtonStyle(
                                          backgroundColor: (pageOfAlarm == 2)
                                              ? WidgetStatePropertyAll(
                                                  Colors.green,
                                                )
                                              : WidgetStatePropertyAll(
                                                  Colors.blueGrey,
                                                ),
                                          foregroundColor:
                                              WidgetStatePropertyAll(
                                                Colors.white,
                                              ),
                                          textStyle: WidgetStatePropertyAll(
                                            TextStyle(fontSize: 15),
                                          ),
                                        ),
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
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 1),
                    color: Colors.yellowAccent.shade100,
                  ),
                ),

                // note: vvvvv done or clear button ;
                Row(
                  mainAxisSize: .max,
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Job j = Job();
                        j.title = title.text;
                        j.discription = Disc.text;

                        if(context.read<AlarmBloc>().state is SettedAlarm){
                          SettedAlarm a=context.read<AlarmBloc>().state as SettedAlarm;
                          context.read<BackendBloc>().add(addNewJobAndAlarm(job: j, alarm: a.alarm));
                          context.read<BackendBloc>().add(loadAlarm(alarm: a.alarm));

                        }else{context.read<BackendBloc>().add(addNewJob(job: j));}

                        context.read<AlarmBloc>().add(unSetAlarm());
                        Navigator.pop(context);
                      },
                      child: Text(" Add "),
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.green),
                        foregroundColor: WidgetStatePropertyAll(Colors.white),
                        textStyle: WidgetStatePropertyAll(
                          TextStyle(fontSize: 25),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context.read<AlarmBloc>().add(unSetAlarm());
                        Navigator.of(context).pop();
                      },
                      child: Text("Clear"),
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.red),
                        foregroundColor: WidgetStatePropertyAll(Colors.white),
                        textStyle: WidgetStatePropertyAll(
                          TextStyle(fontSize: 25),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        color: Colors.white,
      ),
      backgroundColor: Colors.white,
    );
  }
}
