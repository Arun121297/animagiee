import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../bottombarfile/bottomnavibar.dart';
import '../homeAppBar/appbar.dart';
import '../homeAppBar/chat.dart';
import '../homeAppBar/notification.dart';
import '../homeAppBar/prot.dart';
import '../homeAppBar/search.dart';
import 'adminpost.dart';

import 'createpost.dart';

class Homepage_Wid extends StatefulWidget {
  const Homepage_Wid({Key? key}) : super(key: key);

  @override
  State<Homepage_Wid> createState() => _Homepage_WidState();
}

class _Homepage_WidState extends State<Homepage_Wid> {
  Controller controller = Get.put(Controller());
  @override
  void initState() {
    controller.podcastplayblutton = false.obs;
    // controller.podcastplayblutton = false.obs;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Controller controller = Get.put(Controller());

    return Scaffold(
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: Customized_Bottom_Bar(),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              AppbarContainer(
                title: "",
                backarrow: false,
                firstscreen: false,
                navipage: null,
                notification: true,
                edit: false,
                notification_back_arrow: false,
                search: true,
                chat: true,
                logo: true,
                podcast: true,
                fun: null,
              ),

              ///createpost
              CreatePost(),

              ////adminpost
              Admin_Post()
            ],
          ),
        ),
      ),
    );
  }
}
