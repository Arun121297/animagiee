import 'package:animagieeui/config/colorconfig.dart';
import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/config/size_config.dart';
import 'package:animagieeui/view/homeAppBar/view/networkProfile.dart';
import 'package:animagieeui/view/instancepage/controller/home_searchController.dart';
import 'package:animagieeui/view/userprofile/view/userprofile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountSearch extends StatefulWidget {
  const AccountSearch({Key? key}) : super(key: key);

  @override
  State<AccountSearch> createState() => _AccountSearchState();
}

class _AccountSearchState extends State<AccountSearch> {
  SearchHomeController searchHomeController = Get.find<SearchHomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: mywork_container_CL,
        leading: IconButton(
            icon: const Icon(Icons.keyboard_arrow_left_sharp),
            color: Colors.black,
            onPressed: () {
              Get.back();
            }),
        title: Text("Related users",
            style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.017,
                    color: availabletime_CL,
                    fontWeight: FontWeight.w600))),
        centerTitle: true,
      ),
      body: SizedBox(
        height: SizeConfig.screenHeight,
        child: searchHomeController.userList.isEmpty
            ? const Center(child: Text('No result found'))
            : ListView.builder(
                itemCount: searchHomeController.userList.length,
                itemBuilder: (BuildContext context, int index) {
                  var data = searchHomeController.userList[index];
                  return GestureDetector(
                    onTap: () {
                      Get.to(User_Profile(
                        id: data.id!,
                      ));
                    },
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 1,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.022,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 8.0, right: 8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    data.profileicon == ''
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
                                                  data.profileicon.toString()),
                                              // backgroundColor: animagiee_CL,
                                              radius: 40.0.sp,
                                            ),
                                          ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 4.0),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.8,
                                            child: Text(
                                              data.username ?? 'No name',
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                  fontSize: 14.0,
                                                  color: availabletime_CL,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.010,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 1,
                          height: 0.3,
                          color: Colors.grey,
                        )
                      ],
                    ),
                  );
                }),
      ),
    );
  }
}
