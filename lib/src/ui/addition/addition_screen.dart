// import 'package:flutter/material.dart';
// import 'package:flutter_app_example/resources/colors.dart';
// import 'package:flutter_app_example/src/core/ui/states/base_statefull_screen.dart';
// import 'package:flutter_app_example/src/core/ui/widgets/base_stateful_widget.dart';
// import 'package:flutter_app_example/src/ui/addition/addition_controller.dart';
// import 'package:flutter_app_example/src/ui/utils/utils.dart';
//
// class AdditionScreen extends BaseStatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return AdditionScreenState();
//   }
// }
//
//
// class AdditionScreenState
//     extends BaseStatefulScreen<AdditionScreen, AdditionController> {
//   @override
//   AdditionController getController() => AdditionController();
//
//   String textTask = "";
//
//   @override
//   Widget buildBody() {
//     return Container(
//       padding: EdgeInsets.only(top: 10.0, left: 8.0, right: 8.0),
//       height: 300.0,
//       child: new SizedBox.expand(
//         child: new TextField(
//             onChanged: (text) {
//               textTask = text;
//               setState(() {
//                 print(textTask);
//               });
//             },
//             controller: controller.controllerTextTask,
//             cursorColor: colorPrimaryDark,
//             maxLines: null,
//             minLines: null,
//             expands: true,
//             style: new TextStyle(fontSize: 16.0, color: Colors.black),
//             decoration: const InputDecoration(
//             fillColor: colorPrimaryDark, filled: true,
//             isCollapsed: true,
//             contentPadding: EdgeInsets.only(top: 10.0, left: 8.0, right: 8.0),
//             focusedBorder: OutlineInputBorder(
//                   borderSide: BorderSide(color: colorAccent, width: 2.0)),
//             enabledBorder: OutlineInputBorder(
//                 borderSide: BorderSide(color: Colors.black, width: 1.0)),
//             hintText: "Input task",)
//         ),
//       ),
//     );
//   }
//
//   @override
//   Widget? buildFab() {
//     return FloatingActionButton.extended(
//       elevation: 4.0,
//       label: const Text('Save a task', style: TextStyle(color: Colors.black),),
//       onPressed: () {},
//     );
//   }
//
//   @override
//   PreferredSizeWidget? buildAppbar() {
//   //  return null;
//     return getAppBar(context, "Addition Screen", leading: getBack());
//   }
// }



import 'package:flutter/material.dart';
import 'package:flutter_app_example/models/list_model.dart';
import 'package:flutter_app_example/resources/colors.dart';
import 'package:flutter_app_example/resources/styles.dart';
import 'package:flutter_app_example/router/route_paths.dart';
import 'package:flutter_app_example/src/core/ui/states/base_statefull_screen.dart';
import 'package:flutter_app_example/src/core/ui/widgets/base_stateful_widget.dart';
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

  String textTask = "";

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
                  setState(() {
                    print(textTask);
                  });
                },
                controller: controller.controllerTextTask,
                cursorColor: colorAccent, // colorPrimaryDark,
                maxLines: null,
                minLines: null,
                expands: true,
                style: getBlack16(), //TextStyle(fontSize: 16.0, color: Colors.black),
                decoration: const InputDecoration(fillColor: colorPrimaryDark,
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
//                Get.toNamed(AdditionScreenRoute);
                print('------>>> ' + textTask);
                controller.saveDate(controller.controllerTextTask.text.trim()); // Firebase =====
              },
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(colorAccent),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22.0),
 //                     side: BorderSide(color: Colors.red)
                      ))),
              label: Text("Save task",
                  style: getBlack22()), //TextStyle(fontSize: 22.0, color: Colors.black)),
              icon: const Icon(Icons.assignment_turned_in, color: Colors.black, size: 34.0,
              ),
            ),
          )
        ],
      ),
    );
  }


  @override
  PreferredSizeWidget? buildAppbar() {
    return getAppBar(context, "Addition Screen", leading: getBack());
  }


  // List<ListTask> taskList = [
  //   ListTask(task: "task 1"),
  //   ListTask(task: "task 2"),
  //   ListTask(task: "task 3"),
  //   ListTask(task: "task 4"),
  //   ListTask(task: "task 5"),
  // ];

}


















