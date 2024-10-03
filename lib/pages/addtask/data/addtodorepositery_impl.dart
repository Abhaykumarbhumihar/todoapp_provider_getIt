import 'package:either_dart/either.dart';
import 'package:flutter/foundation.dart';
import 'package:todo_app_provider_getit/pages/addtask/presentation/ui/component/task_category.dart';

import '../../../common/local_storage/hive/hive_helper.dart';
import '../../../common/service_locator/service_locator.dart';
import '../../../common/utils/failure.dart';
import '../domain/entities/category.dart';
import '../domain/repositery/addtodotepositery.dart';

class AddTodoRepositeryImpl extends AddTodoRepositery{
  final HiveHelper _hiveHelper=getIt<HiveHelper>();

  @override
  Future<Either<Failure,void>> addCategory(TaskCategory category)async {
    try {
      await _hiveHelper.addData("category", category);
      return Right(null);
    } catch (e) {
      return Left(Failure("Failed to add category: $e"));
    }
  }

  @override
  Future<Either<Failure,dynamic>> getCategory()async {
    try {
      final category =await _hiveHelper.getAllData<TaskCategory>("category");
      if(category.isNotEmpty){
        return Right(category);
      }else{
        return Left(Failure("No category data found"));
      }
    } catch (e) {
      return Left(Failure("Failed to get category: $e"));
    }
  }

}