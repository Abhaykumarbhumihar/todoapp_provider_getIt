import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../common/app_component/component.dart';

class TaskCategory {
  final String categoryName;
  final int categoryId;

  TaskCategory({required this.categoryName, required this.categoryId});
}

class AddToListComponent extends StatelessWidget {
  final TaskCategory? selectedCategory;

  // Static list of Task Categories
  final List<TaskCategory> dropdownItems = [
    TaskCategory(categoryName: 'Work', categoryId: 1),
    TaskCategory(categoryName: 'Personal', categoryId: 2),
    TaskCategory(categoryName: 'Shopping', categoryId: 3),
    TaskCategory(categoryName: 'Others', categoryId: 4),
  ];

  AddToListComponent({
    Key? key,
    this.selectedCategory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // Example title widget, replace with your actual title widget

        title(
          context: context!,
          screenWidth: screenWidth!,
          title: 'Add to List',
        ),
        Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.only(right: screenWidth * 0.08),
                child: DropdownButton<TaskCategory>(
                  padding: EdgeInsets.zero,
                  isExpanded: true,
                  value: selectedCategory,
                  hint: const Text('Select an item'),
                  dropdownColor: Colors.blueAccent,
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.white,
                    size: screenWidth * 0.06,
                  ),
                  style: const TextStyle(color: Colors.black, fontSize: 20),
                  underline: const SizedBox(),
                  alignment: Alignment.centerLeft,
                  items: dropdownItems.map((TaskCategory item) {
                    return DropdownMenuItem<TaskCategory>(
                      value: item,
                      child: Text(
                        item.categoryName,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Poppins Medium',
                          fontSize: screenWidth * 0.04,
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (TaskCategory? newValue) {
                    if (newValue != null) {
                      print('Selected category: ${newValue.categoryName}');
                    }
                  },
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                _showDialog(context);
              },
              icon: Icon(
                FontAwesomeIcons.outdent,
                color: Colors.white,
                size: screenWidth * 0.07,
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _showDialog(BuildContext context) {
    final TextEditingController textController = TextEditingController();

    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text('New List'),
          content: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: CupertinoTextField(
              controller: textController,
              placeholder: 'Enter List Name',
            ),
          ),
          actions: [
            CupertinoDialogAction(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            CupertinoDialogAction(
              child: Text('Add'),
              onPressed: () {
                final String inputText = textController.text;

                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
