import 'package:animagieeui/config/extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../controller/controller.dart';

import '../communitypage/communitypage.dart';
import '../homepage/homepage.dart';
import '../homepage/homepagewidget.dart';

class Customized_Bottom_Bar extends StatefulWidget {
  const Customized_Bottom_Bar({Key? key}) : super(key: key);

  @override
  State<Customized_Bottom_Bar> createState() => _Customized_Bottom_BarState();
}

class _Customized_Bottom_BarState extends State<Customized_Bottom_Bar> {
  Controller controller = Get.put(Controller());
  _onItemTapped(int index) {
    setState(() {
      controller.selectedIndex.value = index;
      // print(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            offset: const Offset(
              5.0,
              5.0,
            ),
            blurRadius: 15.0,
            spreadRadius: 2.0,
          ), //BoxShadow
        ],
      ),
      height: 56,
      // 6.0.hp,
      // 72,
      child: BottomNavigationBar(
        selectedFontSize: 0,
        iconSize: 20.0.sp,
        showSelectedLabels: false,
        selectedLabelStyle: TextStyle(fontSize: 0),
        unselectedLabelStyle: TextStyle(fontSize: 0),
        // landscapeLayout: BottomNavigationBarLandscapeLayout.ce,
        showUnselectedLabels: false,
        currentIndex: controller.selectedIndex.value,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            label: "",
            icon: Container(
              height: 5.9.hp,
              //  51,
              width: 10.0.wp,
              //  38,
              margin: EdgeInsets.only(bottom: 8.5.sp),
              decoration: BoxDecoration(
                  color: controller.selectedIndex.value == 0
                      ? Colors.black
                      : Colors.transparent,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.0.sp),
                      bottomRight: Radius.circular(20.0.sp))),
              child: Icon(
                Icons.home_outlined,
                color: controller.selectedIndex.value == 0
                    ? Colors.white
                    : Colors.black,
                // size: 19.0.sp,
              ),
            ),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: Container(
                height: 5.9.hp,
                //  51,
                width: 10.0.wp,
                //  38,
                margin: EdgeInsets.only(bottom: 8.5.sp),
                decoration: BoxDecoration(
                    color: controller.selectedIndex.value == 1
                        ? Colors.black
                        : Colors.transparent,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20.0.sp),
                        bottomRight: Radius.circular(20.0.sp))),
                child: SizedBox(
                  // height: 30,
                  // width: 5,
                  child: Image.asset(
                    "images/naveindex2.png",
                    // cacheHeight: 15,
                    // cacheWidth: 35,
                    color: controller.selectedIndex.value == 1
                        ? Colors.white
                        : Colors.black,
                  ),
                )
                //  Icon(
                //   Icons.group,
                //   color: controller.selectedIndex.value == 1
                //       ? Colors.white
                //       : Colors.black,
                //   // size: 19.0.sp,
                // ),
                ),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: Container(
              height: 5.9.hp,
              //  51,
              width: 10.0.wp,
              //  38,
              margin: EdgeInsets.only(bottom: 8.5.sp),
              decoration: BoxDecoration(
                  color: controller.selectedIndex.value == 2
                      ? Colors.black
                      : Colors.transparent,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.0.sp),
                      bottomRight: Radius.circular(20.0.sp))),
              child: Icon(
                Icons.add_circle_outline,
                color: controller.selectedIndex.value == 2
                    ? Colors.white
                    : Colors.black,
                // size: 19.0.sp,
              ),
            ),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: Container(
              height: 5.9.hp,
              //  51,
              width: 10.0.wp,
              //  38,
              margin: EdgeInsets.only(bottom: 8.5.sp),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  // image: DecorationImage(
                  //   image: AssetImage(
                  //     "images/steta.png",
                  //   ),
                  //   fit: BoxFit.fitHeight,
                  // ),
                  color: controller.selectedIndex.value == 3
                      ? Colors.black
                      : Colors.transparent,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.0.sp),
                      bottomRight: Radius.circular(20.0.sp))),
              child: SizedBox(
                height: 3.0.hp,
                // 17,
                //  4.0.hp,
                width: 6.0.wp,
                //  17,
                // 9.0.wp,
                child: Image.asset(
                  "images/steta.png",
                  // fit: BoxFit.fitHeight,
                  color: controller.selectedIndex.value == 3
                      ? Colors.white
                      : Colors.black,
                  // height: 10,
                  // cacheHeight: 19,
                  // scale: 0.1,
                ),
              ),
            ),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: Container(
              height: 5.9.hp,
              //  51,
              width: 10.0.wp,
              //  38,
              margin: EdgeInsets.only(bottom: 8.5.sp),
              decoration: BoxDecoration(
                  color: controller.selectedIndex.value == 4
                      ? Colors.black
                      : Colors.transparent,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.0.sp),
                      bottomRight: Radius.circular(20.0.sp))),
              child: Icon(
                Icons.person_outline,
                color: controller.selectedIndex.value == 4
                    ? Colors.white
                    : Colors.black,
                // size: 19.0.sp,
              ),
            ),
          ),
        ],
      ),
    );
    // return Container(
    //   decoration: BoxDecoration(
    //     color: Colors.white,
    //     boxShadow: [
    //       BoxShadow(
    //         color: Colors.black,
    //         offset: const Offset(
    //           5.0,
    //           5.0,
    //         ),
    //         blurRadius: 15.0,
    //         spreadRadius: 2.0,
    //       ), //BoxShadow
    //     ],
    //   ),
    //   height: 7.5.hp,
    //   // 56,
    //   child:
    //       // ListView.separated(
    //       //   separatorBuilder: (context, index) {
    //       //     return SizedBox(
    //       //       width: 30,
    //       //     );
    //       //   },
    //       //   scrollDirection: Axis.horizontal,
    //       //   itemCount: 5,
    //       //   itemBuilder: (context, index) => Container(
    //       //     height: 7.2.hp,
    //       //     //  51,
    //       //     width: 10.0.wp,
    //       //     //  38,
    //       //     margin: EdgeInsets.only(bottom: 10, left: 10),
    //       //     decoration: BoxDecoration(
    //       //         color: b1 == true ? Colors.black : Colors.white,
    //       //         borderRadius: BorderRadius.only(
    //       //             bottomLeft: Radius.circular(20),
    //       //             bottomRight: Radius.circular(20))),
    //       //     child: IconButton(
    //       //       enableFeedback: false,
    //       //       onPressed: () {
    //       //         setState(() {
    //       //           // b1 = true;
    //       //           // b2 = false;
    //       //           // b3 = false;
    //       //           // b4 = false;
    //       //           // b5 = false;
    //       //         });
    //       //         //  Get.to();
    //       //       },
    //       //       icon: Icon(
    //       //         icon[index],
    //       //         color: b1 == true ? Colors.white : Colors.black,
    //       //         size: 19.0.sp,
    //       //       ),
    //       //     ),
    //       //   ),
    //       // )
    //       Row(
    //     mainAxisAlignment: MainAxisAlignment.spaceAround,
    //     children: [
    //       Container(
    //         height: 7.2.hp,
    //         //  51,
    //         width: 10.0.wp,
    //         //  38,
    //         margin: EdgeInsets.only(bottom: 10),
    //         decoration: BoxDecoration(
    //             color: b1 == true ? Colors.black : Colors.white,
    //             borderRadius: BorderRadius.only(
    //                 bottomLeft: Radius.circular(20),
    //                 bottomRight: Radius.circular(20))),
    //         child: IconButton(
    //           enableFeedback: false,
    //           onPressed: () {
    //             setState(() {
    //               b1 = true;
    //               b2 = false;
    //               b3 = false;
    //               b4 = false;
    //               b5 = false;
    //             });
    //             //  Get.to();
    //           },
    //           icon: Icon(
    //             Icons.home_outlined,
    //             color: b1 == true ? Colors.white : Colors.black,
    //             size: 19.0.sp,
    //           ),
    //         ),
    //       ),
    //       Container(
    //         height: 7.2.hp,
    //         //  51,
    //         width: 10.0.wp,
    //         //  38,
    //         margin: EdgeInsets.only(bottom: 10),
    //         decoration: BoxDecoration(
    //             color: b2 == true ? Colors.black : Colors.white,
    //             borderRadius: BorderRadius.only(
    //                 bottomLeft: Radius.circular(20),
    //                 bottomRight: Radius.circular(20))),
    //         child: IconButton(
    //           enableFeedback: false,
    //           onPressed: () {
    //             setState(() {
    //               b1 = false;
    //               b2 = true;
    //               b3 = false;
    //               b4 = false;
    //               b5 = false;
    //             });
    //             Get.to(Community_Page_UI());
    //           },
    //           icon: Icon(
    //             Icons.group,
    //             color: b2 == false ? Colors.black : Colors.white,
    //             size: 19.0.sp,
    //           ),
    //         ),
    //       ),
    //       Container(
    //         height: 7.2.hp,
    //         //  51,
    //         width: 10.0.wp,
    //         //  38,
    //         margin: EdgeInsets.only(bottom: 10),
    //         decoration: BoxDecoration(
    //             color: b3 == true ? Colors.black : Colors.white,
    //             borderRadius: BorderRadius.only(
    //                 bottomLeft: Radius.circular(20),
    //                 bottomRight: Radius.circular(20))),
    //         child: IconButton(
    //           enableFeedback: false,
    //           onPressed: () {
    //             setState(() {
    //               b1 = false;
    //               b2 = false;
    //               b3 = true;
    //               b4 = false;
    //               b5 = false;
    //             });
    //             //  Get.to();
    //           },
    //           icon: Icon(
    //             Icons.add_circle_outline,
    //             color: b3 == false ? Colors.black : Colors.white,
    //             size: 19.0.sp,
    //           ),
    //         ),
    //       ),
    //       GestureDetector(
    //         onTap: () {
    //           setState(() {
    //             b1 = false;
    //             b2 = false;
    //             b3 = false;
    //             b4 = true;
    //             b5 = false;
    //           });
    //           //  Get.to();
    //         },
    //         child: Container(
    //           height: 7.2.hp,
    //           //  51,
    //           width: 10.0.wp,
    //           //  38,
    //           margin: EdgeInsets.only(bottom: 10),
    //           decoration: BoxDecoration(
    //               // image: DecorationImage(
    //               //     image: AssetImage("images\stethoscope.png")),
    //               color: b4 == true ? Colors.black : Colors.white,
    //               borderRadius: BorderRadius.only(
    //                   bottomLeft: Radius.circular(20),
    //                   bottomRight: Radius.circular(20))),
    //           child: Image.asset(
    //             "images/steta.png",
    //             color: b4 == false ? Colors.black : Colors.white,
    //             cacheHeight: 19,
    //           ),
    //         ),
    //       ),
    //       Container(
    //         height: 7.2.hp,
    //         //  51,
    //         width: 10.0.wp,
    //         //  38,
    //         margin: EdgeInsets.only(bottom: 10),
    //         decoration: BoxDecoration(
    //             color: b5 == true ? Colors.black : Colors.white,
    //             borderRadius: BorderRadius.only(
    //                 bottomLeft: Radius.circular(20),
    //                 bottomRight: Radius.circular(20))),
    //         child: IconButton(
    //           enableFeedback: false,
    //           onPressed: () {
    //             setState(() {
    //               b1 = false;
    //               b2 = false;
    //               b3 = false;
    //               b4 = false;
    //               b5 = true;
    //             });
    //             //  Get.to();
    //           },
    //           icon: Icon(
    //             Icons.person_outline,
    //             color: b5 == false ? Colors.black : Colors.white,
    //             size: 19.0.sp,
    //           ),
    //         ),
    //       ),
    //   ],
    // ),
    // );
  }
}
