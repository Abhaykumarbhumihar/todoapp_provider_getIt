import 'package:flutter/widgets.dart';

class AddTaskProvider with ChangeNotifier {
  TextEditingController? taskNameController = TextEditingController();
  TextEditingController dueDateController = TextEditingController();
  TextEditingController timeController = TextEditingController();

  String _taskName = '';
  String _dueDate = '';
  String _time = '';
  bool _isDateSet = false;
  bool _isTimeSet = false;

  // Getters
  String get taskName => _taskName;
  String get dueDate => _dueDate;
  String get time => _time;
  bool get isDateSet => _isDateSet;
  bool get isTimeSet => _isTimeSet;

  // Setters
  set taskName(String value) {
    _taskName = value;
    notifyListeners();
  }

  set dueDate(String value) {
    _dueDate = value;
    if (value != "") {
      isDateSet = true;
    } else {
      isDateSet = false;
    }
    notifyListeners();
  }

  set time(String value) {
    _time = value;
    if (value != "") {
      isTimeSet = true;
    } else {
      isTimeSet = false;
    }
    notifyListeners();
  }

  set isDateSet(bool value) {
    _isDateSet = value;
    notifyListeners();
  }

  set isTimeSet(bool value) {
    _isTimeSet = value;

    notifyListeners();
  }
}
