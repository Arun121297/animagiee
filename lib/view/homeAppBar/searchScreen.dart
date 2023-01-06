import 'dart:async';

import 'package:animagieeui/config/colorconfig.dart';
import 'package:animagieeui/config/constant.dart';
import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/config/size_config.dart';
import 'package:animagieeui/view/homeAppBar/view/networkProfile.dart';
import 'package:animagieeui/view/homepage/view/accountSearch.dart';
import 'package:animagieeui/view/instancepage/controller/home_searchController.dart';
import 'package:animagieeui/view/userprofile/view/userprofile.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stream_transform/stream_transform.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  SearchHomeController searchHomeController = Get.put(SearchHomeController());
  StreamController<String> streamController = StreamController();
  StreamSubscription<ConnectivityResult>? _connectivitySubscription;
  bool height = true;
  String id = '';
  List<dynamic> list = [];
  void searchUser(String val) {
    if (val == '') {
      list.clear();
      fetchData();
      return;
    }

    list.clear();

    searchHomeController.searchUserListRequest(val).then((value) {
      if (searchHomeController.homeSearchList.isNotEmpty) {
        var data = searchHomeController.homeSearchList[0].data;

        list.addAll(data!);
      }

      // list.add(value)
      setState(() {});
    });
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();

    // In init function
    streamController.stream
        .debounce(const Duration(milliseconds: 500))
        .listen((s) => {
              // your code
              searchUser(s)
            });
  }

  void fetchData() async {
    list.clear();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      id = (prefs.getString(Constant.userId).toString());
    });
  }

  //internet connectivity
  @override
  void dispose() {
    searchHomeController.searchTextController.clear();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1.0,
          centerTitle: false,
          leading: InkWell(
            onTap: () {
              searchHomeController.searchTextController.clear();
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Container(
                margin: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                    color: skip_CL,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5.0,
                          offset: Offset(0.0, 4)),
                    ]),
                child: const Icon(
                  Icons.arrow_back,
                  color: buttonColor1_CL,
                ),
              ),
            ),
          ),
          actions: [
            searchHomeController.textFocus.value
                ? InkWell(
                    onTap: () {
                      searchHomeController.searchTextController.clear();
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Icon(
                        Icons.cancel_outlined,
                        color: buttonColor1_CL,
                        size: MediaQuery.of(context).size.height * 0.035,
                      ),
                    ),
                  )
                : Container()
          ],
          titleSpacing: 0.00,
          title: Container(
            height: MediaQuery.of(context).size.height * 0.045,
            // width: MediaQuery.of(context).size.width * 0.7,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: TextField(
              autofocus: false,
              textCapitalization: TextCapitalization.sentences,
              enabled: true,
              controller: searchHomeController.searchTextController,
              onChanged: (value) {
                setState(() {
                  height = true;
                });
                value != ''
                    ? searchHomeController.textFocus(true)
                    : searchHomeController.textFocus(false);
                streamController.add(value);
              },
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.02,
                  color: Colors.grey[800],
                  fontWeight: FontWeight.w500),
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 2),
                //border: InputBorder.none,
                border: const OutlineInputBorder(),
                hintText: "Search for users",
                hintStyle: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.016,
                    color: buttonColor1_CL,
                    fontWeight: FontWeight.w500),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 0),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 0.0),
                  // )
                ),
              ),
            ),
          ),
        ),
        body: SafeArea(child: SingleChildScrollView(
          child: Obx(() {
            if (list.isEmpty && searchHomeController.isLoadingService.value) {
              return Column(
                children: [
                  SizedBox(height: 06.0.hp),
                  Container(
                    child: Image.asset('images/search_home.png'),
                  ),
                  SizedBox(height: 02.00.hp),
                  Text('It seems you have not searched anything.....',
                      style: GoogleFonts.jost(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: buttonColor1_CL))
                ],
              );
            }
            if (!searchHomeController.isLoadingService.value) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Column(
                children: [
                  (list.isNotEmpty)
                      ? Padding(
                          padding: const EdgeInsets.only(left: 5.00),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(top: 10, bottom: 8),
                                child: Text(
                                  "Users",
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      color: availabletime_CL,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              ListView.builder(
                                // physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                                physics: const NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemCount: height
                                    ? list.length > 3
                                        ? 3
                                        : list.length
                                    : list.length,
                                //  padding: EdgeInsets.only(top: 30),
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      id != list[index].id
                                          ? Get.to(() => User_Profile(
                                                id: list[index].id,
                                              ))
                                          : const SizedBox();
                                    },
                                    child: Column(
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              1,
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                          ),
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.020,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8.0, right: 8),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    list[index].profileicon ==
                                                            ''
                                                        ? CircleAvatar(
                                                            radius: 18.0.sp,
                                                            backgroundColor:
                                                                animagiee_CL,
                                                            // backgroundImage:
                                                            //     NetworkImage("${data[widget.fetchindex].profileicon}"),
                                                            //  50,
                                                          )
                                                        : CircleAvatar(
                                                            radius: 18.0.sp,
                                                            backgroundColor:
                                                                Colors.white,
                                                            child: CircleAvatar(
                                                              backgroundImage:
                                                                  NetworkImage(list[
                                                                          index]
                                                                      .profileicon),
                                                              // backgroundColor: animagiee_CL,
                                                              radius: 40.0.sp,
                                                            ),
                                                          ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 4.0),
                                                      child: Column(
                                                        children: [
                                                          SizedBox(
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.8,
                                                            child: Text(
                                                              list[index]
                                                                      .username ??
                                                                  'No name',
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: const TextStyle(
                                                                  fontSize:
                                                                      14.0,
                                                                  color:
                                                                      availabletime_CL,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.010,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              1,
                                          height: 0.3,
                                          color: Colors.grey,
                                        )
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        )
                      : const SizedBox(),
                  height
                      ? list.length > 3
                          ? GestureDetector(
                              onTap: () {
                                // FocusScope.of(context).unfocus();
                                // setState(() {
                                //   this.height = false;
                                // });
                                Get.to(() => AccountSearch())!.then((value) {
                                  if (value) {
                                    FocusScope.of(context).focusedChild;
                                  }
                                });
                              },
                              child: Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 06),
                                  height: SizeConfig.blockSizeVertical! * 10,
                                  child: const Text('See all results',
                                      style:
                                          TextStyle(color: buttonColor1_CL))),
                            )
                          : const SizedBox()
                      : const SizedBox()
                ],
              );
            }
          }),
        )));
  }
}
