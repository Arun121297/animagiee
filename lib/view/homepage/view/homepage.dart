import 'package:animagieeui/config/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../controller/controller.dart';
import '../../../../../data/pages.dart';
import '../../bottombarfile/view/bottomnavibar.dart';

class Home_Page extends StatefulWidget {
  Home_Page({Key? key}) : super(key: key);

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  Controller controller = Get.put(Controller());

  //  Controller controller = Get.put(Controller());
  _onItemTapped(int index) {
    setState(() {
      controller.selectedIndex.value = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                offset: Offset(
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
            selectedLabelStyle: const TextStyle(fontSize: 0),
            unselectedLabelStyle: const TextStyle(fontSize: 0),
            // landscapeLayout: BottomNavigationBarLandscapeLayout.ce,
            showUnselectedLabels: false,
            currentIndex: controller.selectedIndex.value,
            selectedItemColor: Colors.amber[800],
            onTap: _onItemTapped,
            items: [
              BottomNavigationBarItem(
                label: "",
                icon: Container(
                  height: 5.5.hp,
                  //  51,
                  width: 10.0.wp,
                  //  38,
                  margin: EdgeInsets.only(bottom: 8.9.sp),
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
                    height: 5.5.hp,
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
                      child: Image.asset(
                        "images/naveindex2.png",
                        color: controller.selectedIndex.value == 1
                            ? Colors.white
                            : Colors.black,
                      ),
                    )),
              ),
              BottomNavigationBarItem(
                label: "",
                icon: Container(
                  height: 5.5.hp,
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
                  height: 5.5.hp,
                  //  51,
                  width: 10.0.wp,
                  //  38,
                  margin: EdgeInsets.only(bottom: 8.5.sp),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
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
                    ),
                  ),
                ),
              ),
              BottomNavigationBarItem(
                label: "",
                icon: Container(
                  height: 5.5.hp,
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
        ),
        body: pages[controller.selectedIndex.value],
      );
    });
    //     body:
    //     Obx(
    //   () => wid[controller.selectedIndex.value],
    //   // ),
    // );
  }
}
