//
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter/services.dart';
// import "package:get/get.dart";
// import 'package:project_get/firebase/firebase_controller.dart';
// import 'package:project_get/get_increment/home_controller.dart';
//
// class LoginScreen extends GetWidget<FirebaseController> {
//
//   static const routeName = '/login_screen';
//   final TextEditingController _controllerEmail = TextEditingController();
//   final TextEditingController _controllerPhone = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Theme(
//           data: new ThemeData(
//             primaryColor: Colors.blue,
//             primaryColorDark: Colors.redAccent,
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               ClipOval(
//                 child: Image.asset(
//                   "assets/splash/icon.png",
//                   fit: BoxFit.cover,
//                   height: 150,
//                   width: 150,
//                 ),
//               ),
//               SizedBox(height: 20.0),
//               Container(
//                 padding: EdgeInsets.only(left: 30, right: 30),
//                 child: TextField(
//                   onChanged: (text) {
//                     // setState(() {
//                     //   textInputEmail = text;
//                     //   print("---->>>>> : $text" + myController.text + _controllerEmail.text);
//                     // });
//                   },
//                   controller: _controllerEmail,
// //                  inputFormatters: [LengthLimitingTextInputFormatter(5)],
//                   keyboardType: TextInputType.emailAddress,
//                   decoration: new InputDecoration(
//                       border: new OutlineInputBorder(),
//                       hintText: '  input login',
//                       helperText: 'Keep it short, this is just a demo.',
//                       labelText: 'Login',
//                       prefixIcon: const Icon(Icons.person, color: Colors.lightBlue,),
//                       prefixText: ' ',
//                       suffixText: '@',
//                       suffixStyle: const TextStyle(color: Colors.red)),
//                 ),
//               ),
//               SizedBox(height: 50.0),
//               Container(padding: EdgeInsets.only(left: 30, right: 30),
//                 child: TextField(
//                   onChanged: (text) { },
//                   controller: _controllerPhone,
//                   inputFormatters: [LengthLimitingTextInputFormatter(9)],
//                   keyboardType: TextInputType.phone,
//                   decoration: new InputDecoration(
//                       border: new OutlineInputBorder(),
//                       hintText: '   input phone',
//                       helperText: 'Keep it short, this is just a demo.',
//                       labelText: 'Phone',
//                       prefixIcon: const Icon(Icons.phone, color: Colors.lightBlue,),
// //                      prefixText: codeCountryPhone,
//                       suffixText: '№',
//                       suffixStyle: const TextStyle(color: Colors.red)),
//                 ),
//               ),
//               SizedBox(height: 10.0),
//               ElevatedButton(
//                 onPressed: () {
// //                  loginRegistration();
// //                  controller.initialized == true ? loginUser() : testRegisterUser();
//                   //user != null ? loginUser() : testRegisterUser();
//                   loginUser();
//                 },
//                 child: Icon(Icons.login),
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   Get.to(HomeController());
//                 },
//                 child: Text(' -> GET INCREMENT'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//
//   }
//
//   void loginUser(){
//     controller.login(_controllerEmail.text, _controllerPhone.text);
//   }
//
//   void loginRegistration(){
//     controller.loginRegistration(_controllerEmail.text, _controllerPhone.text);
//   }
//
//
// }





// //import 'dart:html';
//
// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter/services.dart';
// import "package:get/get.dart";
// import 'package:project_get/home_page/my_home_page.dart';
//
// import '../detail_screen.dart';
//
//
// //class LoginScreen extends StatefulWidget {
//   class LoginScreen extends StatefulWidget {
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//
//   TextEditingController _controllerPhone;
//   // final _controllerPhone = TextEditingController();
//   TextEditingController _controllerEmail;
//   // final _controllerEmail = TextEditingController();
//
//   final myController = TextEditingController();
//   String codeCountryPhone = "+380";
//   String textInputPhone = "";
//   String textInputEmail = "";
//   int charPhone = 0;
//
//
//   void initState() {
//     super.initState();
//     _controllerPhone = TextEditingController();
//     _controllerEmail = TextEditingController();
//   }
//
//   void dispose() {
//     _controllerPhone.dispose();
//     _controllerEmail.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Theme(
//           data: new ThemeData(
//             primaryColor: Colors.blue,
//             primaryColorDark: Colors.redAccent,
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               ClipOval(
//                 child: Image.asset(
//                   "assets/splash/icon.png",
//                   fit: BoxFit.cover,
//                   height: 150,
//                   width: 150,
//                 ),
//               ),
//               SizedBox(height: 20.0),
//               Container(
//                 padding: EdgeInsets.only(left: 30, right: 30),
//                 child: TextField(
//                   onChanged: (text) {
//                     setState(() {
//                       textInputEmail = text;
//                       print("---->>>>> : $text" + myController.text + _controllerEmail.text);
//                     });
//                   },
//                   controller: _controllerEmail,
//                   inputFormatters: [LengthLimitingTextInputFormatter(5)],
//                   keyboardType: TextInputType.emailAddress,
//                   decoration: new InputDecoration(
//                       border: new OutlineInputBorder(),
//                       hintText: '  input login',
//                       helperText: 'Keep it short, this is just a demo.',
//                       labelText: 'Login',
//                       prefixIcon: const Icon(Icons.person, color: Colors.lightBlue,),
//                       prefixText: ' ',
//                       suffixText: '@',
//                       suffixStyle: const TextStyle(color: Colors.red)),
//                 ),
//               ),
//               SizedBox(height: 50.0),
//               Container(padding: EdgeInsets.only(left: 30, right: 30),
//                 child: TextField(
//                   onChanged: (text) {
//                     setState(() {
//                       textInputPhone = text;
//                       print("---->>>>> : $text");
//                       charPhone = text.length;
//                       print("%%%%% + $charPhone");
//                     });
//                   },
//                   controller: _controllerPhone,
//                   inputFormatters: [LengthLimitingTextInputFormatter(9)],
//                   keyboardType: TextInputType.phone,
//                   decoration: new InputDecoration(
//                       border: new OutlineInputBorder(),
//                       hintText: '   input phone',
//                       helperText: 'Keep it short, this is just a demo.',
//                       labelText: 'Phone',
//                       prefixIcon: const Icon(Icons.phone, color: Colors.lightBlue,),
//                       prefixText: codeCountryPhone,
//                       suffixText: '№',
//                       suffixStyle: const TextStyle(color: Colors.red)),
//                 ),
//               ),
//               SizedBox(height: 10.0),
//               charPhone == 9 && textInputPhone.isNotEmpty && textInputEmail.isNotEmpty ? ElevatedButton(
//                   onPressed: () {
//                   Get.to(MyHomePage(title: 'testBar'.tr, textInputEmail: textInputEmail, textInputPhone: codeCountryPhone + textInputPhone,));
//                 },
//                 child: Icon(Icons.login),
//               ) : Offstage(),
//               SizedBox(height: 10.0),
//               ElevatedButton(
//                 onPressed: () {
//
//                   // Get.dialog(AlertDialog(
//                   //   title: Text("This should not be closed automatically"),
//                   //   content: Text("This should not be closed automatically"),
//                   //   actions: <Widget>[
//                   //     FlatButton(
//                   //       child: Text("CLOSE"),
//                   //       onPressed: () {
//                   //         Get.back();
//                   //       },
//                   //     ),
//                   //     FlatButton(
//                   //       child: Text("OK"),
//                   //       onPressed: () {
//                   //         Get.back();
//                   //       },
//                   //     )
//                   //   ],
//                   // ),
//                   //   barrierDismissible: false,);
//
//                   Get.defaultDialog(title: "Alert", content: Text("This should not be closed automatically be closed",
//                     textAlign: TextAlign.center,),
//                     backgroundColor: Colors.grey, //.withOpacity(0.9),
//                     radius: 0.0,
// //                    actions: [buttonAlert(), buttonAlert()],
// //                    barrierDismissible: true,
//                     textConfirm: "oK",
//                     confirmTextColor: Colors.black,
// //                    confirm: buttonAlert(),
//                     onConfirm: () async {
//                       Get.back();
//                       showSnackBar();
// //                      await Future.delayed(Duration(seconds: 2));
// //                      Navigator.of(Get.overlayContext).pop();
// //                    Get.back();
//                   },
//                     textCancel: "No",
//                     cancelTextColor: Colors.pink,
//                     buttonColor: Colors.grey, //.withOpacity(0.7),
// //                  cancel: buttonAlert(),
//                   );
//                 },
//                 child: Text('<<--->>'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   void showSnackBar() {
//     Get.snackbar("hello", "get test", snackPosition: SnackPosition.BOTTOM, colorText: Colors.amber,
//         borderRadius: 0.0, margin: EdgeInsets.only(bottom: 5.0,),
//         icon: Icon(Icons.ac_unit),
//         backgroundColor: Colors.indigo.withOpacity(0.7),
//     );
//   }
//
//   Widget buttonAlert() {
//
// //     return OutlineButton(
// //       onPressed: () {
// //         Get.snackbar("hello", "get test", snackPosition: SnackPosition.BOTTOM, colorText: Colors.blue,
// //             borderRadius: 0.0, margin: EdgeInsets.only(bottom: 5.0,),
// //             icon: Icon(Icons.ac_unit));
// // //        Get.back();
// //       },
// //     );
//
//     return OutlineButton(
//       color: Colors.black, child: Text("oK"), shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(18.0),
//         side: BorderSide(color: Colors.red)
//     ),
//         onPressed: () {
//       Get.back();
//     },
//     );
//
//     ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),),
//       onPressed: () {
//         Get.back();
//       },
//       child: Text('Ok'),
//     );
//
//     return ElevatedButton(style: ElevatedButton.styleFrom(
//         primary: Colors.purple,
//         padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//         textStyle: TextStyle(
//             fontSize: 20,
//             fontWeight: FontWeight.bold)),
//       onPressed: () {
//         Get.back();
//       },
//       child: Text('Ok'),
//     );
// }
//
//
// }
