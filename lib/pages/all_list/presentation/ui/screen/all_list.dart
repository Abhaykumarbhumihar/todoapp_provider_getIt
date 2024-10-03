import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:todo_app_provider_getit/pages/all_list/presentation/ui/component/task_list.dart';

import '../../../../../common/app_component/component.dart';
import '../../../../../common/responsive/screenUtils.dart';
import '../../../../../common/values/app_color.dart';
import '../component/appbar.dart';

class AllList extends StatelessWidget {
  AllList({super.key});

  TextEditingController taskNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double screenWidth = ScreenUtils.width(context);
    double screenHeight = ScreenUtils.height(context);

    return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: AppColor.backgroundColor,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(ScreenUtils.height(context) * 0.1),
          child: const AppBarComponent()),
      body: SizedBox(
        width: screenWidth,
        height: screenHeight,
        child: Stack(
          children: <Widget>[
            SizedBox(
              width: screenWidth,
              height: screenHeight,
              child: const TaskList(),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.only(
                    bottom: 10, left: 10, right: 10, top: 10),
                color: AppColor.appBarColor,
                child: Row(
                  children: <Widget>[
                    Icon(
                      FontAwesomeIcons.microphone,
                      color: Colors.white,
                      size: screenWidth * 0.06,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      flex: 1,
                      child: TextField(
                        controller: taskNameController,
                        onChanged: (value) {
                          if (value.isEmpty) {
                            print("EMPTY EMPTY");
                          } else {}
                        },
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
                    AnimatedOpacity(
                      opacity: 1.0,
                      duration: Duration(seconds: 2),
                      child: IconButton(
                          onPressed: () {
                            var id = DateTime.now()
                                .millisecondsSinceEpoch
                                .toString();
                            print("ID save at add time is  == $id");
                          },
                          icon: Icon(
                            FontAwesomeIcons.check,
                            color: Colors.white,
                            size: screenWidth * 0.06,
                          )),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: screenHeight * 0.08),
        child: FloatingActionButton(
          onPressed: () {},
          mini: true,
          backgroundColor: Colors.white,
          foregroundColor: Colors.white,
          elevation: 6.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(screenWidth),
          ),
          tooltip: 'Add Item',
          child: const Icon(
            Icons.add,
            color: AppColor.backgroundColor,
          ),
        ),
      ),
    ));
  }
}
