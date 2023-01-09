import 'package:animagieeui/chat/single_chat/chat_listing_screen.dart';
import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/utils/constance.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Chat_Icon_UI extends StatefulWidget {
  const Chat_Icon_UI({Key? key}) : super(key: key);

  @override
  State<Chat_Icon_UI> createState() => _Chat_Icon_UIState();
}

class _Chat_Icon_UIState extends State<Chat_Icon_UI> {
  String? userId;
  @override
  void initState() {
    fetchData();
    super.initState();
  }

  fetchData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    userId = sharedPreferences.getString(Constants.userId);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Get.to(const Chat_UI());
        if (userId != null && userId!.isNotEmpty) {
          // Get.to(() => Chat_UI(
          //       userId: userId,
          //     ));

          Get.to(() => ChatListingScreen(userId!));
        }
      },
      child: SizedBox(
        height: 5.5.hp,
        width: 5.5.wp,
        child: Image.asset("images/chat.png"),
      ),
    );
  }
}
