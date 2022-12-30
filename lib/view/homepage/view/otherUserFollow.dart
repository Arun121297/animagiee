import 'package:animagieeui/config/colorconfig.dart';
import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/view/instancepage/controller/otherUserFollowController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class OtherUserFollow extends StatefulWidget {
  String id;
  OtherUserFollow({required this.id});

  @override
  State<OtherUserFollow> createState() => _OtherUserFollowState();
}

class _OtherUserFollowState extends State<OtherUserFollow> {
  OtherUserFollowContoller otherUserFollowContoller =
      Get.put(OtherUserFollowContoller());
  @override
  void initState() {
    otherUserFollowContoller.otherUserFollow(id: widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: mywork_container_CL,
        leading: IconButton(
            icon: Icon(Icons.keyboard_arrow_left_sharp),
            color: Colors.black,
            onPressed: () {
              Get.back();
            }),
        title: Text("Followers",
            style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.017,
                    color: availabletime_CL,
                    fontWeight: FontWeight.w600))),
        centerTitle: true,
      ),
      body: Obx(() {
        return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(8),
            itemCount: otherUserFollowContoller
                .otherFollowUserData[0].data![0].followerUser!.length,
            itemBuilder: (BuildContext context, int index) {
              var data = otherUserFollowContoller
                  .otherFollowUserData[0].data![0].followerUser![index];
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: const BoxDecoration(
                    border:
                        Border(bottom: BorderSide(color: mywork_container_CL))),
                height: 70,
                child: Row(
                  children: [
                    data.userid!.profileicon == ''
                        ? CircleAvatar(
                            radius: 20.0.sp,
                            backgroundColor: animagiee_CL,
                            // backgroundImage:
                            //     NetworkImage("${data[widget.fetchindex].profileicon}"),
                            //  50,
                          )
                        : CircleAvatar(
                            radius: 20.0.sp,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  data.userid!.profileicon.toString()),
                              // backgroundColor: animagiee_CL,
                              radius: 40.0.sp,
                            ),
                          ),
                  ],
                ),
              );
            });
      }),
    );
  }
}
