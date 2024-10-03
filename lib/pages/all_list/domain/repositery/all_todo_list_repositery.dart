import 'package:either_dart/either.dart';
import 'package:todo_app_provider_getit/common/utils/failure.dart';

import '../../../addtask/domain/entities/add_task_model.dart';

abstract class AllTodoListRepositery{
  Future<Either<Failure,List<AddTaskModel>>>getTodoTaskList();
  //Future<dynamic>getCategory();

}