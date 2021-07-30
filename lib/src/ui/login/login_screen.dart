import 'package:flutter/material.dart';
import 'package:flutter_app_example/resources/styles.dart';
import 'package:flutter_app_example/src/core/ui/states/base_statefull_screen.dart';
import 'package:flutter_app_example/src/core/ui/widgets/base_stateful_widget.dart';
import 'package:flutter_app_example/src/ui/login/login_controller.dart';

class LoginScreen extends BaseStatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginScreenState();
  }
}

class LoginScreenState
    extends BaseStatefulScreen<LoginScreen, LoginController> {
  @override
  LoginController getController() => LoginController();

  @override
  Widget buildBody() {
    return Center(
        child: Text(
      "LOGIN DEV_2",
      style: getWhite16(),
    ));
  }

  @override
  PreferredSizeWidget? buildAppbar() {
    return null;
  }
}
