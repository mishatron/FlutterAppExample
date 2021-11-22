import 'package:flutter/material.dart';
import 'package:flutter_app_example/resources/colors.dart';
import 'package:flutter_app_example/resources/icon_button.dart';
import 'package:flutter_app_example/src/core/ui/states/base_statefull_screen.dart';
import 'package:flutter_app_example/src/core/ui/widgets/base_stateful_widget.dart';
import 'package:flutter_app_example/src/ui/addition/addition_screen.dart';
import 'package:flutter_app_example/src/ui/home/home_screen.dart';
import 'package:flutter_app_example/src/ui/main/main_controller.dart';
import 'package:flutter_app_example/src/ui/profile/profile_screen.dart';
import 'package:get/get.dart';

class MainScreen extends BaseStatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainScreenState();
  }
}

class MainScreenState extends BaseStatefulScreen<MainScreen, MainController> {
  @override
  MainController getController() => MainController();

  int pageIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      pageIndex = index;
    });
  }

  @override
  Widget buildBody() {
    return Scaffold(
        appBar: buildAppbar(),
        body: pageList[pageIndex],
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(AdditionScreen());
          },
          child: Icon(
            Icons.add,
            color: Colors.black,
          ),
          elevation: 5.0,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
            color: const Color(0xFFffffb3),
            notchMargin: 6.0,
            shape: CircularNotchedRectangle(),
            child: Container(
              height: 54.0,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 40.0),
                    child: IconTextButton(
                      icon: Icon(Icons.home,
                          color: pageIndex == 0 ? colorAccent : Colors.black),
                      label: "Home",
                      labelStyle: TextStyle(
                          color: pageIndex == 0 ? colorAccent : Colors.black),
                      onTap: () {
                        _onItemTapped(0);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 40.0),
                    child: IconTextButton(
                      icon: Icon(Icons.account_box_outlined,
                          color: pageIndex == 1 ? colorAccent : Colors.black),
                      label: "Profile",
                      labelStyle: TextStyle(
                          color: pageIndex == 1 ? colorAccent : Colors.black),
                      onTap: () {
                        _onItemTapped(1);
                      },
                    ),
                  ),
                ],
              ),
            )));
  }

  @override
  PreferredSizeWidget? buildAppbar() {
    return null;
    //return getAppBar(context, "MainScreen", leading: getBack());
  }

  List<Widget> pageList = <Widget>[
    HomeScreen(),
    ProfileScreen(),
  ];
}






// @override
// Widget? buildFab() {
//   return FloatingActionButton(
//     child: const Icon(Icons.add, color: Colors.black,),
//     onPressed: () {
//       Navigator.push(context, MaterialPageRoute(builder: (context) => AdditionScreen()),);
//     },);
// }

/// --- Variant 2 ------

// import 'package:flutter/material.dart';
// import 'package:flutter_app_example/resources/colors.dart';
// import 'package:flutter_app_example/src/core/ui/states/base_statefull_screen.dart';
// import 'package:flutter_app_example/src/core/ui/widgets/base_stateful_widget.dart';
// import 'package:flutter_app_example/src/ui/addition/addition_screen.dart';
// import 'package:flutter_app_example/src/ui/home/home_screen.dart';
// import 'package:flutter_app_example/src/ui/main/main_controller.dart';
// import 'package:flutter_app_example/src/ui/profile/profile_screen.dart';
// import 'package:flutter_app_example/src/ui/utils/utils.dart';
//
//
// class MainScreen extends BaseStatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return MainScreenState();
//   }
// }
//
// class MainScreenState extends BaseStatefulScreen<MainScreen, MainController> {
//   @override
//   MainController getController() => MainController();
//
//   int pageIndex = 0;
//
//   void _onItemTapped(int index) {
//     setState(() {
//       pageIndex = index;
//     });
//   }
//
//   @override
//   Widget buildBody() {
//     return Scaffold(
//       appBar: buildAppbar(),
//       body: pageList[pageIndex],
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: const Color(0xFFffffb3),
//         selectedIconTheme: IconThemeData(color: colorAccent),
//         selectedItemColor: colorAccent,
//         currentIndex: pageIndex, //New
//         onTap: _onItemTapped,
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home',
//           ),
//           BottomNavigationBarItem(icon: Icon(Icons.add_circle), label: 'Addition',
//           ),
//           BottomNavigationBarItem(icon: Icon(Icons.account_box_outlined), label: 'Profile',
//           ),
//         ],
//       ),
//     );
//   }
//
//   @override
//   PreferredSizeWidget? buildAppbar() {
//     return null;
//     //return getAppBar(context, "MainScreen", leading: getBack());
//   }
//
//
//   static List getList() {
//     List list = List.generate(30, (i) {
//       return "Item ${i + 1}";
//     });
//     return list;
//   }
//
//   List<Widget> pageList = <Widget>[
//     HomeScreen(),
//     AdditionScreen(),
//     ProfileScreen(),
//   ];
//
// }
//
//
//
// // @override
// // Widget? buildFab() {
// //   return FloatingActionButton(
// //     child: const Icon(Icons.add, color: Colors.black,),
// //     onPressed: () {
// //       Navigator.push(context, MaterialPageRoute(builder: (context) => AdditionScreen()),);
// //     },);
// // }

