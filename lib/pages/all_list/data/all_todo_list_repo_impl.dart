import 'package:either_dart/src/either.dart';

import 'package:todo_app_provider_getit/common/utils/failure.dart';

import 'package:todo_app_provider_getit/pages/addtask/domain/entities/add_task_model.dart';

import '../../../common/local_storage/hive/hive_helper.dart';
import '../../../common/service_locator/service_locator.dart';
import '../domain/repositery/all_todo_list_repositery.dart';

class AllTodoListRepositeryImpl extends AllTodoListRepositery {
  final HiveHelper _hiveHelper = getIt<HiveHelper>();
  @override
  Future<Either<Failure, List<AddTaskModel>>> getTodoTaskList() async {
    try {
      final response = await _hiveHelper.getAllData<AddTaskModel>("task");
      if (response.isNotEmpty) {
        return Right(response);
      } else {
        return Left(Failure("No task found"));
      }
    } catch (e) {
      return Left(Failure("Failed to get task list $e"));
    }
  }
}
