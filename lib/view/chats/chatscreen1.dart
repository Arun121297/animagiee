import 'package:animagieeui/config/extension.dart';

import 'package:animagieeui/view/chats/searchbar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/colorconfig.dart';
import '../../controller/controller.dart';

import '../homeAppBar/appbar.dart';
import '../homepage/homepage.dart';
import 'groupchat.dart';
import 'individualchat.dart';

class Chat_UI extends StatefulWidget {
  const Chat_UI({Key? key}) : super(key: key);

  @override
  State<Chat_UI> createState() => _Chat_UIState();
}

class _Chat_UIState extends State<Chat_UI> {
  // List cl = [Colors.accents, Colors.black];
  Controller controller = Get.put(Controller());
  // PageViewController pageViewController = Get.put(PageViewController());
  final PageController pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  var fetchindex;
  @override
  void initState() {
    fetchindex = 0;
    controller.chatoption = false.obs;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              AppbarContainer(
                title: "Chat",
                notification_back_arrow: false,
                firstscreen: false,
                logo: false,
                notification: false,
                search: false,
                backarrow: true,
                chat: false,
                edit: false,
                navipage: null,
                podcast: false,
                fun: Home_Page(),
              ),
              // controller.chatapp("Chat", Home_Page(), context),
              SizedBox(
                height: 3.0.hp,
                // 27,
              ),
              chat_Search_UI(),
              SizedBox(
                height: 4.0.hp,
                //  31,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            pageController.animateToPage(
                              0,
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.easeInOut,
                            );
                          });
                        },
                        child: Text(
                          "Group",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 9.0.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            pageController.animateToPage(
                              1,
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.easeInOut,
                            );
                          });
                        },
                        child: Text(
                          "Inbox",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 9.0.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Container(
                      height: fetchindex == 0 ? 4 : 2,
                      width: 50.0.wp,
                      //  180,
                      color: animagiee_CL),
                  Container(
                    height: fetchindex == 1 ? 4 : 2,
                    width: 50.0.wp,
                    color: animagiee_CL,
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height - 215,
                width: MediaQuery.of(context).size.width,
                child: PageView(
                  onPageChanged: (index) {
                    setState(() {
                      fetchindex = index;
                    });
                  },
                  controller: pageController,
                  children: [Group_Chat_UI(), Separate_Chat_UI()],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
