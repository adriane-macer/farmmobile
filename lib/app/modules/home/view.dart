import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:farmmobile/app/core/utils/extensions.dart';
import 'package:farmmobile/app/core/values/colors.dart';
import 'package:farmmobile/app/data/models/task.dart';
import 'package:farmmobile/app/modules/home/controller.dart';
import 'package:farmmobile/app/modules/home/widgets/add_card.dart';
import 'package:farmmobile/app/modules/home/widgets/add_dialog.dart';
import 'package:farmmobile/app/modules/home/widgets/extra_custom_card.dart';
import 'package:farmmobile/app/modules/home/widgets/task_card.dart';
import 'package:farmmobile/app/modules/report/view.dart';
import 'package:farmmobile/app/modules/crops/view.dart';
import 'package:farmmobile/app/modules/settings/view.dart';

import 'package:farmmobile/app/modules/crops/binding.dart';

import '../../core/utils/gradientText.dart';


class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 255, 250, 244),
      // appBar: AppBar(
      //   title: Text('Plots',
      //     style: GoogleFonts.roboto(
      //       textStyle: TextStyle(
      //         color: Colors.black,
      //         fontSize: 20.0.sp,
      //         fontWeight: FontWeight.bold,
      //       )
      //     ),
      //   ),
      //   backgroundColor: Colors.transparent,
      //   elevation: 0.0,
      //   actions: <Widget>[
      //     IconButton(
      //       icon: Icon(Icons.plus_one, color: Colors.black),
      //       onPressed: () {
      //         if (controller.tasks.isNotEmpty) {
      //           Get.to(() => AddDialog(), transition: Transition.downToUp);
      //         } else {
      //           EasyLoading.showInfo('Please show your task type');
      //         }
      //       },
      //     )
      //   ],        
      // ),      
      // appBar: _buildAppBar(),
      body: Obx(
        () => IndexedStack(
          index: controller.tabIndex.value,
          children: [
            SafeArea(
              child: ListView(
                children: [

                  Card(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Plots',
                            style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 20.0.sp,
                                fontWeight: FontWeight.bold,
                              )
                            )
                          ),

                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(Colors.orange),
                            ),
                            onPressed: () {
                              if (controller.tasks.isNotEmpty) {
                                Get.to(() => AddDialog(), transition: Transition.downToUp);
                              } else {
                                EasyLoading.showInfo('Please show your plot type');
                              }                              
                            },
                            child: Text('Add Crop'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // ExtraCustomCard(),
                  // Padding(
                  //   padding: EdgeInsets.only(
                  //     left: 5.0.wp, top: 4.0.wp, bottom: 3.0.wp),  
                  //   child: GradientText(
                  //     'Plots',
                      
                      
                  //     style: GoogleFonts.roboto(
                        
                  //         textStyle: TextStyle(
                  //       fontSize: 20.0.sp,
                  //       fontWeight: FontWeight.bold,
                  //     )),
                      
                  //     gradient: LinearGradient(colors: [
                  //       Color.fromARGB(255, 0, 0, 0),
                  //       Color.fromARGB(255, 95, 110, 138),
                  //     ]),
                  //   ),
                  // ),
                  Obx(
                    () => GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      children: [
                        ...controller.tasks
                          .map(
                            (element) => LongPressDraggable(
                                data: element,
                                onDragStarted: () =>
                                    controller.changeDeleting(true),
                                onDraggableCanceled: (_, __) =>
                                    controller.changeDeleting(false),
                                onDragEnd: (_) =>
                                    controller.changeDeleting(false),
                                feedback: Opacity(
                                  opacity: 0.8,
                                  child: TaskCard(task: element),
                                ),
                                child: TaskCard(task: element)),
                          )
                          .toList(),
                        AddCard(),
                      ],
                    ),
                  )
                ],
              ),
            ),
            // GetPage(
            //     name: '/crops',
            //     page: () => CropsPage(),
            //     binding: CropsBinding()
            // ),            
            ReportPage(),
            CropsPage(),
            SettingsPage(),      
          ],
        ),
      ),
      // floatingActionButton: DragTarget<Task>(
      //   builder: (_, __, ___) {
      //     return Obx(
      //       () => FloatingActionButton(
      //         shape: RoundedRectangleBorder(
      //             borderRadius: BorderRadius.circular(10)),
      //         elevation: 0,
      //         backgroundColor:
      //             controller.deleting.value ? Colors.red : Colors.black,
      //         onPressed: () {
      //           if (controller.tasks.isNotEmpty) {
      //             Get.to(() => AddDialog(), transition: Transition.downToUp);
      //           } else {
      //             EasyLoading.showInfo('Please show your task type');
      //           }
      //         },
      //         child: Icon(controller.deleting.value
      //             ? CupertinoIcons.delete
      //             : CupertinoIcons.add),
      //       ),
      //     );
      //   },
      //   onAccept: (Task task) {
      //     controller.deleteTask(task);
      //     EasyLoading.showSuccess('Deleted');
      //   },
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // bottomNavigationBar: BottomNavigationBar(
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.favorite),
      //       label: 'Favorites',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.settings),
      //       label: 'Settings',
      //     ),
      //   ],
        // currentIndex: _currentIndex,
        // onTap: _onItemTapped,
      // ),      
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

