import 'package:either_dart/either.dart';
import 'package:todo_app_provider_getit/common/utils/failure.dart';
import '../entities/add_task_model.dart';
import '../entities/category.dart';

abstract class AddTodoRepositery{
  Future<Either<Failure,void>> addCategory(TaskCategory category);
  Future<Either<Failure,List<TaskCategory>>>getCategory();
  Future<Either<Failure,void>> addTask(AddTaskModel addTaskModel);

}