/////// =================

/// ----- variant 3 -------

// import 'package:flutter/material.dart';
// import 'package:flutter_app_example/resources/colors.dart';
// import 'package:flutter_app_example/src/core/ui/states/base_statefull_screen.dart';
// import 'package:flutter_app_example/src/core/ui/widgets/base_stateful_widget.dart';
// import 'package:flutter_app_example/src/ui/addition/addition_screen.dart';
// import 'package:flutter_app_example/src/ui/main/main_controller.dart';
// import 'package:flutter_app_example/src/ui/profile/profile_screen.dart';
// import 'package:flutter_app_example/src/ui/utils/utils.dart';
//
//
// class MainScreen extends BaseStatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return MainScreenState();
//   }
// }
//
// class MainScreenState extends BaseStatefulScreen<MainScreen, MainController> {
//   @override
//   MainController getController() => MainController();
//
//   List itemsList = getList();
//
//   List<Widget> _tabList = [];
//   int _selectedIndex = 0;
//
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
//
//   @override
//   Widget buildBody() {
//     return Scaffold(
//       appBar: buildAppbar(),
//       body: Container(
//         child: ListView.separated(
//             padding: EdgeInsets.only(left: 5.0, right: 5.0),
//             itemBuilder: (context, index){
//               return Dismissible(
//                 key: Key(itemsList[index]),
//                 background: Container(
//                   padding: EdgeInsets.only(right: 15.0),
//                   alignment: AlignmentDirectional.centerEnd,
//                   color: Colors.orange,
//                   child: const Icon(Icons.delete, color: Colors.black),
//                 ),
//                 onDismissed: (direction){
//                   setState(() {
//                     itemsList.removeAt(index);
//                   });
//                 },
//                 direction: DismissDirection.endToStart,
//                 child: Container(
//                   height: 50,
//                   child: Row(
//                     children: [Padding(
//                       padding: const EdgeInsets.all(10.0),
//                       child: Text(itemsList[index]),
//                     )],
//                   ),
//                 ),
//               );
//             },
//             separatorBuilder: (context, index) => Divider(
//               height: 0.1,
//               color: Colors.black,),
//             itemCount: itemsList.length),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       floatingActionButton: FloatingActionButton(
//         child: const Icon(Icons.add, color: Colors.black,),
//         onPressed: () {
//           Navigator.push(context, MaterialPageRoute(builder: (context) => AdditionScreen()),);
//         },),
//
//       bottomNavigationBar: BottomAppBar(
//         color: const Color(0xFFffffb3),
//         shape: CircularNotchedRectangle(),
//         notchMargin: 4.0,
//         child: Row(
//           mainAxisSize: MainAxisSize.max,
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: <Widget>[
//             IconButton(icon: Icon(Icons.home, color: colorAccent),
//               onPressed: () {
//                 print("RABOTAET");
//               },),
//             IconButton(icon: const Icon(Icons.account_box_outlined),
//               onPressed: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()),);
//               },),
//           ],
//         ),
//       ),
//
//
//
//     );
//
//     // Text("MAIN", style: getWhite16(),);
//   }
//
//   @override
//   PreferredSizeWidget? buildAppbar() {
//     return getAppBar(context, "MainScreen", leading: getBack());
//   }
//
//   // @override
//   // Widget? buildFab() {
//   //   return FloatingActionButton(
//   //     child: const Icon(Icons.add, color: Colors.black,),
//   //     onPressed: () {
//   //       Navigator.push(context, MaterialPageRoute(builder: (context) => AdditionScreen()),);
//   //     },);
//   // }
//
//
//   static List getList() {
//     List list = List.generate(30, (i) {
//       return "Item ${i + 1}";
//     });
//     return list;
//   }
//
// }
//
//
//
// // bottomNavigationBar: BottomNavigationBar(
// // onTap: (currentIndex) {
// // _currentIndex = currentIndex;
// // },
// // items: [
// // BottomNavigationBarItem(icon: const Icon(Icons.home, color: Colors.blue), t),
// // BottomNavigationBarItem(icon: const Icon(Icons.account_box_outlined)),
// // ],
// // )
