import 'package:animagieeui/config/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controller/controller.dart';

class Community_UI extends StatefulWidget {
  const Community_UI({Key? key}) : super(key: key);

  @override
  State<Community_UI> createState() => _Community_UIState();
}

class _Community_UIState extends State<Community_UI> {
  List Catagaries = [
    "images/Cats.jpg",
    "images/Dogs.jpg",
    "images/Exotic_Birds.jpg",
    "images/Fishes.jpg",
    "images/horse.jpg",
    "images/Livestock.jpg",
    "images/Mammals.jpg",
    "images/Poultry.jpg",
    "images/Reptiles_and_Amphibians.jpg",
  ];
  List CataName = [
    "Cats",
    "Dogs",
    "Exotic_Birds",
    "Fishes",
    "horse",
    "Livestock",
    "Mammals",
    "Poultry",
    "Reptiles&Amphibians"
  ];
  Controller controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35.0.hp,
      // 260,
      width: 90.0.wp,
      //  337,
      child: GridView.builder(
          itemCount: Catagaries.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1.4,
            crossAxisCount: 3,
            crossAxisSpacing: 4,
            mainAxisSpacing: 4,
          ),
          itemBuilder: (context, index) => Obx(() {
                return Stack(children: [
                  GestureDetector(
                    onTap: () {
                      print(CataName[index]);
                      // if (controller.communitylist
                      //     .contains(controller.communitylist[index])) {
                      //   controller.communitylist.removeAt(index);
                      // } else {
                      //   controller.communitylist.add(CataName[index]);
                      // }
                      setState(() {
                        var i = index;
                        controller.data[i] == false
                            ? controller.data[i] = true
                            : controller.data[i] = false;
                        print(controller.data[i]);

                        if (controller.communitylist
                            .contains(CataName[i].toString())) {
                          controller.communitylist.removeWhere(
                              (element) => element == (CataName[i]));
                        } else {
                          controller.communitylist.add(CataName[index]);
                        }
                        print(controller.communitylist);
                      });
                    },
                    child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              Catagaries[index],
                            ),
                            colorFilter: ColorFilter.mode(
                                Colors.black38, BlendMode.darken),
                          ),
                          borderRadius: BorderRadius.circular(15.0.sp),
                        ),
                        child: Text(
                          CataName[index],
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 10.0.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                        // height: 20,
                        // width: 105,
                        ),
                  ),
                  Visibility(
                    visible: controller.data[index],
                    child: Container(
                      height: 3.0.hp,
                      // 20,
                      width: 6.0.wp,
                      //  20,
                      child: Image.asset("images/success1.png"),
                    ),
                  )
                ]);
              })),
    );
  }
}
