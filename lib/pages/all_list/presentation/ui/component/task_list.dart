import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:todo_app_provider_getit/pages/all_list/presentation/ui/component/task_item.dart';

import '../../../../addtask/domain/entities/add_task_model.dart';
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
