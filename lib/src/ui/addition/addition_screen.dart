// import 'package:flutter/material.dart';
// import 'package:flutter_app_example/resources/colors.dart';
// import 'package:flutter_app_example/resources/styles.dart';
// import 'package:flutter_app_example/src/core/ui/states/base_statefull_screen.dart';
// import 'package:flutter_app_example/src/core/ui/widgets/base_stateful_widget.dart';
// import 'package:flutter_app_example/src/ui/addition/addition_controller.dart';
// import 'package:flutter_app_example/src/ui/utils/utils.dart';
// import 'package:get/get.dart';
//
// class AdditionScreen extends BaseStatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return AdditionScreenState();
//   }
// }
//
// class AdditionScreenState
//     extends BaseStatefulScreen<AdditionScreen, AdditionController> {
//   @override
//   AdditionController getController() => AdditionController();
//
//   String textTask = ""; //Get.arguments["replacementTask"] ?? "not task";
//
//   @override
//   Widget buildBody() {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         children: [
//           Expanded(
//             child: TextField(
//                 onChanged: (text) {
//                   textTask = text;
//                 },
//                 controller: controller.controllerTextTask,
//                 cursorColor: colorAccent,
//                 // colorPrimaryDark,
//                 maxLines: null,
//                 minLines: null,
//                 expands: true,
//                 style: getBlack16(),
//                 // TextStyle(fontSize: 16.0, color: Colors.black),
//                 decoration: const InputDecoration(
//                   fillColor: colorPrimaryDark,
//                   filled: true,
//                   isCollapsed: true,
//                   contentPadding:
//                       EdgeInsets.only(top: 10.0, left: 8.0, right: 8.0),
//                   focusedBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: colorAccent, width: 2.0)),
//                   enabledBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.black, width: 1.0)),
//                   hintText: "Input task",
//                 )),
//           ),
//           Container(
//             height: 58.0,
//             padding: EdgeInsets.only(top: 10.0, left: 8.0, right: 8.0),
//             child: ElevatedButton.icon(
//               onPressed: () {
//                 if (controller.controllerTextTask.text.isNotEmpty) {
//                   controller
//                       .saveDate(controller.controllerTextTask.text.trim());
//                 } else {
//                   _showDialog();
//                 }
//               },
//               style: ButtonStyle(
//                   backgroundColor: MaterialStateProperty.all(colorAccent),
//                   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                       RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(22.0),
//                           side: BorderSide(color: colorPrimaryDark)))),
//               label: Text("Save task", style: getBlack22()),
//               // TextStyle(fontSize: 22.0, color: Colors.black)),
//               icon: const Icon(
//                 Icons.assignment_turned_in,
//                 color: Colors.black,
//                 size: 34.0,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   @override
//   PreferredSizeWidget? buildAppbar() {
//     return getAppBar(context, "Addition Screen", leading: getBack());
//   }
//
//   void _showDialog() {
//     Get.dialog(AlertDialog(
//       backgroundColor: colorPrimaryDark,
//       title: new Text("Task"),
//       content: new Text("To save, first enter the task"),
//       actions: <Widget>[
//         ElevatedButton(
//           style: ElevatedButton.styleFrom(
//             primary: colorAccent, // background
//             onPrimary: Colors.black, // foreground
//           ),
//           onPressed: () {
//             Get.back();
//           },
//           child: Text("Close"), // cancel, //
//         ),
//       ],
//     ));
//   }
// }
//
// // List<ListTask> taskList = [
// //   ListTask(task: "task 1"),
// //   ListTask(task: "task 2"),
// //   ListTask(task: "task 3"),
// //   ListTask(task: "task 4"),
// //   ListTask(task: "task 5"),
// // ];

/// ======= с датой ========import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_example/resources/colors.dart';
import 'package:flutter_app_example/resources/styles.dart';
import 'package:flutter_app_example/src/core/ui/states/base_statefull_screen.dart';
import 'package:flutter_app_example/src/core/ui/widgets/base_stateful_widget.dart';
import 'package:flutter_app_example/src/ui/addition/add_date/task_date_screen.dart';
import 'package:flutter_app_example/src/ui/addition/addition_controller.dart';
import 'package:flutter_app_example/src/ui/utils/utils.dart';
import 'package:get/get.dart';

class AdditionScreen extends BaseStatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AdditionScreenState();
  }
}

class AdditionScreenState
    extends BaseStatefulScreen<AdditionScreen, AdditionController> {
  @override
  AdditionController getController() => AdditionController();

  String textTask = ""; //Get.arguments["replacementTask"] ?? "not task";

  @override
  Widget buildBody() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Expanded(
            child: TextField(
                onChanged: (text) {
                  textTask = text;
                },
                controller: controller.controllerTextTask,
                cursorColor: colorAccent,
                // colorPrimaryDark,
                maxLines: null,
                minLines: null,
                expands: true,
                style: getBlack16(),
                // TextStyle(fontSize: 16.0, color: Colors.black),
                decoration: const InputDecoration(
                  fillColor: colorPrimaryDark,
                  filled: true,
                  isCollapsed: true,
                  contentPadding:
                      EdgeInsets.only(top: 10.0, left: 8.0, right: 8.0),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: colorAccent, width: 2.0)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.0)),
                  hintText: "Input task",
                )),
          ),
          Container(
            height: 58.0,
            padding: EdgeInsets.only(top: 10.0, left: 8.0, right: 8.0),
            child: ElevatedButton.icon(
              onPressed: () {
                if (controller.controllerTextTask.text.isNotEmpty) {
//                  Get.to(TaskAddDateScreen());
                  Get.to(TaskAddDateScreen(), arguments: {
                    "taskTransit": controller.controllerTextTask.text.trim(),
                  });
                } else {
                  _showDialog();
                }
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(colorAccent),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22.0),
                          side: BorderSide(color: colorPrimaryDark)))),
              label: Text("Save task", style: getBlack22()),
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

  @override
  PreferredSizeWidget? buildAppbar() {
    return getAppBar(context, "Addition Screen", leading: getBack());
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

// List<ListTask> taskList = [
//   ListTask(task: "task 1"),
//   ListTask(task: "task 2"),
//   ListTask(task: "task 3"),
//   ListTask(task: "task 4"),
//   ListTask(task: "task 5"),
// ];
