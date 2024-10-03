import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:todo_app_provider_getit/pages/all_list/presentation/ui/component/task_item.dart';

import 'TaskGroupHeader.dart';

class TaskList extends StatelessWidget {
  const TaskList({Key? key}) : super(key: key);

  bool _isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  @override
  Widget build(BuildContext context) {
    List<AddTaskModel> tasks = [
      AddTaskModel(id: '1', date: '2024-10-01', title: 'Buy groceries'),
      AddTaskModel(id: '2', date: '2024-10-02', title: 'Morning meeting'),
      AddTaskModel(id: '3', date: '', title: 'No date task'),
      AddTaskModel(id: '4', date: '2024-10-03', title: 'Doctor Appointment'),
    ];
    return GroupedListView<AddTaskModel, String>(
      elements: tasks,
      groupBy: (task) {
        if (task.date.isEmpty) return "No Date";
        try {
          return DateFormat('yyyy-MM-dd').format(DateTime.parse(task.date));
        } catch (e) {
          return "Invalid Date";
        }
      },
      groupHeaderBuilder: (task) {
        return TaskGroupHeader(task: task);
      },
      itemBuilder: (context, task) {
        return TaskItem(task: task);
      },
      order: GroupedListOrder.ASC,
    );
  }
}
