import 'package:either_dart/either.dart';

import '../../../../common/service_locator/service_locator.dart';
import '../../../../common/utils/failure.dart';
import '../../data/addtodorepositery_impl.dart';
import '../../presentation/ui/component/task_category.dart';
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
}
