import 'package:flutter/material.dart' hide Tab;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:memory_v2/widget/showTab.dart';
import '../database/jobrow.dart';
import '../backend/backend_bloc.dart';
import '../database/tabrow.dart';
import '../pages/editJob.dart';
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
          return editJobWidget(context, widget.job);
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
              padding: EdgeInsetsGeometry.all(10),
              child: Center(
                  child: Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Checkbox(value: widget.job.isDid,
                        onChanged: (i){
                          widget.job.isDid=i!;
                          context.read<BackendBloc>().add(updateJob(widget.job));
                        },
                        checkColor: Colors.green,
                        fillColor: WidgetStateProperty.resolveWith<Color>((states) {
                          if (states.contains(WidgetState.selected)) {
                            return Colors.black;
                          }
                          return Colors.white;
                        }),
                      ),
                      Text(
                        widget.job.title,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20
                        ),
                      )],)
              ),
              decoration: BoxDecoration(
                  color: Colors.green.shade600,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.blueGrey.shade500,width: 2)
              )),),

          onTap: (){
            return showTab(this.widget.job, context);
          },
        ),
    );
  }

}

