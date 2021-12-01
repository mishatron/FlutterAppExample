// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_app_example/resources/colors.dart';
// import 'package:flutter_app_example/resources/styles.dart';
// import 'package:flutter_app_example/src/core/ui/states/base_statefull_screen.dart';
// import 'package:flutter_app_example/src/core/ui/widgets/base_stateful_widget.dart';
// import 'package:flutter_app_example/src/ui/profile/profile_controller.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class ProfileScreen extends BaseStatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return ProfileScreenState();
//   }
// }
//
// class ProfileScreenState
//     extends BaseStatefulScreen<ProfileScreen, ProfileController> {
//   @override
//   ProfileController getController() => ProfileController();
//
//   var auth = FirebaseAuth.instance;
//   String _name = "";
//
//   @override
//   Widget buildBody() {
//     //   controller.setName();
//
//     return controller.contentProgress
//         ? const Offstage()
//         : ListView(
//             padding: EdgeInsets.all(0.0),
//             shrinkWrap: true,
//             children: <Widget>[
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     ClipOval(
//                       child: const Icon(
//                         Icons.account_box,
//                         size: 100.0,
//                       ),
//                     ),
//                     const SizedBox(height: 30.0),
//                     Container(
//                       padding: EdgeInsets.only(left: 10, right: 10),
//                       child: TextField(
//                         enabled: false,
//                         onChanged: (text) {},
//                         controller: controller.controllerPhone,
//                         decoration: InputDecoration(
//                             border: OutlineInputBorder(),
//                             labelText: controller.user.phone,
//                             prefixIcon:
//                                 const Icon(Icons.phone, color: colorAccent),
//                             suffixStyle: const TextStyle(color: Colors.red)),
//                       ),
//                     ),
//                     const SizedBox(height: 10.0),
//                     Container(
//                       padding: EdgeInsets.only(left: 10, right: 10),
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: <Widget>[
//                           Flexible(
//                             child: TextField(
//                               cursorColor: colorAccent,
//                               onChanged: (text) {
//                                 _name = text;
//                               },
//                               controller: controller.controllerFirstName,
//                               inputFormatters: [
//                                 LengthLimitingTextInputFormatter(99)
//                               ],
//                               keyboardType: TextInputType.name,
//                               decoration: getDecoration(
//                                   "input FirstName",
//                                   "",
//                                   controller.user.firstName!,
//                                   "",
//                                   Icons.account_box),
// //                          enabled: controller.user.firstName!.isEmpty ? true : false, //controller.controllerFirstName.text.isEmpty ? true : false,
//                             ),
//                           ),
//                           // controller.user.firstName!.isEmpty ? const SizedBox(width: 10.0) : Offstage(),
//                           // controller.user.firstName!.isEmpty ?
//                           ElevatedButton(
//                             style: ElevatedButton.styleFrom(
//                               primary: colorAccent, // background
//                               onPrimary: Colors.black, // foreground
//                             ),
//                             onPressed: () {
//                               // controller.name = _name;
//                               // controller.setName();
//                               // _name.isEmpty ? controller.profile() : print("false");
//                               print("SAVE_save");
//                             },
//                             child: Text("Save"),
//                           ),
//                           // : Offstage(),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(height: 10.0),
//                     Container(
//                       padding: EdgeInsets.only(left: 10, right: 10),
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Flexible(
//                             child: TextField(
//                               cursorColor: colorAccent,
//                               onChanged: (text) {},
//                               controller: controller.controllerLastName,
//                               inputFormatters: [
//                                 LengthLimitingTextInputFormatter(9)
//                               ],
//                               keyboardType: TextInputType.name,
//                               decoration: getDecoration(
//                                   "input LastName",
//                                   "",
//                                   controller.user.lastName!,
//                                   "",
//                                   Icons.account_box),
//                             ),
//                           ),
//                           const SizedBox(width: 10.0),
//                           ElevatedButton(
//                             style: ElevatedButton.styleFrom(
//                               primary: colorAccent, // background
//                               onPrimary: Colors.black, // foreground
//                             ),
//                             onPressed: () {
//                               _name.isEmpty
//                                   ? controller.showMessage(
//                                       "incorrect input of the lastName")
//                                   : print("false");
//                             },
//                             child: Text("Save"),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(height: 10.0),
//                     Container(
//                       padding: const EdgeInsets.only(left: 10, right: 10),
//                       child: Row(
// //                     mainAxisAlignment: MainAxisAlignment.center,
// //                     crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Flexible(
//                             child: TextField(
//                               cursorColor: colorAccent,
//                               onChanged: (text) {
//                                 controller.email = text;
//                               },
//                               controller: controller.controllerEmail,
//                               inputFormatters: [
//                                 LengthLimitingTextInputFormatter(9)
//                               ],
//                               keyboardType: TextInputType.emailAddress,
//                               decoration: getDecoration(
//                                   "input Email",
//                                   "",
//                                   controller.user.email! ?? '',
//                                   "",
//                                   Icons.email),
// //                           decoration:
// //                           InputDecoration(
// //                             focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: colorAccent)),
// //                             border: OutlineInputBorder(borderSide: BorderSide(color: colorAccent)),
// //                             hintText: ' input FirstName',
// //                             hintStyle: TextStyle(color: Colors.black12),
// //                             helperStyle: TextStyle(color: colorAccent),
// //                             labelText: controller.user.email,
// //                             labelStyle: TextStyle(color: Colors.black),
// //                             prefixIcon: const Icon(Icons.account_box, color: colorAccent),
// //                            ),
//                             ),
//                           ),
//                           const SizedBox(
//                             width: 10.0,
//                           ),
//                           ElevatedButton(
//                             style: ElevatedButton.styleFrom(
//                               primary: colorAccent, // background
//                               onPrimary: Colors.black, // foreground
//                             ),
//                             onPressed: () {
//                               ///                          controller.setDataUserParameters(id);
//                               // print(testText);
//                               // controller.profile();
//                               // controller.controllerFirstName.text != "" ? controller.profile() : print("------ email");
//                             },
//                             child: Text("Save"),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(height: 10.0),
//                     // Align(
//                     //   alignment: Alignment(0.0, 0.0),
//                     //   heightFactor: 1.5,
//                     //   child: FloatingActionButton.extended(
//                     //     onPressed: () {
//                     //       print("uuuuuuuuuuuuu");
//                     //     },
//                     //     label: Text("Login",
//                     //         style: TextStyle(fontSize: 22.0, color: Colors.black)),
//                     //     icon: const Icon(
//                     //       Icons.logout,
//                     //       color: Colors.black,
//                     //     ),
//                     //   ),
//                     // ),
//                   ],
//                 ),
//               ]);
//   }
//
//   @override
//   Widget? buildFab() {
//     return FloatingActionButton(
//         child: const Icon(
//           Icons.logout,
//           color: Colors.black,
//         ),
//         onPressed: controller.logout);
//   }
//
//   @override
//   PreferredSizeWidget? buildAppbar() {
//     return null;
//     //return getAppBar(context, "Profile", leading: getBack());
//   }
//
//   removeValues() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.remove("stringValue");
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_example/resources/colors.dart';
import 'package:flutter_app_example/resources/styles.dart';
import 'package:flutter_app_example/src/core/ui/states/base_statefull_screen.dart';
import 'package:flutter_app_example/src/core/ui/widgets/base_stateful_widget.dart';
import 'package:flutter_app_example/src/ui/profile/profile_controller.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends BaseStatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ProfileScreenState();
  }
}

class ProfileScreenState
    extends BaseStatefulScreen<ProfileScreen, ProfileController> {
  @override
  ProfileController getController() => ProfileController();

  var auth = FirebaseAuth.instance;

  @override
  Widget buildBody() {
    return controller.contentProgress
        ? const Offstage()
        : ListView(
            padding: EdgeInsets.all(0.0),
            shrinkWrap: true,
            children: <Widget>[
                Obx(
                  () => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipOval(
                        child: const Icon(
                          Icons.account_box,
                          size: 100.0,
                        ),
                      ),
                      const SizedBox(height: 30.0),
                      Container(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: TextField(
                          enabled: false,
                          onChanged: (text) {},
                          controller: controller.controllerPhone,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: controller.user.phone,
                              prefixIcon:
                                  const Icon(Icons.phone, color: colorAccent),
                              suffixStyle: const TextStyle(color: Colors.red)),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Container(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Flexible(
                              child: TextField(
                                cursorColor: colorAccent,
                                onChanged: (text) {
                                  controller.firstName = text;
                                },
                                controller: controller.controllerFirstName,
                                inputFormatters: [LengthLimitingTextInputFormatter(99)],
                                keyboardType: TextInputType.name,
                                decoration:
//                                getDecoration("input FirstName", "", controller.user.firstName ?? "", "", Icons.account_box),
                                getDecoration("input FirstName", "",  controller.user.firstName == "" ? "input FirstName" : controller.user.firstName.toString(), "", Icons.account_box),
//                          enabled: controller.controllerFirstName.text.isEmpty ? true : false,
                              ),
                            ),
                            const SizedBox(width: 10.0),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: colorAccent, // background
                                onPrimary: Colors.black, // foreground
                              ),
                              onPressed: () {
                                controller.setDataUserParameters();
                              },
                              child: Text("Save"),
                            ),
                            // : Offstage(),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Container(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Flexible(
                              child: TextField(
                                cursorColor: colorAccent,
                                onChanged: (text) {
                                  controller.lastName = text;
                                },
                                controller: controller.controllerLastName,
                                inputFormatters: [LengthLimitingTextInputFormatter(25)],
                                keyboardType: TextInputType.name,
                                decoration:
//                                getDecoration("input LastName", "", controller.user.lastName ?? "input lastName", "", Icons.account_box),
                                getDecoration("input LastName", "", controller.user.lastName == "" ? "input LastName" : controller.user.lastName.toString(), "", Icons.account_box),
                              ),
                            ),
                            const SizedBox(width: 10.0),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: colorAccent, // background
                                onPrimary: Colors.black, // foreground
                              ),
                              onPressed: () {
                                controller.setDataUserParameters();
                              },
                              child: Text("Save"),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Container(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          children: [
                            Flexible(
                              child: TextField(
                                cursorColor: colorAccent,
                                onChanged: (text) {
                                  controller.email = text;
                                },
                                controller: controller.controllerEmail,
                                inputFormatters: [LengthLimitingTextInputFormatter(25)],
                                keyboardType: TextInputType.emailAddress,
                                decoration:
//                                getDecoration("input Email", "", controller.user.email ?? "input Email", "", Icons.email),
                                getDecoration("input Email", "",  controller.user.email == "" ? "input Email" : controller.user.email.toString(), "", Icons.email),
                              ),
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: colorAccent, // background
                                onPrimary: Colors.black, // foreground
                              ),
                              onPressed: () {
                                controller.setDataUserParameters();
                              },
                              child: Text("Save"),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Container(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: ElevatedButton.icon(
                          onPressed: (){
                            _showDialog();
                          },
                          label: Text("Logout"),
                          icon: Icon(Icons.logout),
                          style: ElevatedButton.styleFrom(
                            primary: colorAccent,
                            onPrimary: Colors.black,
                            minimumSize: Size.fromHeight(60),
                          ),
                        )
                      ),
                    ],
                  ),
                ),
              ]);
  }

  @override
  PreferredSizeWidget? buildAppbar() {
    return null;
    //return getAppBar(context, "Profile", leading: getBack());
  }

  removeValues() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("stringValue");
  }

  void _showDialog() {
    Get.dialog(AlertDialog(
      backgroundColor: colorPrimaryDark,
      title: new Text("Logout"),
      content: new Text("are you sure you want to exit the application?"),
      actions: <Widget>[
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: colorAccent, // background
            onPrimary: Colors.black, // foreground
          ),
          onPressed: () {
            Get.back();
          },
          child: Text("Close"), // cancel, //
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: colorAccent, // background
            onPrimary: Colors.black, // foreground
          ),
          onPressed: () {
            controller.logout();
          },
          child: Text("ok"), // cancel, //
        ),
      ],
    ));
  }

  // @override
  // Widget? buildFab() {
  //   return FloatingActionButton(
  //       child: const Icon(
  //         Icons.logout,
  //         color: Colors.black,
  //       ),
  //       onPressed: controller.logout);
  // }

}
