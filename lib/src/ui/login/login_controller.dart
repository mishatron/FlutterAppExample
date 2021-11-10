
import 'package:flutter/material.dart';
import 'package:flutter_app_example/router/route_paths.dart';
import 'package:flutter_app_example/src/core/getX/base_controller.dart';
import 'package:flutter_app_example/src/ui/home/home_screen.dart';
import 'package:flutter_app_example/src/ui/main/main_screen.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends BaseController {

  final TextEditingController _controllerPhone = TextEditingController();
  TextEditingController get controllerPhone => _controllerPhone;
  final TextEditingController _controllerCode = TextEditingController();
  TextEditingController get controllerCode => _controllerCode;
  final FocusNode phoneFocus = FocusNode();
  final FocusNode codeFocus = FocusNode();

  String verificationId = "";
  RxBool showCode = false.obs;
  var auth = FirebaseAuth.instance;

  Future<void> verifyPhone(String phone) async {
    phoneFocus.unfocus();
    showProgress();
    await auth.verifyPhoneNumber(
        timeout: const Duration(seconds: 40),
        phoneNumber: phone,
        verificationCompleted: (AuthCredential authCredential) {
//          auth.signInWithCredential(authCredential);
        },
        verificationFailed: (authException) {
          hideProgress();
          Get.snackbar("error", "problem code");
        },
        codeSent: (String id, [int? resendToken]) {
          hideProgress();
          print(resendToken);
          this.verificationId = id;
          showCode.value = true;
        },
        codeAutoRetrievalTimeout: (id) {
          this.verificationId = id;
          hideProgress();
        });
  }

  void verifyCode(String code) async {
    codeFocus.unfocus();
    showProgress();
    var credential = await auth.signInWithCredential(
        PhoneAuthProvider.credential(
            verificationId: this.verificationId, smsCode: code));
    if (credential.user != null) {

      var uid = credential.user!.uid;

      Get.offAllNamed(mainScreenRoute);
    }
    hideProgress();
  }


  // void login(String phone) async {
  //   try {
  //     showProgress();
  //     hideProgress();
  //   } catch (err) {
  //     handleError(err);
  //   }
  // }

}


