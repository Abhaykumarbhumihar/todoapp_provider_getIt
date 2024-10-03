import 'package:either_dart/either.dart';
import 'package:todo_app_provider_getit/common/utils/failure.dart';

import '../../presentation/ui/component/task_category.dart';
import '../entities/category.dart';

abstract class AddTodoRepositery{
  Future<Either<Failure,void>> addCategory(TaskCategory category);
  Future<Either<Failure,List<TaskCategory>>>getCategory();
}