import 'package:either_dart/either.dart';
import '../../../../common/utils/failure.dart';
import '../entities/add_task_model.dart';
import '../entities/category.dart';
import '../repositery/addtodotepositery.dart';

class AddTodoUseCase {
  final AddTodoRepositery _addTaskRepositery;

  AddTodoUseCase(this._addTaskRepositery);

  Future<Either<Failure, void>> addCategory(TaskCategory category) async {
    return await _addTaskRepositery.addCategory(category);
  }

  Future<Either<Failure, List<TaskCategory>>> getCategory() async {
    return await _addTaskRepositery.getCategory();
  }

  Future<Either<Failure, void>> addTask(AddTaskModel addTaskModel) async {
    return await _addTaskRepositery.addTask(addTaskModel);
  }
}