//   AppBar _buildAppBar() {
//     return AppBar(
//       backgroundColor: Color.fromARGB(255, 255, 250, 244),
//       elevation: 0,
//       title: Row(
//         children: [
//           Padding(
//             padding: EdgeInsets.only(top: 1.0.wp),
//             child: Container(
//               height: 45,
//               width: 45,
//               // margin: EdgeInsets.only(left: .0.wp),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(10),
//                 child: Image.asset('assets/images/robo_avatar.png'),
//               ),
//             ),
//           ),
//           SizedBox(width: 10),
//           Padding(
//             padding: EdgeInsets.only(top: 1.5.wp),
//             child: GradientText(
//               'ToDo - WishFlow',
//               style: GoogleFonts.inter(
//                   textStyle: TextStyle(
//                       fontSize: 22,
//                       fontWeight: FontWeight.bold,
//                       letterSpacing: 0.5)),
//               gradient: LinearGradient(colors: [
//                 Color.fromARGB(255, 59, 67, 88),
//                 Color.fromARGB(255, 90, 69, 69),
//               ]),
//             ),
//           )
//         ],
//       ),
//       actions: [
//         Padding(
//           padding: EdgeInsets.only(top: 1.0.wp, right: 2.0.wp),
//           child: const Icon(
//             CupertinoIcons.ellipsis_vertical,
//             color: Color.fromARGB(255, 25, 25, 25),
//             size: 25,
//           ),
//         ),
//       ],
//     );
//   }
// }

  Widget _buildBottomNavigationBar() {
    final controller = Get.find<HomeController>();

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 10
          )
        ]
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        child: Theme(
          data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent),
          child: Obx(
            () => BottomNavigationBar(
              onTap: (int index) => controller.changeTabIndex(index),
              currentIndex: controller.tabIndex.value,
              showSelectedLabels: false,
              backgroundColor: Colors.white,
              showUnselectedLabels: false,
              selectedItemColor: Colors.orange,
              unselectedItemColor: Colors.grey.withOpacity(0.7),
              items: [
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(right: 15.0.wp),
                    child: const Icon(
                      Icons.home,
                      size: 30,
                    ),
                  ),
                  label: 'Home'
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(left: 15.0.wp),
                    child: const Icon(
                      Icons.show_chart,
                      size: 30,
                    ),
                  ),
                  label: 'Report'
                ),              
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(right: 15.0.wp),
                    child: const Icon(
                      Icons.local_florist,
                      size: 30,
                    ),
                  ),
                  label: 'Crops'
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(right: 15.0.wp),
                    child: const Icon(
                      Icons.settings,
                      size: 30,
                    ),
                  ),
                  label: 'Settings'
                ),                            
              ],
            ),
          ),
        ),
      ),
    );
  }
}