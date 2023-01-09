import 'package:animagieeui/config/extension.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../chat/single_chat/allConstents/firestore_constants.dart';
import '../../../chat/single_chat/chat_page.dart';
import '../../../config/colorconfig.dart';
import '../../instancepage/controller/userprofie_viewController.dart';

class Message_Button_UI extends StatefulWidget {
  Message_Button_UI({
    Key? key,
    required this.userId,
  }) : super(key: key);
  String? userId;

  @override
  State<Message_Button_UI> createState() => _Message_Button_UIState();
}

class _Message_Button_UIState extends State<Message_Button_UI> {
  UserPostProfileController userPostProfileController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() => userPostProfileController.data.isEmpty
        ? const SizedBox()
        : Padding(
            padding: EdgeInsets.only(top: 47.0.sp, right: 10),
            child: Align(
              alignment: Alignment.bottomRight,
              heightFactor: 5,
              child: SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // Text("1,22 Member"),
                    GestureDetector(
                      onTap: () {
                        // Fluttertoast.showToast(msg: "yes");
                        FirebaseFirestore.instance
                            .collection(FirestoreConstants.pathUserCollection)
                            .doc(widget.userId)
                            .get()
                            .then((doc) {
                          if (doc.exists) {
                            Get.to(() => ChatPage(
                                  peerNickname: userPostProfileController
                                          .data.first.username ??
                                      "",
                                  peerAvatar: userPostProfileController
                                          .data.first.profileicon ??
                                      "",
                                  peerId: widget.userId ?? "",
                                ));
                          } else {
                            //check other user updated the app?, if not show "This user doesn't have the updated version of the app to chat, "
                            showDialog(
                                context: context,
                                builder: (BuildContext context) =>
                                    StatefulBuilder(
                                        builder: (context, setState) {
                                      return Dialog(
                                        child: SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              6,
                                          child: Column(
                                            children: [
                                              Container(
                                                margin: EdgeInsets.only(
                                                  bottom: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.04,
                                                ),
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    20,
                                                width: double.infinity,
                                                color: animagiee_CL,
                                                child: InkWell(
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Align(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    child: Padding(
                                                      padding: EdgeInsets.only(
                                                          right: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.03),
                                                      child: const Icon(
                                                        Icons.close,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                'unable to chat with this  person!',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.04,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    }));
                          }
                        });

                        // Get.to(() => ChatListingScreen());
                      },

                      // onTap: () {
                      //   // print(controller.communitylist.length);
                      //   // Get.to(Chatting_Screen_UI());
                      // },
                      child: Container(
                        height: 3.0.hp,
                        // 26,
                        width: 25.0.wp,
                        // 90,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: animagiee_CL,
                            borderRadius: BorderRadius.circular(15)),
                        child: Text(
                          "Message",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 9.0.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ));
  }
}
