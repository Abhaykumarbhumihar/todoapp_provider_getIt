import 'package:flutter/widgets.dart';
import 'package:todo_app_provider_getit/common/service_locator/service_locator.dart';
import 'package:todo_app_provider_getit/pages/all_list/domain/usecase/all_todo_list_usecase.dart';

import '../../../addtask/domain/entities/add_task_model.dart';

class TodoListProvider with ChangeNotifier {
  final AllTodoListUseCase _allTodoListUseCase = getIt<AllTodoListUseCase>();

  List<AddTaskModel> _taskList = [];

  // Getter
  List<AddTaskModel> get taskList => _taskList;

  // Setter
  set taskList(List<AddTaskModel> tasks) {
    _taskList = tasks;
    notifyListeners();
  }

  getTodoList() async {
    final response = await _allTodoListUseCase.getTaskList();
    response.fold((failure) {
      debugPrint(failure.message);
    }, (todolist) {
      taskList = todolist;
    });
  }
}
