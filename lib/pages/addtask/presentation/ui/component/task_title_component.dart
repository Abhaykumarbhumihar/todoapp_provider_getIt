import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_provider_getit/pages/addtask/presentation/povider/add_task_provider.dart';

import '../../../../../common/app_component/component.dart';
import '../../../../../common/responsive/screenUtils.dart';

class TaskTitleComponent extends StatelessWidget {
  const TaskTitleComponent({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = ScreenUtils.width(context);
    double screenHeight = ScreenUtils.height(context);

    return Consumer<AddTaskProvider>(
      builder: (context, provider, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            title(
              context: context!,
              screenWidth: screenWidth!,
              title: "What is to be done?",
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: provider.taskNameController,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth * 0.04,
                      fontFamily: "Poppins Medium",
                    ),
                    onChanged: (value) {
                      provider.taskName = value;
                    },
                    decoration: customInputDecoration(
                      isDense: true,
                      hintText: "Enter Quick Task Here",
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Icon(
                  FontAwesomeIcons.microphone,
                  color: Colors.white,
                  size: screenWidth * 0.06,
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
