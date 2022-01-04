import 'package:attendance/page1.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import 'attmodel.dart';


late Box<AttendenceModel>DBbox;
Future<void> main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if(!Hive.isAdapterRegistered(1))
  {
    Hive.registerAdapter(AttendenceModelAdapter());
  }
  DBbox= await Hive.openBox<AttendenceModel>('name');
  runApp(MyApp());
}
class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Page1(),
    );
  }
}