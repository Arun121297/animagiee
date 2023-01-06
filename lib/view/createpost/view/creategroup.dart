import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/view/post/controllers/post_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CreatePostUI extends StatefulWidget {
  const CreatePostUI({Key? key}) : super(key: key);

  @override
  State<CreatePostUI> createState() => _CreatePostUIState();
}

class _CreatePostUIState extends State<CreatePostUI> {
  PostController controller = Get.find();
  // Controller controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0.sp)),
        elevation: 3,
        child: Stack(children: [
          Obx(
            () => Container(
              height: 8.0.hp,
              //  60,
              width: 94.0.wp,
              //  339,
              // color: Colors.green,
              padding: const EdgeInsets.all(8.0),
              child: DropdownButton<String>(
                hint: const Text("Select Group"),
                dropdownColor: Colors.grey.shade300,
                isExpanded: true,
                value: controller.selectedClubId.isEmpty
                    ? null
                    : controller.selectedClubId.value,
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.black,
                ),
                elevation: 16,
                style: const TextStyle(color: Color.fromRGBO(176, 176, 176, 1)),
                underline: Container(
                  height: 2,
                  color: Colors.transparent,
                ),
                onChanged: (String? newValue) {
                  controller.selectedClubId(newValue);
                },
                items: controller.joinedClubList.isEmpty ||
                        controller.joinedClubList.first.data!.isEmpty
                    ? [].map<DropdownMenuItem<String>>((value) {
                        return DropdownMenuItem<String>(
                            value: value,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Container(
                                    height: 6.0.hp,
                                    //  45,
                                    width: 12.0.wp,
                                    // 55,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(10.0.sp),
                                      image: const DecorationImage(
                                        image: AssetImage(
                                            "images/profilephotos.jpg"),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    value,
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        fontSize: 9.0.sp,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ));
                      }).toList()
                    : controller.joinedClubList.first.data!
                        .map<DropdownMenuItem<String>>((value) {
                        return DropdownMenuItem<String>(
                            value: value.clubid,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Container(
                                    height: 6.0.hp,
                                    //  45,
                                    width: 12.0.wp,
                                    // 55,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(10.0.sp),
                                      image: value.clubicon!.isEmpty
                                          ? const DecorationImage(
                                              image: AssetImage(
                                                  "images/profilephotos.jpg"),
                                            )
                                          : DecorationImage(
                                              image: NetworkImage(
                                                  value.clubicon ?? ""),
                                            ),
                                    ),
                                  ),
                                  Text(
                                    value.clubName ?? "",
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        fontSize: 9.0.sp,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ));
                      }).toList(),
              ),
              //  Row(children: [
              //   Container(
              //     height: 6.0.hp, //  45,
              //     width: 12.0.wp,
              //     // 55,
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(10.0.sp),
              //       image: DecorationImage(
              //         image: AssetImage("images/profilephotos.jpg"),
              //       ),
              //     ),
              //   ),
              //   Text(
              //     "Arun's Group",
              //     style: GoogleFonts.poppins(
              //       textStyle: TextStyle(
              //         fontSize: 9.0.sp,
              //         color: Colors.black,
              //         fontWeight: FontWeight.w600,
              //       ),
              //     ),
              //   ),
              //   Expanded(child: Container()),
              //   Icon(Icons.keyboard_arrow_down),
              //   SizedBox(
              //     width: 12,
              //   )
              // ]),
            ),
          ),
          Obx(() {
            return Visibility(
              visible: controller.postType.value == "single" ? true : false,
              child: Container(
                height: 8.0.hp,
                //  60,
                width: 94.0.wp,
                //  339,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0.sp),
                  color: Colors.black54,
                ),
              ),
            );
          })
        ]),
      ),
    );
  }
}
