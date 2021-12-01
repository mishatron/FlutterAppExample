import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_example/src/core/getX/base_controller.dart';
import 'package:get/get.dart';

class TaskAddDateController extends BaseController {
  final TextEditingController _controllerTextDate = TextEditingController();
  TextEditingController get controllerTextDate => _controllerTextDate;

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  late CollectionReference collectionReference;

  var firebaseUser = FirebaseAuth.instance.currentUser;

  void saveDate(String task, String dateTask) async {
    collectionReference = firebaseFirestore.collection("taskData");
    await collectionReference
        .add({"task": task, "dateTask": dateTask, "userId": firebaseUser?.uid});
    Get.back();
    Get.back();
  }
}

/// ===== uid юзера
/// var firebaseUser = FirebaseAuth.instance.currentUser;
