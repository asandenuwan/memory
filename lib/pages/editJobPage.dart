import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memory_v2/styles/decaration.dart';
import '../backend/backend_bloc.dart';
import '../AlarmBloc/alarm_bloc.dart';
import '../database/jobrow.dart';
import '../widget/alarmTypeWidgets.dart';
import 'Tab.dart';

class editJobPage extends StatefulWidget {
  late Job job;
  editJobPage({required this.job,super.key});

  @override
  State<editJobPage> createState() => _editJobPageState();
}

class _editJobPageState extends State<editJobPage> {
  int AlarmTypeFlag=0;// this use to navigate between alarm containers
  TextEditingController title=TextEditingController();
  TextEditingController Disc=TextEditingController();
  bool isAlarmDeleted=false;
  bool isAlarmOn=false;
  @override
  void initState() {
    title.text=widget.job.title;
    Disc.text=widget.job.discription;
    context.read<AlarmBloc>().add(editJobGetAlarm(job: widget.job));
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Title(
          color: Colors.black,
          child: Text(
            "Edit Job name",
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

                BlocBuilder<AlarmBloc,AlarmState>(builder: (context,state){
                  if(state is editJobSettedAlarm){
                    return Container(
                      padding: .all(10),
                      child: Row(
                        children: [
                            Container(
                              child: Text("${state.type}\n${state.Date}"),
                            ),
                            FloatingActionButton(
                              onPressed: (){
                                isAlarmDeleted=true;
                                context.read<AlarmBloc>().add(unSetAlarm());
                              },
                              child: Icon(Icons.delete),
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.redAccent,

                            ),
                          ],
                        mainAxisSize: .max,
                        mainAxisAlignment: .spaceBetween,
                      ),
                      decoration: decaration.InputContainers(),//fixme exiting alarm card
                    );
                  }else{
                    return alarm(widget.job);
                  }
                }),
                // note: vvvvv done or clear button ;

                Row(
                  mainAxisSize: .max,
                  mainAxisAlignment: .spaceBetween,
                  children: [

                    Expanded(
                        flex: 2,
                        child: ElevatedButton(
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
                        )
                    ),

                    Expanded(
                      flex: 3,
                        child: ElevatedButton(
                      onPressed: () {
                        widget.job.title=title.text;
                        widget.job.discription=Disc.text;
                        updateJob func=updateJob(job: widget.job,isAlarmDeleted: isAlarmDeleted); // note state
                        if(context.read<AlarmBloc>().state is SettedAlarm){
                          debugPrint("new alarm added---------------");
                          SettedAlarm X=context.read<AlarmBloc>().state as  SettedAlarm;
                          func.alarm=X.alarm;
                          func.alarm?.title=title.text;
                          debugPrint("${X.alarm.AlarmId}");
                        }
                        context.read<BackendBloc>().add(func);
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
                    ))

                  ],
                ),
              ],
            ),
          ),
        ),
        color: Colors.white,
      ),
      backgroundColor: Colors.white,
    );;
  }

  Widget alarm(Job j){
    return Container(
        child:Column(
          children: [
            Row(
              mainAxisAlignment: .spaceEvenly,
              children: [
                Text("Add alarm",style: TextStyle(fontSize: 15,fontWeight: .bold),),
                Checkbox(value: isAlarmOn, onChanged: (bool? i){
                  setState(() {
                    isAlarmOn=i!;
                  });
                }
            )
            ]),
            if(isAlarmOn) Column(
              spacing: 10,
                children: [
                  Row(children: [
                    ElevatedButton(onPressed: (){setState(() {
                        AlarmTypeFlag=0;
                      });},
                      child: Text("Specific"),
                      style: decaration.AlarmSelectingBtn(AlarmTypeFlag,0),
                    ),
                    ElevatedButton(onPressed: (){setState(() {
                          AlarmTypeFlag=1;
                        });},
                        child: Text("weekly"),
                        style: decaration.AlarmSelectingBtn(AlarmTypeFlag,1)),
                    ElevatedButton(
                        onPressed: (){setState(() {
                          AlarmTypeFlag=2;
                        });},
                        child: Text("interval"),
                        style: decaration.AlarmSelectingBtn(AlarmTypeFlag,2)
                    )
                  ],
                    mainAxisAlignment: .spaceAround,),
                  if(AlarmTypeFlag==0)specificTimer()
                  else if(AlarmTypeFlag==1) weeklyTimer()
                  else intervalTimer()
                ],
              )
            else Container()

          ],
        ),
      decoration: decaration.InputContainers(),
      padding: EdgeInsets.symmetric(horizontal: 20),
    );
  }

}

