import 'package:animagieeui/view/homepage/view/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppbarContainer(
              title: "My Communities",
              backarrow: true,
              chat: false,
              notification: true,
              search: true,
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
            controller.communitylist.isEmpty
                ? Align(
                    heightFactor: 30,
                    child: Container(
                      alignment: Alignment.center,
                      child: Text("No Datas"),
                    ),
                  )
                : SizedBox(
                    height: MediaQuery.of(context).size.height - 290,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.communitylist.length,
                        itemBuilder: (context, index) => My_Sub_List_Content(
                              fetchindex: index,
                            )),
                  )
          ],
        ),
      ),
    );
  }
}
