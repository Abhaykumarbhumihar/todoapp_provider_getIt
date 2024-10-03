import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../common/responsive/screenUtils.dart';
import '../../../../../common/values/app_color.dart';
class AppBarAddTodo extends StatelessWidget {

  const AppBarAddTodo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = ScreenUtils.width(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      width: screenWidth,
      height: ScreenUtils.height(context) * 0.1 - ScreenUtils.height(context) * 0.014,
      decoration: BoxDecoration(
        color: AppColor.appBarColor,
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
              const Icon(
                CupertinoIcons.arrow_left,
                color: Colors.white,
              ),
              SizedBox(width: screenWidth * 0.08),
              Text(
                "New Task",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Poppins SemiBold',
                  fontSize: screenWidth * 0.04,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}