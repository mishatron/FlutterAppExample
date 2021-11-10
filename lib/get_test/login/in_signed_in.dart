// import 'package:project_get/firebase/firebase_controller.dart';
// import 'package:get/get.dart';
// import 'package:flutter/material.dart';
// import 'package:project_get/home_page/my_home_page.dart';
// import 'package:project_get/login/login_screen.dart';
// import 'package:project_get/login/dash_board_screen.dart';
// import 'package:project_get/login/register_user.dart';
// import 'package:project_get/on_boarding/on_boarding_screen.dart';
// import 'package:project_get/shared_preferences/shared_defoult.dart';
// import 'package:project_get/splash/splash_screen.dart';
//
// class InSignedIn extends GetWidget<FirebaseController> {
//
//   @override
//   Widget build(BuildContext context) {
//     return Obx((){
//       return Get.find<FirebaseController>().user != null
//           ? MyHomePage() : LoginScreen(); // RegisterUserScreen(); // // SplashScreenTest();//
//     }
//     );
//   }
//
//   // var _prefs = SharedPreferencesHelper();
//   //
//   // @override
//   // Widget build(BuildContext context) {
//   //
//   //     if(Get.find<FirebaseController>().user != null) {
//   //       Get.to(MyHomePage());
//   //     } else {
//   //       reversSession();
//   //     }
//   //
//   // }
//   //
//   // void reversSession() async {
//   //   var transitLogin = await _prefs.getLogin();
//   //   await Future.delayed(Duration(milliseconds: 6000), () {
//   //     transitLogin == 'isNonLogin' ? Get.to(RegisterUserScreen()) : Get.to(LoginScreen());
//   //   });}
//
//
// }



