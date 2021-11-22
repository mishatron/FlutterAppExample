/// ======== variant_1 простой =======
import 'package:flutter/material.dart';
import 'package:flutter_app_example/resources/colors.dart';
import 'package:flutter_app_example/resources/styles.dart';
import 'package:flutter_app_example/src/core/ui/states/base_statefull_screen.dart';
import 'package:flutter_app_example/src/core/ui/widgets/base_stateful_widget.dart';
import 'package:flutter_app_example/src/ui/addition/add_date/task_date_controller.dart';
import 'package:flutter_app_example/src/ui/utils/utils.dart';
import 'package:get/get.dart';

class TaskAddDateScreen extends BaseStatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TaskAddDateScreenState();
  }
}

class TaskAddDateScreenState
    extends BaseStatefulScreen<TaskAddDateScreen, TaskAddDateController> {
  @override
  TaskAddDateController getController() => TaskAddDateController();

  String transitTask = Get.arguments["taskTransit"];

  //late DateTime _selectedDate;
  DateTime selectedDate = DateTime.now();
//  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget buildBody() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextField(
            focusNode: AlwaysDisabledFocusNode(),
            controller: controller.controllerTextDate, //_textEditingController,
            onTap: () {
              _selectDate(context);
            },
          ),
          Container(
            height: 58.0,
            padding: EdgeInsets.only(top: 10.0, left: 8.0, right: 8.0),
            child: ElevatedButton.icon(
              onPressed: () {
                /// =======
                controller.saveDate(
                    transitTask, controller.controllerTextDate.text.trim());
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(colorAccent),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22.0),
                          side: BorderSide(color: colorPrimaryDark)))),
              label: Text("input date", style: getBlack22()),
              // TextStyle(fontSize: 22.0, color: Colors.black)),
              icon: const Icon(
                Icons.assignment_turned_in,
                color: Colors.black,
                size: 34.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String getText() {
    return "${selectedDate.day}.${selectedDate.month}.${selectedDate.year}";
  }

  Future<void> _selectDate(BuildContext context) async {
    final newSelectedDate = await showDatePicker(
      builder: (context, picker) {
        return Theme(
          //TODO: change colors
          data: ThemeData.dark().copyWith(
            colorScheme: ColorScheme.dark(
              primary: Colors.deepPurple,
              onPrimary: Colors.white,
              surface: Colors.pink,
              onSurface: Colors.yellow,
            ),
            dialogBackgroundColor: Colors.green[900],
          ),
          child: picker!,
        );
      },
      context: context,
      initialDate: selectedDate, // != null ? selectedDate : DateTime.now(),
      firstDate: DateTime(DateTime.now().year), //(2000),
      lastDate: DateTime(2040),
    );

    if (newSelectedDate != null) {
      selectedDate = newSelectedDate;
      controller.controllerTextDate
        ..text = getText() //DateFormat.yMMMd().format(selectedDate) // yMMMd()
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: controller.controllerTextDate.text.length,
            affinity: TextAffinity.upstream));
    }
  }

  // Future<void> _selectDate(BuildContext context) async {
  //   showDatePicker(
  //       context: context,
  //       initialDate: DateTime.now(),
  //       firstDate: DateTime(2019, 1),
  //       lastDate: DateTime(2021, 12),
  //       builder: (context, picker) {
  //         return Theme(
  //           //TODO: change colors
  //           data: ThemeData.dark().copyWith(
  //             colorScheme: ColorScheme.dark(
  //               primary: Colors.deepPurple,
  //               onPrimary: Colors.white,
  //               surface: Colors.pink,
  //               onSurface: Colors.yellow,
  //             ),
  //             dialogBackgroundColor: Colors.green[900],
  //           ),
  //           child: picker!,
  //         );
  //       }).then((selectedDate) {
  //     //TODO: handle selected date
  //     if (selectedDate != null) {
  //       _textEditingController.text = selectedDate.toString();
  //     }
  //   });
  // }

  @override
  PreferredSizeWidget? buildAppbar() {
    return getAppBar(context, "DetailScreen Screen", leading: getBack());
  }

  void _showDialog() {
    Get.dialog(AlertDialog(
      backgroundColor: colorPrimaryDark,
      title: new Text("Task"),
      content: new Text("To save, first enter the task"),
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
      ],
    ));
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
