import 'package:flutter_app_example/src/core/getX/base_controller.dart';
import 'package:flutter_app_example/src/data/repositories/auth/auth_repository.dart';
import 'package:get/get.dart';

class LoginController extends BaseController {
  final AuthRepository _authRepository = Get.find();

  void login() async {
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
