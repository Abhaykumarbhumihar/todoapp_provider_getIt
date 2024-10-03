import 'package:either_dart/either.dart';

import '../../../../common/utils/failure.dart';
import '../../../addtask/domain/entities/add_task_model.dart';
import '../repositery/all_todo_list_repositery.dart';

class AllTodoListUseCase{
  AllTodoListRepositery _allTaskListRepositery;
  AllTodoListUseCase(this._allTaskListRepositery);

  Future<Either<Failure, List<AddTaskModel>>>getTaskList()async{
    return await _allTaskListRepositery.getTodoTaskList();
  }

}