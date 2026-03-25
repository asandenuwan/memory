import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import '../AlarmBloc/alarm_bloc.dart';
import '../database/alarmRow.dart';

class specificTimer extends StatefulWidget {
  const specificTimer({super.key});

  @override
  State<specificTimer> createState() => _specificTimerState();
}

class _specificTimerState extends State<specificTimer> {
  TextEditingController year=TextEditingController();
   int month=0;
   int day=0;
   int hour=0;
   int min=0;
   int sec=0;

  @override
  void initState() {
    super.initState();
    year.text = DateTime.now().year.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        spacing: 10,
        mainAxisSize: .max,
        children: [
          Row(
            spacing: 10,
            mainAxisSize: .max,
            children: [
              Expanded(child: TextField(
                controller: year,
                decoration: InputDecoration(
                  hintText: "year",
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white
                ),
              ),
              ),

              Expanded(
                  child:
                  DropdownButtonFormField<int>(
                  items: List.generate(12,(i){
                    i++;
                    return DropdownMenuItem(child: Text(i.toString()),value: i);
                  }),
                  onChanged: (i){month=i!;},
                  hint: Text("mm"),

                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white
                  )
              )),

              Expanded(
                  child:DropdownButtonFormField<int>(
                  items: List.generate(31,(i){
                    i++;
                    return DropdownMenuItem(child: Text(i.toString()),value: i);
                  }
                  ),
                  onChanged: (i){day=i!;},
                  decoration: InputDecoration(
                    hint: Text("dd"),
                    border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white
                  )
              )
              ),
            ],
          ),
          Row(
            spacing: 10,
            mainAxisSize: .max,
            children: [
              Expanded(child:DropdownButtonFormField<int>(
                  items: List.generate(24,(i){
                    String label=i.toString();
                    if(i>12){
                      label=(i-12).toString();
                    }
                    return DropdownMenuItem(child: Text(label),value: i);
                  }),
                  onChanged: (i){hour=i!;},
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "hh",
                      filled: true,
                      fillColor: Colors.white
                  )
              )),
              Expanded(child:DropdownButtonFormField<int>(
                  items: List.generate(60,(i){
                    return DropdownMenuItem(child: Text(i.toString()),value: i);
                  }),
                  onChanged: (i){min=i!;},
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "mm",
                      filled: true,
                      fillColor: Colors.white
                  )
              )),
              Expanded(child:DropdownButtonFormField<int>(
                  items: List.generate(60,(i){
                    return DropdownMenuItem(child: Text(i.toString()),value: i);
                  }),
                  onChanged: (i){sec=i!;},
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "ss",
                      filled: true,
                      fillColor: Colors.white
                  )
              )),
            ],
          ),
          SizedBox(height: 20,),
          // note: specificTimer set btn
          FloatingActionButton(onPressed: (){

            if(int.parse(year.text)<=0 || month==0 || day ==0){
              print("null alarm");
              return;
            }
            Alarm alarm=Alarm();
            alarm.type='s';
            alarm.year=int.parse(year.text);
            alarm.month=month;
            alarm.day=day;
            alarm.H=hour;
            alarm.M=min;
            alarm.S=sec;

            context.read<AlarmBloc>().add(setAlarm(alarm: alarm));

          },child: Icon(Icons.save),backgroundColor: Colors.orange,foregroundColor: Colors.white,)
        ],
      ), 
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10)
        )
    );
  }
}

// =====================================================================================================

class WeekDayModel {
  final String name;
  bool isSelected=false;

  WeekDayModel(this.name);
}
// ======================================================================================================

class weeklyTimer extends StatefulWidget {
  const weeklyTimer({super.key});

  @override
  State<weeklyTimer> createState() => _weeklyTimerState();
}

class _weeklyTimerState extends State<weeklyTimer> {
   late List<WeekDayModel> weekDay;
   int hour=0;
   int min=0;
   int sec=0;

