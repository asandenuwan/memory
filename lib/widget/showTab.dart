
import 'package:flutter/material.dart' hide Tab;
import '../database/jobrow.dart';

String weekDayName(int n) {
  switch (n) {
    case 1:
      return "Monday";
    case 2:
      return "Tuesday";
    case 3:
      return "Wednesday";
    case 4:
      return "Thursday";
    case 5:
      return "Friday";
    case 6:
      return "Saturday";
    case 7:
      return "Sunday";
    default:
      return "Invalid day";
  }
}

void showTab(Job J,BuildContext context){
   showDialog(context: context, builder: (context)=>AlertDialog(
        title: Container(child:Text(J.title)),
        content: Container(
          margin: EdgeInsets.symmetric(vertical: 20),
          child: Column(

            mainAxisSize: .min,
            crossAxisAlignment: .start,
            spacing: 10,

            children: [
              Text("discription"),

              Container(
                height: 200,
                child:Text(J.discription),
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 1,color: Colors.grey)
              ),
              width: .maxFinite,
              padding: EdgeInsets.all(10),),

              Text("Date of added"),

              Container(child:Text("Date:${J.addedDay.year}/${J.addedDay.month}/${J.addedDay.day}\n"
                  "Time:${J.addedDay.hour}:${J.addedDay.minute}:${J.addedDay.second}\n"
                  "${weekDayName(J.addedDay.weekday)} \ntimezone: ${J.addedDay.timeZoneName}"),
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 1,color: Colors.grey)
              ),
              width: .maxFinite,
              padding: EdgeInsets.all(10))
            ],
          ),
        ),
      )
     );
}