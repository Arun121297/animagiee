import 'package:animagieeui/config/colorconfig.dart';
import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/view/homepage/view/suggestedlistcontent.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';

import '../controller/suggestedfriendController.dart';

class Suggested_For_You_UI extends StatefulWidget {
  const Suggested_For_You_UI({Key? key}) : super(key: key);

  @override
  State<Suggested_For_You_UI> createState() => _Suggested_For_You_UIState();
}

class _Suggested_For_You_UIState extends State<Suggested_For_You_UI> {
  @override
  void initState() {
    // TODO: implement initState
    sugestedFrindListController.suggestedcontrollerfunction();
    super.initState();
  }

  SugestedFrindListController sugestedFrindListController =
      Get.put(SugestedFrindListController());
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (sugestedFrindListController.isLoadingService.value) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (sugestedFrindListController.Suggesteddata.isEmpty) {
        return const Center(
          child: Text("No Suggested List"),
        );
      } else {
        return Container(
          height: 34.0.hp,
          // height: 260,
          width: MediaQuery.of(context).size.width,
          color: suggested_background_CL,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(10.0.sp),
                child: Row(
                  children: [
                    Text(
                      "Suggested for You",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 8.0.sp,
                          color: buttonColor1_CL,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Expanded(
                        child: Container(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "See All",
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: 8.0.sp,
                                  color: TextContent2_CL,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            )))
                  ],
                ),
              ),
              SizedBox(
                height: 25.0.hp,
                // 200,
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      width: 2.0.wp,
                      //  10,
                    );
                  },
                  scrollDirection: Axis.horizontal,
                  itemCount:
                      sugestedFrindListController.Suggesteddata[0].data!.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.all(8.0.sp),
                  itemBuilder: (context, index) {
                    var data =
                        sugestedFrindListController.Suggesteddata[0].data;
                    return Suggested_List_Content(
                      fetchindex: index,
                    );
                  },
                ),
              ),
            ],
          ),
        );
      }
    });
  }
}
