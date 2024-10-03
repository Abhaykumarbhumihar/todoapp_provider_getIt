import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../common/app_component/component.dart';
import '../../../../../common/responsive/screenUtils.dart';
import '../../../../../common/values/app_color.dart';
import '../component/task_category.dart';

class AddTask extends StatelessWidget {
  AddTask({super.key});

  TextEditingController? taskNameController = TextEditingController();
  TextEditingController? dueDateController = TextEditingController();
  TextEditingController? timeController = TextEditingController();

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
          child: Column(children: <Widget>[
            /*add titile of todo-task view */
            Column(
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
                        controller: taskNameController,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth * 0.04,
                          fontFamily: "Poppins Medium",
                        ),
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
            ),
            SizedBox(height: screenHeight * 0.1),
            Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: dueDateController,
                    enabled: false,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth! * 0.04,
                      fontFamily: "Poppins Medium",
                    ),
                    decoration: customInputDecoration(
                      isDense: true,
                      hintText: "Date not set",
                    ),
                  ),
                ),
                SizedBox(width: 10),
                IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    icon: Icon(
                      FontAwesomeIcons.calendarDay,
                      color: Colors.white,
                      size: screenWidth * 0.06,
                    )),
                IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    icon: Icon(
                      FontAwesomeIcons.circleXmark,
                      color: Colors.white,
                      size: screenWidth * 0.06,
                    ))
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: timeController,
                    enabled: false,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth! * 0.04,
                      fontFamily: "Poppins Medium",
                    ),
                    decoration: customInputDecoration(
                      isDense: true,
                      hintText: "Time not set (all day)",
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      FontAwesomeIcons.clock,
                      color: Colors.white,
                      size: screenWidth * 0.06,
                    )),
                IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    icon: Icon(
                      FontAwesomeIcons.circleXmark,
                      color: Colors.white,
                      size: screenWidth * 0.06,
                    ))
              ],
            ),
            SizedBox(height: screenHeight * 0.1),
            AddToListComponent(
              selectedCategory: null, // Or pass a selected TaskCategory object
              addNewListClick: () {
                print("Add New List clicked!");
              },
            )
          ]),
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
