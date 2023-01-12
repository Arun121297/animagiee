import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/view/instancepage/controller/userprofie_viewController.dart';
import 'package:animagieeui/view/profilepage/view/MyFavourites/controllers/favourite_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../config/colorconfig.dart';

class Setting_UI extends StatefulWidget {
  String? id;
  Setting_UI({this.id});

  @override
  State<Setting_UI> createState() => _Setting_UIState();
}

class _Setting_UIState extends State<Setting_UI> {
  FavouriteController favouriteController = Get.put(FavouriteController());
  UserPostProfileController userPostProfileController = Get.find();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => btmsheet(),
      child: Container(
        alignment: Alignment.center,
        height: 5.0.hp,
        // 30,
        width: 8.0.wp,
        // 31,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            width: 1,
            color: animagiee_CL,
          ),
        ),
        child: Image.asset(
          width: 17.0,
          "images/Vectorimage.png",
          // cacheHeight: 16,
          // cacheWidth: 16,
        ),
      ),
    );
  }

  btmsheet() {
    return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      builder: (context) {
        return SizedBox(
          height: 130,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Report",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 10.0.sp,
                    color: club_Text_1,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const Divider(
                color: Colors.black,
                endIndent: 30,
                indent: 30,
                // height: 5,
              ),
              InkWell(
                onTap: () {
                  userPostProfileController.data[0].blocked =
                      !userPostProfileController.data[0].blocked!;
                  favouriteController.blockUnblock(userId: widget.id);

                  Get.back();
                },
                child: Text(
                  userPostProfileController.data[0].blocked!
                      ? "Unblock"
                      : "Block",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 10.0.sp,
                      color: dummycontent_Cl,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
