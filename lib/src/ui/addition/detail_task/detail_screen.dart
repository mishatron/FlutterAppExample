/// ======== variant_1 простой =======
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_app_example/resources/colors.dart';
import 'package:flutter_app_example/src/core/ui/states/base_statefull_screen.dart';
import 'package:flutter_app_example/src/core/ui/widgets/base_stateful_widget.dart';
import 'package:flutter_app_example/src/ui/addition/detail_task/detail_controller.dart';
import 'package:flutter_app_example/src/ui/utils/utils.dart';
import 'package:get/get.dart';

class DetailScreen extends BaseStatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DetailScreenState();
  }
}

class DetailScreenState
    extends BaseStatefulScreen<DetailScreen, DetailController> {
  @override
  DetailController getController() => DetailController();

  @override
  Widget buildBody() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(Get.arguments["dateTask"]),
            SizedBox(
              height: 15.0,
            ),
            SelectableText(Get.arguments["task"],
                style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 16.0,
                    fontStyle: FontStyle.italic)), //
          ],
        ),
      ),
    );
  }

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

/// ====== variant_2 OpenContainer =======
// import 'dart:ui';
// import 'package:flutter/material.dart';
// import 'package:flutter_app_example/resources/colors.dart';
// import 'package:flutter_app_example/src/core/ui/states/base_statefull_screen.dart';
// import 'package:flutter_app_example/src/core/ui/widgets/base_stateful_widget.dart';
// import 'package:flutter_app_example/src/ui/addition/detail_task/detail_controller.dart';
// import 'package:flutter_app_example/src/ui/utils/utils.dart';
// import 'package:get/get.dart';
//
// class DetailScreen extends BaseStatefulWidget {
//   final String taskTransit;
//   final String dateTask;
//   DetailScreen({
//     required this.taskTransit,
//     required this.dateTask,
//   });
//
//   @override
//   State<StatefulWidget> createState() {
//     return DetailScreenState();
//   }
// }
//
// class DetailScreenState
//     extends BaseStatefulScreen<DetailScreen, DetailController> {
//   @override
//   DetailController getController() => DetailController();
//
//   @override
//   Widget buildBody() {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: SingleChildScrollView(
//         child: Column(
//           children: [
//             Text(widget.dateTask),
//             SizedBox(
//               height: 15.0,
//             ),
//             SelectableText(widget.taskTransit,
//                 style: TextStyle(
//                     color: Colors.deepPurple,
//                     fontSize: 16.0,
//                     fontStyle: FontStyle.italic)),
//           ],
//         ),
//       ),
//     );
//   }
//
//   @override
//   PreferredSizeWidget? buildAppbar() {
//     return getAppBar(context, "DetailScreen Screen", leading: getBack());
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

// List<ListTask> taskList = [
//   ListTask(task: "task 1"),
//   ListTask(task: "task 2"),
//   ListTask(task: "task 3"),
//   ListTask(task: "task 4"),
//   ListTask(task: "task 5"),
// ];
