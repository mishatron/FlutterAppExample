import 'package:flutter/material.dart';
import 'package:flutter_app_example/resources/styles.dart';
import 'package:flutter_app_example/src/core/ui/states/base_statefull_screen.dart';
import 'package:flutter_app_example/src/core/ui/widgets/base_stateful_widget.dart';
import 'package:flutter_app_example/src/ui/main/main_controller.dart';

class MainScreen extends BaseStatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainScreenState();
  }
}

class MainScreenState extends BaseStatefulScreen<MainScreen, MainController> {
  @override
  MainController getController() => MainController();

  @override
  Widget buildBody() {
    return Text("MAIN", style: getWhite16(),);
  }

  @override
  PreferredSizeWidget? buildAppbar() {
    return null;
  }
}
