import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_example/router/route_paths.dart';
import 'package:flutter_app_example/src/core/getX/base_controller.dart';
import 'package:flutter_app_example/src/data/repositories/auth/auth_repository.dart';
import 'package:get/get.dart';

class ProfileController extends BaseController {
  final AuthRepository _authRepository = Get.find();

  final TextEditingController _controllerPhone = TextEditingController();

  TextEditingController get controllerPhone => _controllerPhone;
  final TextEditingController _controllerFirstName = TextEditingController();

  TextEditingController get controllerFirstName => _controllerFirstName;
  final TextEditingController _controllerLastName = TextEditingController();

  TextEditingController get controllerLastName => _controllerLastName;
  final TextEditingController _controllerEmail = TextEditingController();

  TextEditingController get controllerEmail => _controllerEmail;

  String name = "Vitalii"; // "Vitalii";
  String testText = "";

  void setName() async {
    controllerFirstName.text = name;
  }

  void profile() async {
    try {
      showProgress();
      // DO LOGIN
      // await _authRepository.login();
      print("1----" + testText);
      Timer(Duration(seconds: 1), () {
        hideProgress();
      });
    } catch (err) {
      handleError(err);
    }
  }

  void logout() async {
    showProgress();
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAllNamed(rootRoute);
      hideProgress();
    }
    catch(err){
      handleError(err);
    }
  }
}
