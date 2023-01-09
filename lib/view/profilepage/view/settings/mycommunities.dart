import 'package:animagieeui/config/constant.dart';
import 'package:animagieeui/view/club/controllers/my_club_controller.dart';
import 'package:animagieeui/view/homepage/view/homepage.dart';
import 'package:animagieeui/view/instancepage/controller/instancecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../controller/controller.dart';
import '../../../communitypage/view/clubs/mysubscriptionlist.dart';
import '../../../homeAppBar/view/appbar.dart';

class My_Communities_UI extends StatefulWidget {
  const My_Communities_UI({Key? key}) : super(key: key);

  @override
  State<My_Communities_UI> createState() => _My_Communities_UIState();
}

class _My_Communities_UIState extends State<My_Communities_UI> {
  Controller controller = Get.put(Controller());
  InstanceContoroller instanceContoroller = Get.put(InstanceContoroller());
  MyClubController clubController = Get.put(MyClubController());
  String myUserId = "";
  @override
  void initState() {
    fetchData();
    fetchProfile();
    super.initState();
  }

  fetchData() {
    Future.delayed(Duration.zero, () async {
      await clubController.getJoinedClub();
    });
  }

  fetchProfile() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    myUserId = pref.getString(Constant.userId)!;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (clubController.isJoinedClubLoading.value) {
        return const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      } else if (clubController.joinedClubList.isEmpty ||
          clubController.joinedClubList.first.data!.isEmpty) {
        return Scaffold(
          body: Column(
            children: [
              AppbarContainer(
                title: "My Communities",
                backarrow: true,
                chat: false,
                notification: false,
                search: false,
                notification_back_arrow: false,
                logo: false,
                edit: false,
                firstscreen: false,
                navipage: null,
                searchfunction: true,
                searchfunctionclose: false,
                podcast: false,
                fun: Home_Page(),
              ),
              const Center(child: Text("No data found")),
            ],
          ),
        );
      } else {
        var data = clubController.joinedClubList.first.data;
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                AppbarContainer(
                  title: "My Communities",
                  backarrow: true,
                  chat: false,
                  notification: false,
                  search: false,
                  notification_back_arrow: false,
                  logo: false,
                  edit: false,
                  firstscreen: false,
                  navipage: null,
                  searchfunction: true,
                  searchfunctionclose: false,
                  podcast: false,
                  fun: Home_Page(),
                ),

                // controller.clubapp("My Communities", Home_Page(), context),
                SizedBox(
                  height: MediaQuery.of(context).size.height - 290,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: data!.length,
                      itemBuilder: (context, index) => My_Sub_List_Content(
                            fetchindex: index,
                            myUserId: myUserId,
                          )),
                )
              ],
            ),
          ),
        );
      }
    });
  }
}
