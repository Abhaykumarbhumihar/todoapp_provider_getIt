import 'package:flutter/material.dart';

import '../values/app_color.dart';

InputDecoration customInputDecoration({
  required String hintText,
  Color hintTextColor = Colors.white38,
  Color enabledBorderColor = Colors.cyan,
  Color focusedBorderColor = Colors.cyan,
  double enabledBorderWidth = 1.0,
  double focusedBorderWidth = 2.0,
  EdgeInsetsGeometry contentPadding = const EdgeInsets.symmetric(vertical: 5),
  bool isDense = true,
  double fontSize = 14.0,
}) {
  return InputDecoration(
    isDense: isDense,
    hintText: hintText,
    hintStyle: TextStyle(
      color: hintTextColor,
      fontSize: fontSize,
      fontFamily: "Poppins Medium",
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide:
          BorderSide(color: enabledBorderColor, width: enabledBorderWidth),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide:
          BorderSide(color: focusedBorderColor, width: focusedBorderWidth),
    ),
    border: UnderlineInputBorder(
      borderSide: BorderSide(color: enabledBorderColor),
    ),
    contentPadding: contentPadding,
  );
}
Widget title({BuildContext? context, String? title, double? screenWidth}) {
  return Text(
    "$title",
    style: TextStyle(
      color: AppColor.appSubTextColor,
      fontSize: screenWidth! * 0.04,
      fontFamily: 'Poppins Medium',
    ),
  );
}