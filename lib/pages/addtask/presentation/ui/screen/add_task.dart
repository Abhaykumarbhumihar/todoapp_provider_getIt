import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../../../../common/app_component/component.dart';
import '../../../../../common/responsive/screenUtils.dart';
import '../../../../../common/values/app_color.dart';
import '../../povider/add_task_provider.dart';
import '../component/duedate_componet.dart';
import '../component/task_category.dart';
import '../component/task_title_component.dart';
import '../component/time_component.dart';

class AddTask extends StatelessWidget {
  AddTask({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = ScreenUtils.width(context);
    double screenHeight = ScreenUtils.height(context);

    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColor.backgroundColor,
      body: SizedBox(
        width: screenWidth,
        height: screenHeight,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(children: <Widget>[
              const TaskTitleComponent(),
              SizedBox(height: screenHeight * 0.1),
              const DueDateField(),
              context.read<AddTaskProvider>().isDateSet
                  ? const TimeField()
                  : const SizedBox.shrink(),
              SizedBox(height: screenHeight * 0.1),
              AddToListComponent()
            ]),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 6.0,
        mini: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(screenWidth),
        ),
        tooltip: 'Add Item',
        child: const Icon(
          Icons.check,
          color: Colors.white,
        ),
      ),
    ));
  }
}
