import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/controller/controller.dart';
import 'package:animagieeui/view/chats/chatscreen1.dart';
import 'package:animagieeui/view/chats/sendbox.dart';
import 'package:animagieeui/view/chats/singlechatoption.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'individualchatcontent.dart';

class Chatting_Screen_UI extends StatelessWidget {
  Chatting_Screen_UI({Key? key}) : super(key: key);
  Controller controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          Container(
            child: Column(
              children: [
                controller.chatscreenapp("Karthi", Chat_UI(), context),
                Expanded(
                    child: ListView.builder(
                        itemCount: 5,
                        itemBuilder: (context, index) =>
                            Individual_Chat_Content(
                              fetchindex: index,
                            ))),
                Send_Box_UI(),
                SizedBox(height: 2.0.hp
                    //  38,
                    ),
              ],
            ),
          ),
          Single_Chat_Options_UI(),
        ]),
      ),
    );
  }
}
