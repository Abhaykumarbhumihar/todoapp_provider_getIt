import 'package:flutter/widgets.dart';
import 'package:todo_app_provider_getit/common/extension/common_extension.dart';
import '../../../../common/service_locator/service_locator.dart';
import '../../domain/entities/add_task_model.dart';
import '../../domain/entities/category.dart';
import '../../domain/usecase/add_task_use_case.dart';

class AddTaskProvider with ChangeNotifier {
  final AddTodoUseCase _addTodoUseCase = getIt<AddTodoUseCase>();
  TextEditingController? taskNameController = TextEditingController();
  TextEditingController dueDateController = TextEditingController();
  TextEditingController timeController = TextEditingController();

  List<TaskCategory> _categoryList = [];
  String _taskName = '';
  String _dueDate = '';
  String _time = '';
  bool _isDateSet = false;
  bool _isTimeSet = false;

  /*selected category */
  TaskCategory? _selectedCategory;

  // Getters
  String get taskName => _taskName;
  String get dueDate => _dueDate;
  String get time => _time;
  bool get isDateSet => _isDateSet;
  bool get isTimeSet => _isTimeSet;
  List<TaskCategory> get categoryList => _categoryList;
  TaskCategory? get selectedCategory => _selectedCategory;

  // Setters

  set selectedCategory(TaskCategory? category) {
    _selectedCategory = category;
    notifyListeners();
  }

  set categoryList(List<TaskCategory> categories) {
    _categoryList = categories;
    notifyListeners();
  }

  set taskName(String value) {
    _taskName = value;
    notifyListeners();
  }

  set dueDate(String value) {
    _dueDate = value;
    if (value != "") {
      isDateSet = true;
      print(isDateSet);
      print("SDF SDF SDF ==== SDF SDF SDF ");
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

  /*add category*/
  addCategory(String categoryName) async {
    var category = TaskCategory(
      categoryName: categoryName,
      categoryId: DateTime.now().generateUniqueId(),
    );

    final response = await _addTodoUseCase.addCategory(category);
    response.fold((failure) {
      debugPrint(failure.message);
    }, (_) {
      getCategoryList();
      notifyListeners();
    });
  }

  /*geting saved category list*/
  getCategoryList() async {
    final data = await _addTodoUseCase.getCategory();
    data.fold((failure) {
      print(failure.message);
    }, (data) {
      categoryList = data;
      notifyListeners();
    });
    print(data);
  }

  /*add task*/

  addTask(String taskName) async {
    TaskCategory taskCategory;
    if (selectedCategory == null) {
      taskCategory = TaskCategory(categoryName: "Default", categoryId: 2);
    } else {
      taskCategory = selectedCategory!;
    }

    final response = await _addTodoUseCase.addTask(AddTaskModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        title: taskName,
        time: time ?? "",
        category: taskCategory,
        date: dueDate ?? ""));

    response.fold((failure) {
      print(failure.message);
    }, (_) {
      print("Task added");
    });
  }
}
