import 'package:animagieeui/config/extension.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../chats/chatscreen1.dart';

class Chat_Icon_UI extends StatelessWidget {
  const Chat_Icon_UI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(Chat_UI());
      },
      child: SizedBox(
        height: 5.5.hp,
        width: 5.5.wp,
        child: Image.asset("images/chat.png"),
      ),
    );
  }
}
