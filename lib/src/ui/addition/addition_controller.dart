import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_example/models/list_model.dart';
import 'package:flutter_app_example/src/core/getX/base_controller.dart';
import 'package:flutter_app_example/src/data/repositories/auth/auth_repository.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AdditionController extends BaseController {
  final AuthRepository _authRepository = Get.find();

  final TextEditingController _controllerTextTask = TextEditingController();

  TextEditingController get controllerTextTask => _controllerTextTask;

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  late CollectionReference collectionReference;
  var firebaseUser = FirebaseAuth.instance.currentUser;

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

  void saveDate(String task) async {
    collectionReference = firebaseFirestore.collection("taskData"); //.doc(firebaseUser.uid);
    await collectionReference.add({"data": task, "userId": firebaseUser?.uid});
  }
}






























// @override
// void onInit(){
//   super.onInit();
//   //controllerTextTask = TextEditingController();
//   collectionReference = firebaseFirestore.collection("taskData");
// }

// void taskAdd() async {
//   try {
//     showProgress();
//     print('---controller--->>> Firebase' + controllerTextTask.text);
//     taskList.add(ListTask(task: controllerTextTask.text));
//     hideProgress();
//   } catch (err) {
//     handleError(err);
//   }
// }