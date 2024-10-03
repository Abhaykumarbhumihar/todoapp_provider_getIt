import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../common/values/app_color.dart';
import '../../../../addtask/domain/entities/add_task_model.dart';




class TaskGroupHeader extends StatelessWidget {
  final AddTaskModel task;

  const TaskGroupHeader({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime currentDate = DateTime.now();
    DateTime? taskDate;
    String headerText;

    if (task.date.isEmpty) {
      headerText = "No Date";
    } else {
      try {
        taskDate = DateTime.parse(task.date);
        if (taskDate.year == currentDate.year &&
            taskDate.month == currentDate.month &&
            taskDate.day == currentDate.day) {
          headerText = "Today";
        } else if (taskDate.year == currentDate.year &&
            taskDate.month == currentDate.month &&
            taskDate.day == currentDate.day + 1) {
          headerText = "Tomorrow";
        } else {
          headerText = DateFormat('EEE, MMM d, yyyy').format(taskDate);
        }
      } catch (e) {
        headerText = "Invalid Date";
      }
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child:
          Text(headerText, style: TextStyle(color: AppColor.appSubTextColor)),
    );
  }
}
