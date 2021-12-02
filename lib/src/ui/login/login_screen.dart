
import 'package:flutter/material.dart';
import 'package:flutter_app_example/src/core/ui/states/base_statefull_screen.dart';
import 'package:flutter_app_example/src/core/ui/widgets/base_stateful_widget.dart';
import 'package:flutter_app_example/src/ui/login/code_widget.dart';
import 'package:flutter_app_example/src/ui/login/login_controller.dart';
import 'package:flutter_app_example/src/ui/login/login_widget.dart';
import 'package:get/get.dart';


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
    return ObxValue<RxBool>((rxValue) {
      if (rxValue.isTrue) return CodeWidget();
      return LoginWidget();
    }, controller.showCode);
  }

  @override
  PreferredSizeWidget? buildAppbar() {
    return null;
  }
}


