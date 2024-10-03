import 'package:flutter/material.dart';

import '../../../../../common/values/app_color.dart';
import 'TaskGroupHeader.dart';

class TaskItem extends StatelessWidget {
  final AddTaskModel task;

  const TaskItem({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(value: false, onChanged: (val) {}),
      title:
          Text(task.title, style: TextStyle(color: AppColor.appTitleTextColor)),
      subtitle: Text(task.date.isNotEmpty ? task.date : 'No Date',
          style: TextStyle(color: AppColor.appSubTextColor)),
      contentPadding: const EdgeInsets.all(8.0),
      tileColor: AppColor.backgroundContainerColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    );
  }
}
