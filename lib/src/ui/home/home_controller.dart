
import 'package:flutter_app_example/models/task_model.dart';
import 'package:flutter_app_example/src/core/getX/base_controller.dart';
import 'package:flutter_app_example/src/data/repositories/task/task_repository.dart';
import 'package:get/get.dart';

class HomeController extends BaseController {
  final TaskRepository _taskRepository = Get.find();

  RxList<ListTask> list = <ListTask>[].obs;

  @override
  void onInit() {
    list.bindStream(_taskRepository.getData());
    super.onInit();
  }

  void home() async {
    try {
      showProgress();
      // DO LOGIN
      // await _authRepository.login();
      hideProgress();
    } catch (err) {
      handleError(err);
    }
  }
}