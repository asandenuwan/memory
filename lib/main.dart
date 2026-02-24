import 'package:flutter/material.dart' hide Tab;
import 'database/memoryDb.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'backend/backend_bloc.dart';
import 'pages/Tab.dart';

// import 'alarm_Api/alram.dart';
//
// @pragma('vm:entry-point')
// void alarmCallback() {
//   print("-------------------------Alarm fired asan!");
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await memoryDb.init();

  // print("------1");
  //
  // if(await AlramApi.init()){
  //   await AlramApi.stopwotch(d: Duration(seconds: 10,milliseconds: 10), id: 10, callback: alarmCallback);
  // }
  //
  // await AlramApi.init(); // initialize once

  // // schedule a longer alarm for testing
  // await AlramApi.stopwotch(
  //   d: Duration(seconds: 60),
  //   id: 35,
  //   callback: alarmCallback,
  // );

  // print("----------2");

  runApp(
      BlocProvider(
        create: (context) => BackendBloc(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: TabWidget(),
        ),
      )
  );

}
