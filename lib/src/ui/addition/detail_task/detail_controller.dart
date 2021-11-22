import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app_example/src/core/getX/base_controller.dart';

class DetailController extends BaseController {
//  final AuthRepository _authRepository = Get.find();

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  late CollectionReference collectionReference;

  /// ===== uid юзера
  var firebaseUser = FirebaseAuth.instance.currentUser;

  // void saveTask(String task) async {
  //   collectionReference = firebaseFirestore.collection("taskData");
  //   await collectionReference.add({"data": task, "userId": firebaseUser?.uid});
  //   Get.back();
  // }

}
