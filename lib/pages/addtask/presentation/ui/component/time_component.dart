import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_provider_getit/pages/addtask/presentation/povider/add_task_provider.dart';

import '../../../../../common/app_component/component.dart';
import '../../../../../common/responsive/screenUtils.dart';

class TimeField extends StatelessWidget {
  const TimeField({
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
                controller: provider.timeController,
                enabled: false,
                style: _inputTextStyle(screenWidth),
                decoration: customInputDecoration(
                  isDense: true,
                  hintText: provider.isTimeSet
                      ? provider.time
                      : "Time not set (all day)",
                ),
              ),
            ),
            const SizedBox(width: 10),
            IconButton(
              onPressed: () {
                _selectTime(context, provider);
              },
              icon: Icon(
                FontAwesomeIcons.clock,
                color: Colors.white,
                size: screenWidth * 0.06,
              ),
            ),
            if (provider.isTimeSet)
              IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  _clearTime(provider,context);
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

  Future<void> _selectTime(
      BuildContext context, AddTaskProvider provider) async {
    final TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (time != null) {
      provider.time = "${time.hour}:${time.minute}";

      context.read<AddTaskProvider>().timeController.text = provider.time;
      provider.isTimeSet = true; // Set the flag to indicate time is selected
    }
  }

  void _clearTime(AddTaskProvider provider,BuildContext context) {
    context.read<AddTaskProvider>().timeController.clear();
    provider.isTimeSet = false;
    provider.time = "";
  }
}
