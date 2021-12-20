
import 'package:flutter/material.dart';
import 'package:flutter_app_example/resources/colors.dart';
import 'package:flutter_app_example/resources/styles.dart';
import 'package:flutter_app_example/src/core/ui/states/base_shared_controlled_state.dart';
import 'package:flutter_app_example/src/core/ui/widgets/base_stateful_widget.dart';
import 'package:flutter_app_example/src/ui/login/login_controller.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';


class LoginWidget extends BaseStatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginWidgetState();
  }
}

class LoginWidgetState extends BaseSharedControlledState<LoginWidget, LoginController> {

  @override
  Widget getLayout() {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Positioned(
          top: 0,
          child: Container(
            child: FlutterLogo(size: 126),
            color: Colors.blueGrey,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .15,
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * .14,
          child: Container(
            color: Colors.blueGrey,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .25,
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * .24,
          left: 15,
          right: 15,
          child: Card(
            elevation: 8,
            color: Colors.white,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10.0, top: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 30, right: 30),
                    child: TextFormField(
//                inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.allow(RegExp('[0-9+]'))],
                      cursorColor: colorAccent,
                      controller: controller.controllerPhone,
                      focusNode: controller.phoneFocus,
                      keyboardType: TextInputType.phone,
                      decoration: getDecoration('  input phone', '+38...', 'Phone', '№ ', Icons.phone,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Container(
                      padding: EdgeInsets.only(left: 30, right: 30),
                      width: double.infinity,
                      height: 55.0,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          if(controller.controllerPhone.text.isEmpty) {
                            _showDialog();
                          } else {
                            controller.verifyPhone(controller.controllerPhone.text);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          primary: colorAccent,
                        ),
                        label: Text("Login",
                            style: TextStyle(
                                fontSize: 22.0, color: Colors.black)),
                        icon: const Icon(
                          Icons.login,
                          color: Colors.black,
                          size: 34.0,
                        ),
                      )),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _showDialog() {
    Get.dialog(AlertDialog(
      backgroundColor: colorPrimaryDark,
      title: new Text("Registered"),
      content: new Text("Input number phone"),
      actions: <Widget>[
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: colorAccent,
            onPrimary: Colors.black,
          ),
          onPressed: () {Get.back();},
          child: Text("Close"),
        ),
      ],
    ));
  }



}