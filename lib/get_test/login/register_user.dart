//
// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter/services.dart';
// import "package:get/get.dart";
// import 'package:project_get/counter_page.dart';
// import 'package:project_get/firebase/firebase_controller.dart';
// import 'package:project_get/home_page/my_home_page.dart';
// import 'package:project_get/login/login_screen.dart';
// import 'package:project_get/shared_preferences/shared_defoult.dart';
//
// class RegisterUserScreen extends GetWidget<FirebaseController> {
//
//   static const routeName = '/register_user';
//   final TextEditingController _controllerFirstName = TextEditingController();
//   final TextEditingController _controllerLastName = TextEditingController();
//   final TextEditingController _controllerEmail = TextEditingController();
//   final TextEditingController _controllerPhone = TextEditingController();
//
//   var _prefs = SharedPreferencesHelper();
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
//                   height: 50,
//                   width: 50,
//                 ),
//               ),
//               SizedBox(height: 10.0),
//               Container(padding: EdgeInsets.only(left: 30, right: 30),
//                 child: TextField(
//                   controller: _controllerFirstName,
//                   inputFormatters: [LengthLimitingTextInputFormatter(9)],
//                   keyboardType: TextInputType.text,
//                   decoration: new InputDecoration(
//                       border: new OutlineInputBorder(),
//                       hintText: '   input first name',
//                       helperText: 'Keep it short, this is just a demo.',
//                       labelText: 'FirstName',
//                       prefixIcon: const Icon(Icons.assignment_ind_rounded, color: Colors.lightBlue,),
// //                      prefixText: codeCountryPhone,
//                       suffixText: 'FN',
//                       suffixStyle: const TextStyle(color: Colors.red)),
//                 ),
//               ),
//               SizedBox(height: 10.0),
//               Container(padding: EdgeInsets.only(left: 30, right: 30),
//                 child: TextField(
//                   controller: _controllerLastName,
//                   inputFormatters: [LengthLimitingTextInputFormatter(9)],
//                   keyboardType: TextInputType.text,
//                   decoration: new InputDecoration(
//                       border: new OutlineInputBorder(),
//                       hintText: '   input last name',
//                       helperText: 'Keep it short, this is just a demo.',
//                       labelText: 'LastName',
//                       prefixIcon: const Icon(Icons.assignment_ind, color: Colors.lightBlue,),
// //                      prefixText: codeCountryPhone,
//                       suffixText: 'LN',
//                       suffixStyle: const TextStyle(color: Colors.red)),
//                 ),
//               ),
//               SizedBox(height: 20.0),
//               Container(
//                 padding: EdgeInsets.only(left: 30, right: 30),
//                 child: TextField(
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
//               SizedBox(height: 20.0),
//               Container(padding: EdgeInsets.only(left: 30, right: 30),
//                 child: TextField(
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
// //                  _prefs.setLogin('isLogin');
//                   registerUser();
//                 },
//                 child: Icon(Icons.login),
//               ),
//               SizedBox(height: 10.0),
//               ElevatedButton(
//                 onPressed: () async {
//                   var transitLogin = await _prefs.setLogin('isLogin');
//                   if(transitLogin) {
//                     Get.to(MyHomePage());
//                   }
//                   //Get.to(LoginScreen());
//                 },
//                 child: Text('ПРОПУСТИТЬ'),
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                     Get.to(CounterPage());
//                   },
//                 child: Text('COUNTER CUBIT'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   void registerUser(){
//     controller.registerUser(_controllerFirstName.text, _controllerLastName.text, _controllerEmail.text, _controllerPhone.text);
//   }
// }