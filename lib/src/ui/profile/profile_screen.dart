import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_example/resources/colors.dart';
import 'package:flutter_app_example/resources/styles.dart';
import 'package:flutter_app_example/router/route_paths.dart';
import 'package:flutter_app_example/src/core/ui/states/base_statefull_screen.dart';
import 'package:flutter_app_example/src/core/ui/widgets/base_stateful_widget.dart';
import 'package:flutter_app_example/src/ui/login/login_screen.dart';
import 'package:flutter_app_example/src/ui/profile/profile_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  String _phone = "+380 73 888 0101";
  String _name = "";

  @override
  Widget buildBody() {

    controller.setName();

    return ListView(
        padding: EdgeInsets.all(0.0),
        shrinkWrap: true,
        children: <Widget>[
        Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipOval(
                  child: const Icon(Icons.account_box, size: 100.0,),
                ),
                const SizedBox(height: 30.0),
                Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: TextField(
                    enabled: false,
                    onChanged: (text) { },
                    controller: controller.controllerPhone,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: _phone,
                        prefixIcon: const Icon(Icons.phone, color: colorAccent),
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
                            _name = text;
                          },
                          controller: controller.controllerFirstName,
                          inputFormatters: [LengthLimitingTextInputFormatter(99)],
                          keyboardType: TextInputType.name,
                          decoration: getDecoration("input FirstName", "", "FirstName", "", Icons.account_box),
                          enabled: controller.controllerFirstName.text.isEmpty ? true : false,
                          // decoration:
                          // InputDecoration(
                          //   focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: colorAccent)),
                          //   border: OutlineInputBorder(borderSide: BorderSide(color: colorAccent)),
                          //   hintText: ' input FirstName',
                          //   hintStyle: TextStyle(color: Colors.black12),
                          //   helperStyle: TextStyle(color: colorAccent),
                          //   labelText: 'FirstName',
                          //   labelStyle: TextStyle(color: Colors.black),
                          //   prefixIcon: const Icon(Icons.account_box, color: colorAccent),
                          // ),

                        ),
                      ),
                      controller.controllerFirstName.text.isEmpty ? const SizedBox(width: 10.0) : Offstage(),
                      controller.controllerFirstName.text.isEmpty ? ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: colorAccent, // background
                          onPrimary: Colors.black, // foreground
                        ),
                        onPressed: () {
                          controller.name = _name;
                          controller.setName();
                          _name.isEmpty ? controller.profile() : print("false");
                          print("SAVE_save");},
                        child: Text("Save"),
                      ) : Offstage(),
                    ],
                  ),
                ),
                const SizedBox(height: 10.0),
                Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        child: TextField(
                          cursorColor: colorAccent,
                          onChanged: (text) { },
                          controller: controller.controllerLastName,
                          inputFormatters: [LengthLimitingTextInputFormatter(9)],
                          keyboardType: TextInputType.name,
                          decoration: getDecoration("input LastName", "", "LastName", "", Icons.account_box),
                        ),
                       ),

                      const SizedBox(width: 10.0),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: colorAccent, // background
                          onPrimary: Colors.black, // foreground
                        ),
                        onPressed: () {
                          _name.isEmpty ? controller.showMessage("incorrect input of the lastName") : print("false");
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
                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        child: TextField(
                          cursorColor: colorAccent,
                          onChanged: (text) {
                            controller.testText = text;
                          },
                          controller: controller.controllerEmail,
                          inputFormatters: [LengthLimitingTextInputFormatter(9)],
                          keyboardType: TextInputType.emailAddress,
                          decoration: getDecoration("input Email", "", "Email", "", Icons.email),
                        ),
                      ),
                      const SizedBox(width: 10.0,),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: colorAccent, // background
                          onPrimary: Colors.black, // foreground
                        ),
                        onPressed: () {
                           // print(testText);
                         // controller.profile();
                          controller.controllerFirstName.text != "" ? controller.profile() : print("------ email");},
                        child: Text("Save"),
                      ),
                    ],
                  ),

                ),
                const SizedBox(height: 10.0),
              // Align(
              //   alignment: Alignment(0.0, 0.0),
              //   heightFactor: 1.5,
              //   child: FloatingActionButton.extended(
              //     onPressed: () {
              //       print("uuuuuuuuuuuuu");
              //     },
              //     label: Text("Login",
              //         style: TextStyle(fontSize: 22.0, color: Colors.black)),
              //     icon: const Icon(
              //       Icons.logout,
              //       color: Colors.black,
              //     ),
              //   ),
              // ),
            ],
            ),
        ]
    );
  }

    @override
    Widget? buildFab() {
      return FloatingActionButton(
          child: const Icon(Icons.logout, color: Colors.black,),
          onPressed: controller.logout);
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

}
