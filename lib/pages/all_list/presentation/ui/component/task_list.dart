import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_provider_getit/pages/all_list/presentation/ui/component/task_item.dart';

import '../../../../addtask/domain/entities/add_task_model.dart';
import '../../provider/todo_list_provider.dart';
import 'TaskGroupHeader.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoListProvider>(
      builder: (context, provider, child) {
        return GroupedListView<AddTaskModel, String>(
          elements: provider.taskList,
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
      },
    );
  }
}
