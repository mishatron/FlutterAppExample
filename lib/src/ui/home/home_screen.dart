
import 'package:flutter/material.dart';
import 'package:flutter_app_example/src/core/ui/states/base_statefull_screen.dart';
import 'package:flutter_app_example/src/core/ui/widgets/base_stateful_widget.dart';
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

  List countTask = ["is NOT task"];

  @override
  Widget buildBody() {
    return
        // Scaffold(
        // appBar: buildAppbar(),
        // body:
        Container(
            child: ObxValue(
                (RxList list) => ListView.separated(
                    padding: EdgeInsets.only(left: 5.0, right: 5.0),
                    itemBuilder: (context, index) {
                      return Dismissible(
                        key: Key(list[index].task),
                        background: Container(
                          padding: EdgeInsets.only(right: 15.0),
                          alignment: AlignmentDirectional.centerEnd,
                          color: Colors.orange,
                          child: const Icon(Icons.delete, color: Colors.black),
                        ),
                        onDismissed: (direction) {
                          setState(() {
                            list.removeAt(index);
                          });
                        },
                        direction: DismissDirection.endToStart,
                        child: Container(
                          height: 50,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(list[index].task),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => Divider(
                          height: 0.1,
                          color: Colors.black,
                        ),
                    itemCount: list.length),
                controller.list)
            );
  }

  @override
  PreferredSizeWidget? buildAppbar() {
    return null;
    // return getAppBar(context, "HomeScreen", leading: getBack());
  }

}









//   @override
// Widget? buildFab() {
//   return FloatingActionButton(
//     child: const Icon(Icons.add, color: Colors.black,),
//     onPressed: () {
//       Navigator.push(context, MaterialPageRoute(builder: (context) => AdditionScreen()),);
//     },);
// }



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
