import 'package:animations/animations.dart';
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

  @override
  Widget buildBody() {
    return Column(
      children: [
        AppBar(
          backgroundColor: const Color(0xFFffffb3),
          actions: [
            IconButton(
              icon: new Icon(Icons.delete),
              onPressed: () {
                _showDialog();
              },
            )
          ],
          title: Center(
              child: Text("Task list",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.brown, fontSize: 18.0))),
        ),
        ObxValue(
            (RxList list) => Expanded(
                  child: list.isEmpty
                      ? Center(child: Text("Your list is empty"))
                      : ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Dismissible(
                              key: Key(list[index].task),
                              background: Container(
                                padding: EdgeInsets.only(right: 15.0),
                                alignment: AlignmentDirectional.centerEnd,
                                color: Colors.orange,
                                child: const Icon(Icons.delete,
                                    color: Colors.black),
                              ),
                              confirmDismiss:
                                  (DismissDirection direction) async {
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
                                              controller
                                                  .deleteTask(list[index]);

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
                              child: OpenContainer(
                                transitionType:
                                    ContainerTransitionType.fadeThrough,
                                closedColor: colorPrimary,
                                // Theme.of(context).accentColor,
                                closedElevation: 0.0,
                                openElevation: 4.0,
                                transitionDuration:
                                    const Duration(milliseconds: 1500),
                                openBuilder:
                                    (BuildContext context, VoidCallback _) =>
                                        DetailScreen(
                                  taskTransit: list[index].task,
                                  dateTask: list[index].dateTask,
                                ),
                                closedBuilder: (BuildContext _,
                                    VoidCallback openContainer) {
                                  return ListTile(
                                    leading: Icon(Icons.date_range),
                                    trailing: Icon(Icons.visibility_outlined),
                                    title: Text(list[index].task,
                                        maxLines: 1,
                                        softWrap: false,
                                        overflow: TextOverflow.ellipsis),
                                    subtitle: Text(list[index].dateTask),
                                  );
                                },
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => const Divider(
                                height: 0.1,
                                color: Colors.black,
                              ),
                          itemCount: list.length),
                ),
            controller.list),
      ],
    );
  }

  void _showDialog() {
    Get.dialog(AlertDialog(
      backgroundColor: colorPrimaryDark,
      title: new Text("Delete list"),
      content: new Text("clear the whole list?"),
      actions: <Widget>[
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: colorAccent, // background
            onPrimary: Colors.black, // foreground
          ),
          onPressed: () {
            /// метод для очистки всех задач
            controller.deleteListTask();
            Get.back();
          },
          child: Text("Delete"), // cancel, //
        ),
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

  @override
  PreferredSizeWidget? buildAppbar() {
    return null;
    // return getAppBar(context, "HomeScreen", leading: getBack());
  }

}

/// ===== разбивка на части ==== OPTION + COMMAND + M