/// ======== variant_1 prostoy =======
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app_example/resources/colors.dart';
import 'package:flutter_app_example/src/core/ui/states/base_statefull_screen.dart';
import 'package:flutter_app_example/src/core/ui/widgets/base_stateful_widget.dart';
import 'package:flutter_app_example/src/ui/addition/detail_task/detail_screen.dart';
import 'package:flutter_app_example/src/ui/home/home_controller.dart';
import 'package:get/get.dart';

class HomeScreen extends BaseStatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends BaseStatefulScreen<HomeScreen, HomeController> {
  @override
  HomeController getController() => HomeController();

//  String replacementFlag = Get.arguments["replacementTask"] ?? "";

  @override
  Widget buildBody() {
    return
        // Scaffold(
        // appBar: buildAppbar(),
        // body:
        Column(
      children: [
//          Container(child: controller.list.isNotEmpty ? Text("Task list") : Text("There are no tasks in the list")),
//          Container(child: controller.notTask == true ? Text("Task list") : Text("There are no tasks in the list")),
        Container(
            width: double.infinity,
            alignment: Alignment.center,
            color: Colors.black26,
            padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
            // child: Obx(
            //       () => controller.replacementFlag != ""
            //           ? Text("Task list", style: TextStyle(color: Colors.brown, fontSize: 18.0))
            //       : Text("There are no tasks in the list", style: TextStyle(color: Colors.red, fontSize: 18.0))
            // )),
            child: controller.replacementFlag != ""
                ? Text("Task list",
                    style: TextStyle(color: Colors.brown, fontSize: 18.0))
                : Text("There are no tasks in the list",
                    style: TextStyle(color: Colors.red, fontSize: 18.0))),
        ObxValue(
            (RxList list) => Expanded(
                  child: ListView.separated(
                      shrinkWrap: true,
                      // Expanded + Container
                      padding: EdgeInsets.only(left: 5.0, right: 5.0),
                      itemBuilder: (context, index) {
                        int indexAlert = index;
                        // if(controller.idRemove == list[index].id )
                        // {
                        //   return Center(child: CircularProgressIndicator());
                        // }
                        return Dismissible(
                          key: Key(list[index].dateTask),
                          background: Container(
                            padding: EdgeInsets.only(right: 15.0),
                            alignment: AlignmentDirectional.centerEnd,
                            color: Colors.orange,
                            child:
                                const Icon(Icons.delete, color: Colors.black),
                          ),
                          confirmDismiss: (DismissDirection direction) async {
                            return await showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  backgroundColor: colorPrimaryDark,
                                  title: const Text("Deleting a task"),
                                  content: const Text(
                                      "Are you sure you want to delete this task?"),
                                  actions: <Widget>[
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            primary: colorAccent,
                                            onPrimary: Colors.black),
                                        onPressed: () {
                                          ///   удалить с Firebase
                                          controller.deleteTask(list[index]);

                                          ///   удалить c экрана
                                          list.removeAt(index);
                                          Get.back();
                                        },
                                        child: const Text("Delete")),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: colorAccent,
                                          onPrimary: Colors.black),
                                      onPressed: () {
                                        Get.back();
                                      },
                                      child: const Text("Cancel"),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          direction: DismissDirection.endToStart,
                          child: ListTile(
                            leading: Icon(Icons.date_range),
                            trailing: InkWell(
                                child: Icon(Icons.visibility_outlined),
                                onTap: () {
                                  Get.to(DetailScreen(), arguments: {
                                    "task": list[index].task,
                                    "dateTask": list[index].dateTask
                                  });
                                }),
                            title: Text(list[index].dateTask,
                                overflow: TextOverflow.ellipsis),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => Divider(
                            height: 0.1,
                            color: Colors.black,
                          ),
                      itemCount: list.length),
                ),
            controller.list),
//            ),
//          ),
      ],
    );
  }

  @override
  PreferredSizeWidget? buildAppbar() {
    return null;
    // return getAppBar(context, "HomeScreen", leading: getBack());
  }
}

// /// ---- variant_2 s OpenController -------
//
//
//
// import 'package:animations/animations.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter_app_example/resources/colors.dart';
// import 'package:flutter_app_example/src/core/ui/states/base_statefull_screen.dart';
// import 'package:flutter_app_example/src/core/ui/widgets/base_stateful_widget.dart';
// import 'package:flutter_app_example/src/ui/addition/detail_task/detail_screen.dart';
// import 'package:flutter_app_example/src/ui/home/home_controller.dart';
// import 'package:get/get.dart';
//
// class HomeScreen extends BaseStatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return HomeScreenState();
//   }
// }
//
// class HomeScreenState extends BaseStatefulScreen<HomeScreen, HomeController> {
//   @override
//   HomeController getController() => HomeController();
//
// //  String replacementFlag = Get.arguments["replacementTask"] ?? "";
//
// //  String sortedTaskIndex = "";
//
//   @override
//   Widget buildBody() {
//     return Column(
//       children: [
//         Container(
//             width: double.infinity,
//             alignment: Alignment.center,
//             color: Colors.black26,
//             padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
//             // child: Obx(
//             //       () => controller.replacementFlag != ""
//             //           ? Text("Task list", style: TextStyle(color: Colors.brown, fontSize: 18.0))
//             //       : Text("There are no tasks in the list", style: TextStyle(color: Colors.red, fontSize: 18.0))
//             // )),
//             child: controller.replacementFlag != ""
//                 ? Text("Task list",
//                     style: TextStyle(color: Colors.brown, fontSize: 18.0))
//                 : Text("There are no tasks in the list",
//                     style: TextStyle(color: Colors.red, fontSize: 18.0))),
//         ObxValue(
//             (RxList list) => Expanded(
//                   child: ListView.separated(
//                       shrinkWrap: true,
//                       padding: EdgeInsets.only(left: 5.0, right: 5.0),
//                       itemBuilder: (context, index) {
//                         return Dismissible(
//                           key: Key(list[index].task),
//                           background: Container(
//                             padding: EdgeInsets.only(right: 15.0),
//                             alignment: AlignmentDirectional.centerEnd,
//                             color: Colors.orange,
//                             child:
//                                 const Icon(Icons.delete, color: Colors.black),
//                           ),
//                           confirmDismiss: (DismissDirection direction) async {
//                             return await showDialog(
//                               context: context,
//                               builder: (BuildContext context) {
//                                 return AlertDialog(
//                                   backgroundColor: colorPrimaryDark,
//                                   title: const Text("Deleting a task"),
//                                   content: const Text(
//                                       "Are you sure you want to delete this task?"),
//                                   actions: <Widget>[
//                                     ElevatedButton(
//                                         style: ElevatedButton.styleFrom(
//                                             primary: colorAccent,
//                                             onPrimary: Colors.black),
//                                         onPressed: () {
//                                           ///   удалить с Firebase
//                                           controller.deleteTask(list[index]);
//
//                                           ///   удалить c экрана
//                                           list.removeAt(index);
//                                           Get.back();
//                                         },
//                                         child: const Text("Delete")),
//                                     ElevatedButton(
//                                       style: ElevatedButton.styleFrom(
//                                           primary: colorAccent,
//                                           onPrimary: Colors.black),
//                                       onPressed: () {
//                                         Get.back();
//                                       },
//                                       child: const Text("Cancel"),
//                                     ),
//                                   ],
//                                 );
//                               },
//                             );
//                           },
//                           direction: DismissDirection.endToStart,
//                           child: OpenContainer(
//                             transitionType: ContainerTransitionType.fadeThrough,
//                             closedColor: colorPrimary,
//                             // Theme.of(context).accentColor,
//                             closedElevation: 0.0,
//                             openElevation: 4.0,
//                             transitionDuration: Duration(milliseconds: 1500),
//                             openBuilder:
//                                 (BuildContext context, VoidCallback _) =>
//                                     DetailScreen(
//                               taskTransit: list[index].task,
//                               dateTask: list[index].dateTask,
//                             ),
//                             closedBuilder:
//                                 (BuildContext _, VoidCallback openContainer) {
//                               return ListTile(
//                                 leading: Icon(Icons.date_range),
//                                 trailing: Icon(Icons.visibility_outlined),
//                                 title: Text(list[index].dateTask,
//                                     overflow: TextOverflow.ellipsis),
//                               );
//                             },
//                           ),
//                         );
//                       },
//                       separatorBuilder: (context, index) => Divider(
//                             height: 0.1,
//                             color: Colors.black,
//                           ),
//                       itemCount: list.length),
//                 ),
//             controller.list),
//       ],
//     );
//   }
//
//   @override
//   PreferredSizeWidget? buildAppbar() {
//     return null;
//     // return getAppBar(context, "HomeScreen", leading: getBack());
//   }
// }



/// ======================

//   @override
// Widget? buildFab() {
//   return FloatingActionButton(
//     child: const Icon(Icons.add, color: Colors.black,),
//     onPressed: () {
//       Navigator.push(context, MaterialPageRoute(builder: (context) => AdditionScreen()),);
//     },);
// }

/// ==== zamena na ListTile ====

// Container(
//   height: 50,
//   child: Row(
//     children: [
//       Expanded(
//         child: Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: Text(list[index].task,
//               overflow: TextOverflow.ellipsis),
//         ),
//       ),
//       Row(
//         children: [
//           InkWell(
//               child: Icon(Icons.visibility_outlined),
//               onTap: () {
//                 Get.to(DetailScreen(), arguments: {
//                   "task": list[index].task,
//                   "two": "1.01.2022"
//                 });
//               }),
//         ],
//       ),
//     ],
//   ),
// ),

/// ---- STARIY LIST ----

// List<ListOne> oneList = [ListOne(firstName: "1", lastName: "Name 1", email: "Address 1", phone: "Phone 1", ListTask: ["task 1"]),
//   ListOne(firstName: "2", lastName: "Name 2", email: "Address 2", phone: "Phone 2", ListTask: "task 2"),
//   ListOne(firstName: "3", lastName:"Name 3", email:"Address 3", phone: "Phone 3", ListTask: "task 3"),
// ];

// List<ListTask> taskList = [
//   ListTask(task: "task 1"),
//   ListTask(task: "task 2"),
//   ListTask(task: "task 3"),
//   ListTask(task: "task 4"),
//   ListTask(task: "task 5"),
// ];

/// ----- GENERATE RANDOM LIST ----

// static List getList() {
//   List list = List.generate(30, (i) {
//     return "Item ${i + 1}";
//   });
//   return list;
// }

/// ------ ObxValue((RxList list) => ListView.separated

//         Container(
//             child:
//             ObxValue(
//                 (RxList list) => ListView.separated(
//                     padding: EdgeInsets.only(left: 5.0, right: 5.0),
//                     itemBuilder: (context, index) {
//                       // if(controller.idRemove == list[index].id )
//                       // {
//                       //   return Center(child: CircularProgressIndicator());
//                       // }
//                       return Dismissible(
//                         key: Key(list[index].task),
//                         background: Container(
//                           padding: EdgeInsets.only(right: 15.0),
//                           alignment: AlignmentDirectional.centerEnd,
//                           color: Colors.orange,
//                           child: const Icon(Icons.delete, color: Colors.black),
//                         ),
//                         onDismissed: (direction) {
// ///                       удалить с Firebase
//                           controller.deleteTask(list[index]);
// ///                       удалить c экрана
//                           list.removeAt(index);
//                         },
//                         direction: DismissDirection.endToStart,
//                         child: Container(
//                           height: 50,
//                           child: Row(
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.all(10.0),
//                                 child: Text(list[index].task), // + list[index].docIndexTask
//                               )
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                     separatorBuilder: (context, index) => Divider(
//                           height: 0.1,
//                           color: Colors.black,
//                         ),
//                     itemCount: list.length),
//                 controller.list),
//             );
