import 'package:flutter_app_example/models/task_model.dart';
import 'package:flutter_app_example/src/core/getX/base_controller.dart';
import 'package:flutter_app_example/src/data/repositories/task/task_repository.dart';
import 'package:get/get.dart';

class HomeController extends BaseController {

  TaskRepository repository = Get.find();

  RxList<Task> list = <Task>[].obs;
  String? idRemove;
  late bool notTask = true;

//  late final notTask = true.obs;
//  String replacementFlag = Get.arguments["replacementTask"] ?? "list";
  String replacementFlag = "list";

  @override
  void onInit() async {
//    list.bindStream(TaskRepository.to.getData());
    list.bindStream(repository.getTaskList());
    super.onInit();
  }

  void deleteTask(Task item) async {
       showContentProgress();

    for (var i in list) {
      if (item.id == i.id) {
        await repository.deleteTask(item);
        if (list.isEmpty) {
          notTask = false;
          replacementFlag = "";
        }

        hideContentProgress();
      }
    }

//     idRemove = item.id;
//     showContentProgress();
//     await repository.deleteItem(item);
// //    await TaskRepository.to.deleteItem(item);
//     hideContentProgress();
//     idRemove = null;

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

/// ===== y8AzQ3RtEbdf8guammco7y2nub32 - мой
/// ===== pOWAWeYV6AcrFFapBdW5U1Yus7R2 - asta
///
/// ===== uid юзера var firebaseUser = FirebaseAuth.instance.currentUser;
/// firebaseUser?.uid
///
