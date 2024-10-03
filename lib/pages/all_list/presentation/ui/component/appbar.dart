import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../../common/values/app_color.dart';

class AppBarComponent extends StatelessWidget {
  const AppBarComponent({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double containerSize = screenWidth * 0.2 - screenWidth * 0.11;

    return Container(
      width: screenWidth,
      height: screenHeight * 0.1 - screenHeight * 0.014,
      decoration: BoxDecoration(
        color: AppColor.appBarColor, // Using AppColor for app bar background
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(left: 10.0),
                width: containerSize,
                height: containerSize,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(containerSize),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Center(
                    child: Image.asset(
                      "assets/images/check.png",
                      color: AppColor.backgroundColor,
                      // Using AppColor
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: screenWidth * 0.06),
                child: DropdownButton<String>(
                  padding: EdgeInsets.zero,
                  isExpanded: false,
                  value: 'Category 1',
                  // Static selected category
                  hint: const Text('Select an item'),
                  dropdownColor: Colors.blueAccent,
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.white,
                    size: screenWidth * 0.1,
                  ),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: screenWidth * 0.03,
                  ),
                  underline: const SizedBox(),
                  alignment: Alignment.centerLeft,
                  items: <DropdownMenuItem<String>>[
                    DropdownMenuItem(
                      value: 'Category 1',
                      child: Text(
                        'Category 1',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Poppins SemiBold',
                          fontSize: screenWidth * 0.04,
                        ),
                      ),
                    ),
                    DropdownMenuItem(
                      value: 'Category 2',
                      child: Text(
                        'Category 2',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Poppins SemiBold',
                          fontSize: screenWidth * 0.04,
                        ),
                      ),
                    ),
                  ],
                  onChanged: (String? newValue) {
                    // Static behavior, no state change
                    print("Selected: $newValue");
                  },
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  print("Search Icon Pressed");
                },
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                  size: screenWidth * 0.1 - screenWidth * 0.018,
                ),
              ),
              PopupMenuButton<String>(
                icon: Icon(
                  FontAwesomeIcons.ellipsisVertical,
                  color: Colors.white,
                  size: screenWidth * 0.1 - screenWidth * 0.018,
                ),
                onSelected: (String value) {
                  print("Selected Menu: $value");
                },
                itemBuilder: (BuildContext context) {
                  return [
                    const PopupMenuItem(
                      value: 'Task Lists',
                      child: Text('Task Lists'),
                    ),
                    const PopupMenuItem(
                      value: 'Settings',
                      child: Text('Settings'),
                    ),
                    const PopupMenuItem(
                      value: 'Send Feedback',
                      child: Text('Send Feedback'),
                    ),
                    const PopupMenuItem(
                      value: 'Follow us',
                      child: Text('Follow us'),
                    ),
                    const PopupMenuItem(
                      value: 'Invite friends',
                      child: Text('Invite friends to the app'),
                    ),
                  ];
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
