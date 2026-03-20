import 'package:flutter/material.dart' hide Tab;
import 'package:memory_v2/AlarmBloc/alarm_bloc.dart';
import 'alarm_Api/alramRunner.dart';
import 'database/memoryDb.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'backend/backend_bloc.dart';
import 'pages/Tab.dart';
import 'NotificationApi/notification.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:android_intent_plus/android_intent.dart';
import 'dart:io';

import 'database/alarmCount.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (await Permission.notification.isDenied) {
    await Permission.notification.request();
  }

  await memoryDb.init();
  await NotifitaionApi.init();
  await alarmCounter.init();

  await AlramRunner.init(); // initialize once

  runApp(
      MultiBlocProvider(providers: [
        BlocProvider(create: (_) => BackendBloc()),
        BlocProvider(create: (_) => AlarmBloc()),

      ], child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TabWidget(),
      ))
  );

}
