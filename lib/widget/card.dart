import 'package:flutter/material.dart' hide Tab;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:memory_v2/database/memoryDb.dart';
import 'package:memory_v2/pages/editJobPage.dart';
import 'package:memory_v2/widget/showTab.dart';
import '../database/jobrow.dart';
import '../backend/backend_bloc.dart';
import '../database/tabrow.dart';
import '../styles/decaration.dart';
class card extends StatefulWidget {
   card({super.key, required this.job, required this.tab});

  Job job;
  Tab tab;

  //use flutter BlocBuilder
  @override
  State<card> createState() => _CardState();
}

class _CardState extends State<card> {

  @override
  Widget build(BuildContext context) {
    return Slidable(

    key: ValueKey(widget.job.id),

    endActionPane: ActionPane(
      motion: DrawerMotion(),
        children: [
        SlidableAction(onPressed: (context){
          Navigator.pop(context);
          Navigator.push(context, MaterialPageRoute(builder: (context){return editJobPage(job: widget.job);}));
        },
          backgroundColor: Colors.blueGrey,
            foregroundColor: Colors.white,
            icon: Icons.edit,
            label: 'Edit',
          borderRadius: BorderRadius.circular(10),
        ),
          SlidableAction(onPressed: (context){
            context.read<BackendBloc>().add(deleteJob(job: widget.job, tab: widget.tab));
          },
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
            borderRadius: BorderRadius.circular(10),
          ),
      ]
    ),

    child: GestureDetector(
          child: ListTile(title: Container(
              child: Center(
                  child: Row(
                    mainAxisSize: .max,
                    children: [
                      Container(
                        width: 10,
                        height: 100,
                        decoration: BoxDecoration(
                            borderRadius: .circular(10),
                            color: Colors.blue.shade400
                        ),
                      ),
                      Expanded(child: Row(
                        mainAxisAlignment: .spaceBetween,
                        children: [
                          Checkbox(value: widget.job.isDid,
                            onChanged: (i){
                              widget.job.isDid=i!;
                              context.read<BackendBloc>().add(updateJob(job: widget.job, isAlarmDeleted: false));
                            },
                            side: .none,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(4)),
                            checkColor: Colors.white,
                            fillColor: WidgetStateProperty.resolveWith<Color>((states) {
                              if (states.contains(WidgetState.selected)) {
                                return Colors.green;
                              }
                              return Colors.red;
                            },
                            ),
                          ),
                          Text(
                            widget.job.title,
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 20,
                                fontWeight: .w500
                            ),
                          )],)),
                      SizedBox(width: 10,)
                    ],
                  )
              ),
              decoration: decaration.CardDecaration()
            )
          ),
          onTap: (){
            return showTab(this.widget.job, context);
          },
        ),
    );
  }

}

