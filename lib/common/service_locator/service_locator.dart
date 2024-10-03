import 'package:get_it/get_it.dart';
import 'package:todo_app_provider_getit/common/local_storage/hive/hive_helper.dart';
import 'package:todo_app_provider_getit/pages/all_list/data/all_todo_list_repo_impl.dart';

import '../../pages/addtask/data/addtodorepositery_impl.dart';
import '../../pages/addtask/domain/repositery/addtodotepositery.dart';
import '../../pages/addtask/domain/usecase/add_task_use_case.dart';
import '../../pages/all_list/domain/repositery/all_todo_list_repositery.dart';
import '../../pages/all_list/domain/usecase/all_todo_list_usecase.dart';

final GetIt getIt = GetIt.instance;

void setUpServiceLocator() {
  getIt.registerLazySingleton<HiveHelper>(() => HiveHelper());
  getIt.registerLazySingleton<AddTodoRepositery>(() => AddTodoRepositeryImpl());
  getIt.registerLazySingleton<AddTodoUseCase>(
      () => AddTodoUseCase(getIt<AddTodoRepositery>()));

  getIt.registerLazySingleton<AllTodoListRepositery>(()=>AllTodoListRepositeryImpl());
  getIt.registerLazySingleton<AllTodoListUseCase>(()=>AllTodoListUseCase(getIt<AllTodoListRepositery>()));

}