  @override
  void initState(){
    super.initState();
    weekDay=[WeekDayModel('Mon'),WeekDayModel('Tue'),WeekDayModel('Wed'),WeekDayModel('Thu'),WeekDayModel('Fri'),WeekDayModel('Sat'),WeekDayModel('Sun')];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        spacing: 10,
        children: [
          Row(
            children: List.generate(7, (int l){
              return Column(
                children: [
                  Checkbox(
                    value: weekDay[l].isSelected,
                    onChanged: (bool? x){
                      setState(() {
                        weekDay[l].isSelected=x??false;
                      });
                    }
                  ),
                  Text(weekDay[l].name)
                ],
                mainAxisSize: .max,
              );
              },)
            ),
          Row(
            spacing: 10,
            children: [
              Expanded(
                  child: DropdownButtonFormField(
                      items: List.generate(24, (i){
                        String label=i.toString();
                        if(i>12){
                          label=(i-12).toString();
                        }
                       return DropdownMenuItem(value: i,child: Text(label),);
                      }
                      ), onChanged: (i){setState(() {
                        hour=i??0;
                      });},
                  hint: Text("hh"),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder()
                      ),
                      borderRadius: BorderRadius.circular(10))
              ),
              Expanded(
                  child: DropdownButtonFormField(
                      items: List.generate(60, (i){
                        return DropdownMenuItem(value: i,child: Text(i.toString()),);
                      }
                      ), onChanged: (i){setState(() {
                    min=i??0;
                  });
                  },
                  hint: Text("mm"),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder()
                      ),
                      borderRadius: BorderRadius.circular(10))
              ),
              Expanded(
                  child: DropdownButtonFormField(
                      items: List.generate(60, (i){
                        return DropdownMenuItem(value: i,child: Text(i.toString()),);
                      }
                      ), onChanged: (i){setState(() {
                    sec=i??0;
                  });},
                  hint: Text("sec"),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder()
                  ),
                  borderRadius: BorderRadius.circular(10)
                  )
              )
            ],
          ),
          SizedBox(height: 20,),
          FloatingActionButton(
            onPressed: (){
              Alarm alarm=Alarm();
              alarm.type='w';
              alarm.H=hour;
              alarm.M=min;
              alarm.S=sec;
              alarm.repeat=true;
              alarm.weekDays=List.generate(7, (i){return weekDay[i].isSelected;});

              context.read<AlarmBloc>().add(setAlarm(alarm: alarm));
            },
            child: Icon(Icons.save),
            foregroundColor: Colors.white,
            backgroundColor: Colors.orange,
          )
        ],
      ),
    );
  }
}

// ======================================================================================================

class intervalTimer extends StatefulWidget {
   intervalTimer({super.key});
  int hours=0;
   int min=0;
   int sec=0;
  @override
  State<intervalTimer> createState() => _intervalTimerState();
}

class _intervalTimerState extends State<intervalTimer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        spacing: 10,
        mainAxisSize: .min,
        children: [
          Row(
            spacing: 10,
            children: [
            Expanded(child: DropdownButtonFormField<int>(
                items:  List.generate(24, (int l){
                  return DropdownMenuItem(
                    child: Text(l.toString()),
                    value: l,
                  );
                }),
                onChanged: (int? val){
                  widget.hours=val??0;
                },
              hint: Text("hh"),
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder()
              )
              )
            ),
            Expanded(child: DropdownButtonFormField<int>(
                items:  List.generate(60, (int l){
                  return DropdownMenuItem(
                    child: Text(l.toString()),
                    value: l,
                  );
                }),
                onChanged: (int? val){
                  widget.min=val??0;
                },
              hint: Text('mm'),
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                border: OutlineInputBorder()
              )
            )
            ),Expanded(child: DropdownButtonFormField<int>(
                items:  List.generate(60, (int l){
                  return DropdownMenuItem(
                    child: Text(l.toString()),
                    value: l,
                  );
                }),
                onChanged: (int? val){
                  widget.sec=val??0;
                },
              hint: Text("ss"),
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                border: OutlineInputBorder()
              )
            )
            )
          ],),
          SizedBox(height: 20,),
          FloatingActionButton(onPressed: (){

            if(widget.hours ==0 && widget.min==0 && widget.sec==0){
              print("Alarm empty");
              return;
            }

            Alarm alarm=Alarm();
            alarm.type='i';
            alarm.H=widget.hours;
            alarm.M=widget.min;
            alarm.S=widget.sec;
            context.read<AlarmBloc>().add(setAlarm(alarm: alarm));

          },
            child: Icon(Icons.save),
            foregroundColor: Colors.white,
            backgroundColor: Colors.orange,
          )
        ],
      ),
    );
  }
}
