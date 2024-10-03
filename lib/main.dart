import 'package:flutter/material.dart';
import 'package:todo_app_provider_getit/pages/all_list/presentation/ui/screen/all_list.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AllList(),
    );
  }
}
