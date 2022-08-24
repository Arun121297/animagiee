import 'package:animagieeui/config/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../chats/chatscreen1.dart';

class Chat_Icon_UI extends StatefulWidget {
  const Chat_Icon_UI({Key? key}) : super(key: key);

  @override
  State<Chat_Icon_UI> createState() => _Chat_Icon_UIState();
}

class _Chat_Icon_UIState extends State<Chat_Icon_UI> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(Chat_UI());
      },
      child: Container(
        height: 5.5.hp,
        width: 5.5.wp,
        child: Image.asset("images/chat.png"),
      ),
    );
  }
}
