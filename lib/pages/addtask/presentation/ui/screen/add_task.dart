import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
              Consumer<AddTaskProvider>(
                builder: (context, provider, child) {
                  return provider.isDateSet ? TimeField() : SizedBox.shrink();
                },
              ),
              SizedBox(height: screenHeight * 0.1),
              AddToListComponent()
            ]),
          ),
        ),
      ),
      floatingActionButton: Consumer<AddTaskProvider>(
        builder: (context, provider, child) {
          return FloatingActionButton(
            onPressed: () {
              if(provider.taskName.isEmpty){
                print("Task name is mandatory");
              }else{
                context.read<AddTaskProvider>().addTask(provider.taskName);
              }

            },
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
          );
        },
      ),
    ));
  }
}
