import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_provider_getit/pages/addtask/presentation/povider/add_task_provider.dart';

import '../../../../../common/app_component/component.dart';
import '../../../../../common/responsive/screenUtils.dart';

class DueDateField extends StatelessWidget {
  const DueDateField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = ScreenUtils.width(context);

    return Consumer<AddTaskProvider>(
      builder: (context, provider, child) {
        return Row(
          children: <Widget>[
            Expanded(
              child: TextField(
                controller: provider.dueDateController,
                enabled: false,
                style: _inputTextStyle(screenWidth),
                decoration: customInputDecoration(
                  isDense: true,
                  hintText:
                      provider.isDateSet ? provider.dueDate : "Date not set",
                ),
              ),
            ),
            const SizedBox(width: 10),
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                _selectDate(context, provider);
              },
              icon: Icon(
                FontAwesomeIcons.calendarDay,
                color: Colors.white,
                size: screenWidth * 0.06,
              ),
            ),
            if (provider.isDateSet)
              IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  _clearDate(provider, context);
                },
                icon: Icon(
                  FontAwesomeIcons.circleXmark,
                  color: Colors.white,
                  size: screenWidth * 0.06,
                ),
              ),
          ],
        );
      },
    );
  }

  TextStyle _inputTextStyle(double screenWidth) {
    return TextStyle(
      color: Colors.white,
      fontSize: screenWidth * 0.04,
      fontFamily: "Poppins Medium",
    );
  }

  Future<void> _selectDate(
      BuildContext context, AddTaskProvider provider) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null) {
      provider.dueDate = picked.toString();
      provider.isDateSet = true;
      provider.dueDateController.text =
          picked.toString();
    }
  }

  void _clearDate(
    AddTaskProvider provider,
    BuildContext context,
  ) {
    provider.dueDateController.clear();
    provider.dueDate = "";
    provider.isDateSet = false;
    provider.isTimeSet = false;
    provider.time = "";
    provider.timeController.clear();
  }
}
