import 'package:get_it/get_it.dart';
import 'package:todo_app_provider_getit/common/local_storage/hive/hive_helper.dart';

import '../../pages/addtask/data/addtodorepositery_impl.dart';
import '../../pages/addtask/domain/repositery/addtodotepositery.dart';
import '../../pages/addtask/domain/usecase/add_task_use_case.dart';

final GetIt getIt = GetIt.instance;

void setUpServiceLocator() {
  getIt.registerLazySingleton<HiveHelper>(() => HiveHelper());
  getIt.registerLazySingleton<AddTodoRepositery>(() => AddTodoRepositeryImpl());
  getIt.registerLazySingleton<AddTodoUseCase>(
      () => AddTodoUseCase(getIt<AddTodoRepositery>()));
}
