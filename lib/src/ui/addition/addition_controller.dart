import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_example/src/core/getX/base_controller.dart';

class AdditionController extends BaseController {
//  final AuthRepository _authRepository = Get.find();

  final TextEditingController _controllerTextTask = TextEditingController();

  TextEditingController get controllerTextTask => _controllerTextTask;

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  late CollectionReference collectionReference;

  var firebaseUser = FirebaseAuth.instance.currentUser;

//  final HomeController _controller = Get.put(HomeController());

  // void saveDate(String task) async {
  //   collectionReference = firebaseFirestore.collection("taskData");
  //   await collectionReference.add({"data": task, "userId": firebaseUser?.uid});
  //   // Get.to(HomeController(), arguments: {
  //   //   "replacementTask" : "List"
  //   // });
  //   Get.back();
  // }

  void list() async {
    try {
      showProgress();
      // DO LOGIN
      // await _authRepository.login();
      hideProgress();
    } catch (err) {
      handleError(err);
    }
  }

// void transitTask() {
//   final DetailController _controller = Get.put(DetailController());
//   _controller.replacementFlag = "List";
// }

}

// @override
// void onInit(){
//   super.onInit();
//   //controllerTextTask = TextEditingController();
//   collectionReference = firebaseFirestore.collection("taskData");
// }
