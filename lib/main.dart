import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_provider_getit/pages/addtask/presentation/povider/add_task_provider.dart';
import 'package:todo_app_provider_getit/pages/addtask/presentation/ui/screen/add_task.dart';
import 'package:todo_app_provider_getit/pages/all_list/presentation/ui/screen/all_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AddTaskProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AddTask(),
      ),
    );
  }
}
