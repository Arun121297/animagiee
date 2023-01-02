import 'dart:developer';

import 'package:animagieeui/controller/controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../chat/single_chat/allConstents/firestore_constants.dart';
import '../../../utils/constance.dart';
import '../../bottombarfile/view/bottomnavibar.dart';
import '../../homeAppBar/view/appbar.dart';
// import '../createpost.dart';
import '../controller/homescreen1controller.dart';
import 'adminpost.dart';
import 'createpost.dart';

class Homepage_Wid extends StatefulWidget {
  const Homepage_Wid({Key? key}) : super(key: key);

  @override
  State<Homepage_Wid> createState() => _Homepage_WidState();
}

class _Homepage_WidState extends State<Homepage_Wid> {
  Controller controller = Get.put(Controller());
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  UserPostListController userPostListController =
      Get.put(UserPostListController());
  String? profileImage = "";
  @override
  void initState() {
    // userPostListController.isLoadingService(true);
    userPostListController.ottApiCall();
    controller.podcastplayblutton = false.obs;
    fetchData();
    super.initState();
  }

  fetchData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var userId = sharedPreferences.getString(Constants.userId);
    profileImage = sharedPreferences.getString(Constants.profileImage);
    log(profileImage!);
    setState(() {});
    if (userId!.isNotEmpty) {
      createUserInFirebase(userId);
    }
  }

//for Chat
  Future<void> createUserInFirebase(userId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String myUserName = (prefs.getString(Constants.userName) ?? '');
    String myPhotoUrl = (prefs.getString(Constants.profileImage) ?? '');
    String firebaseToken = (prefs.getString(Constants.firebaseToken) ?? '');
    //for chat
    final QuerySnapshot result = await firebaseFirestore
        .collection(FirestoreConstants.pathUserCollection)
        .where(FirestoreConstants.id, isEqualTo: userId)
        .get();

    final List<DocumentSnapshot> document = result.docs;
    if (document.isEmpty) {
      firebaseFirestore
          .collection(FirestoreConstants.pathUserCollection)
          .doc(userId)
          .set({
        FirestoreConstants.nickname: myUserName,
        // FirestoreConstants.photoUrl: user.photoURL,
        FirestoreConstants.id: userId,
        'createdAt': DateTime.now().millisecondsSinceEpoch.toString(),
        FirestoreConstants.photoUrl: myPhotoUrl,
        FirestoreConstants.chattingWith: null,
        FirestoreConstants.onlineStatus: 'online',
        FirestoreConstants.blockedList: [],
        Constants.firebaseToken: firebaseToken
      });
    } else {
      //update image and name
      firebaseFirestore
          .collection(FirestoreConstants.pathUserCollection)
          .doc(userId)
          .update({
        FirestoreConstants.nickname: myUserName,
        FirestoreConstants.photoUrl: myPhotoUrl,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: const Customized_Bottom_Bar(),
      body: profileImage!.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : WillPopScope(
              onWillPop: () {
                return null!;
              },
              child: SafeArea(
                child: SizedBox(
                  // height: MediaQuery.of(context).size.height,
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
                        searchfunction: true,
                        searchfunctionclose: false,
                        searchlist: "",
                      ),
                      CreatePost(
                        profileImage: profileImage,
                      ),

                      ////adminpost
                      const Expanded(child: Admin_Post())
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
  // AppbarContainer(
  //                 title: "",
  //                 backarrow: false,
  //                 firstscreen: false,
  //                 navipage: null,
  //                 notification: true,
  //                 edit: false,
  //                 notification_back_arrow: false,
  //                 search: true,
  //                 chat: true,
  //                 logo: true,
  //                 podcast: true,
  //                 fun: null,
  //                 searchfunction: true,
  //                 searchfunctionclose: false,
  //               ),

