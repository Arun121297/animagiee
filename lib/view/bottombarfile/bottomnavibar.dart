import 'package:animagieeui/config/extension.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../controller/controller.dart';

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
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
  }
}
