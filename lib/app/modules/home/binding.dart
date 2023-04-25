import 'package:farmmobile/app/modules/crops/controller.dart';
import 'package:get/get.dart';
import 'package:farmmobile/app/data/providers/task/provider.dart';
import 'package:farmmobile/app/modules/home/controller.dart';

import '../../data/services/storage/repository.dart';


class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => HomeController(
        taskRepository: TaskRepository(
          taskProvider: TaskProvider(),
        ),
      ),
    );

    Get.lazyPut(()=> CropsController());
  }
}
