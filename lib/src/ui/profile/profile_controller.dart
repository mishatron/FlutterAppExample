/// ==== bez RX =====
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_app_example/models/user_model.dart';
// import 'package:flutter_app_example/router/route_paths.dart';
// import 'package:flutter_app_example/src/core/getX/base_controller.dart';
// import 'package:flutter_app_example/src/data/repositories/user/user_repository.dart';
// import 'package:get/get.dart';
//
// class ProfileController extends BaseController {
//   final TextEditingController controllerPhone = TextEditingController();
//   final TextEditingController controllerFirstName = TextEditingController();
//   final TextEditingController controllerLastName = TextEditingController();
//   final TextEditingController controllerEmail = TextEditingController();
//
//
//
//   String email = "";
//
//   UserRepository repository = Get.find();
//   UserModel _user = UserModel();
//
//   UserModel get user => _user;
//
//   set user(UserModel user) {
//     _user = user;
//     update();
//   }
// //  Rx<UserModel> user = Rx<UserModel>();
//
//   @override
//   void onInit() async {
//     super.onInit();
//     showContentProgress();
//     user = await repository.getUserData();
//     hideContentProgress();
//
//     print(FirebaseAuth.instance.currentUser!.uid);
//   }
//
//   void setDataUserParameters() async {
//     await repository.setUserData("pOWAWeYV6AcrFFapBdW5U1Yus7R2");
//   }
//
//   void logout() async {
//     showProgress();
//     try {
//       await FirebaseAuth.instance.signOut();
//       Get.offAllNamed(rootRoute);
//       hideProgress();
//     } catch (err) {
//       handleError(err);
//     }
//   }
// }

/// ==== RX Stream =====
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_example/models/user_model.dart';
import 'package:flutter_app_example/router/route_paths.dart';
import 'package:flutter_app_example/src/core/getX/base_controller.dart';
import 'package:flutter_app_example/src/data/repositories/user/user_repository.dart';
import 'package:get/get.dart';

class ProfileController extends BaseController {
  final TextEditingController controllerPhone = TextEditingController();
  final TextEditingController controllerFirstName = TextEditingController();
  final TextEditingController controllerLastName = TextEditingController();
  final TextEditingController controllerEmail = TextEditingController();

  String email = "";

  UserRepository repository = Get.find();
  Rx<UserModel> _user = UserModel().obs;

  UserModel get user => _user.value;

  @override
  void onInit() async {
    _user.bindStream(repository.streamUserData());
    initListener();
    super.onInit();
  }

  void setDataUserParameters() async {
    showProgress();
    await repository.updateUser(user);
    hideProgress();
  }

  void initListener() {
    controllerEmail.addListener(() {
      _user.value.email = controllerEmail.text.trim();
    });
  }

  void logout() async {
    showProgress();
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAllNamed(rootRoute);
      hideProgress();
    } catch (err) {
      handleError(err);
    }
  }
}