// @override
// Widget buildBody() {
//   return Padding(
//     padding: const EdgeInsets.all(8.0),
//     child: Container(
//       // margin: const EdgeInsets.only(top: 100, left: 10),
//       child: ConstrainedBox(
//         constraints: BoxConstraints(
//           maxHeight: 250.0,
//         ),
//         child: Scrollbar(
//           child: SingleChildScrollView(
//             scrollDirection: Axis.vertical,
//             reverse: true,
//             child: TextField(
//               maxLines: null,
//               decoration: InputDecoration(
//                 contentPadding: const EdgeInsets.symmetric(vertical: 80.0, horizontal: 10),
//                 focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: colorAccent)),
//                 border: OutlineInputBorder(
//                     borderSide: BorderSide(color: colorAccent)),
//                 hintText: 'Text',
//                 helperStyle: const TextStyle(color: colorAccent),
//                 labelText: 'Input task',
//                 labelStyle: const TextStyle(color: colorAccent),
//               ),
//             ),
//           ),
//         ),
//       ),
//     ),
//   );
//
//   /////  =========
//
// //       SingleChildScrollView(
// //       child: Padding(
// //         padding: const EdgeInsets.all(8.0),
// //         child: Container(padding: const EdgeInsets.only(bottom: 10.0),
// //           child: TextField(
// //             cursorColor: colorAccent,
// //               maxLines: null,
// // //          minLines: 1,
// // //          maxLines: 25,
// //             onChanged: (text) { },
// //             controller: _controllerText,
// //             keyboardType: TextInputType.name,
// //             decoration: InputDecoration(
// //                   focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: colorAccent)),
// //                   border: OutlineInputBorder(borderSide: BorderSide(color: colorAccent)),
// //                   hintText: 'Text',
// //                   helperStyle: const TextStyle(color: colorAccent),
// //                   labelText: 'Input task',
// //                   labelStyle: const TextStyle(color: colorAccent),
// //              ),
// //            ),
// //         ),
// //       ),
// //     );
//
//
// }

// Container(
// child: ConstrainedBox(
// constraints: BoxConstraints(
// maxHeight: 250.0,
// ),
// child: Scrollbar(
// child: SingleChildScrollView(
// scrollDirection: Axis.vertical,
// reverse: true,
// child: TextField(
// maxLines: null,
// decoration: InputDecoration(
// focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: colorAccent)),
// border: OutlineInputBorder(borderSide: BorderSide(color: colorAccent)),
// hintText: 'Text',
// helperStyle: const TextStyle(color: colorAccent),
// labelText: 'Input task',
// labelStyle: const TextStyle(color: colorAccent),
// ),
// ),
// ),
// ),
// ),
// );

// const SizedBox(width: 10.0),
// Container(
// padding: EdgeInsets.only(left: 30, right: 30),
// width: double.infinity,
// height: 55.0,
// child: ElevatedButton.icon(
// onPressed: () {
// //                 Get.to(MainScreen());
// },
// style: ElevatedButton.styleFrom(
// primary: colorAccent, // background
// ),
// label: Text("Login", style: TextStyle(fontSize: 22.0, color: Colors.black)),
// icon: const Icon(Icons.login, color: Colors.black, size: 34.0,
// ),
// )
// ),


// ClipOval(
// child: Material(
// color: Colors.blue, // Button color
// child: InkWell(
// splashColor: Colors.red, // Splash color
// onTap: () {},
// child: SizedBox(width: 56, height: 56, child: Icon(Icons.assignment_turned_in)),
// ),
// ),
// ),
