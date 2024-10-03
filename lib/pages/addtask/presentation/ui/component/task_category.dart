import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'package:todo_app_provider_getit/pages/addtask/presentation/povider/add_task_provider.dart';

import '../../../../../common/app_component/component.dart';
import '../../../domain/entities/category.dart';


class AddToListComponent extends StatelessWidget {
  const AddToListComponent({super.key});




  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;

    return Consumer<AddTaskProvider>(
      builder: (context, provider, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            title(
              context: context,
              screenWidth: screenWidth,
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
                      value: provider.selectedCategory,
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
                      items: provider.categoryList.map((TaskCategory item) {
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
                          debugPrint('Selected category: ${newValue.categoryName}');
                          provider.selectedCategory=newValue;
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
      },
    );
  }

  void _showDialog(BuildContext context,) {
    final TextEditingController textController = TextEditingController();

    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: const Text('New List'),
          content: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: CupertinoTextField(
              controller: textController,
              placeholder: 'Enter List Name',
            ),
          ),
          actions: [
            CupertinoDialogAction(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            CupertinoDialogAction(
              child: const Text('Add'),
              onPressed: () {
                final String inputText = textController.text;
                context.read<AddTaskProvider>().addCategory(inputText);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
