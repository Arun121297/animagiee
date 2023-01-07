import 'dart:developer';
import 'dart:io';

import 'package:animagieeui/chat/group_chat/allConstents/firestore_constants.dart';
import 'package:animagieeui/view/instancepage/model/club.dart';
import 'package:animagieeui/view/instancepage/service/club_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ClubController extends GetxController {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  File pFprofileimage = File("");
  RxList<ClubCreationModel> clubcreationdata = <ClubCreationModel>[].obs;
  RxBool clubcretedataloadingindicator = true.obs;
  final relatedData = <Data>[].obs;
  TextEditingController groupName = TextEditingController();
  TextEditingController clubDescription = TextEditingController();
  TextEditingController clubName = TextEditingController();
  RxBool communityTypeisPrivate = false.obs;
  String id = '';
  RxString communityTypeisPrivat = ''.obs;
  var clint = ClubService();
  List<ClubCreationModel> details = [];
  Future clubApi(
      //   {
      //   clubDescription,
      //   clubName,
      //   community,
      //   communityTypeisPrivate,
      //   file,
      //   groupName,
      // }
      ) async {
    try {
      var response = await clint.clubService(
        clubDescription: clubDescription.text,
        clubName: clubName.text,
        community: id,
        communityTypeisPrivate: communityTypeisPrivate.value,
        file: pFprofileimage.path,
        groupName: groupName.text,
      );
      if (response != null) {
        // clubcreationdata.clear();
        // clubcreationdata.add(response);
        details.add(response);
        // log("edit${details[0].data!.accepted}");
        // log("edit${details[0].data!.clubDescription}");
        // log("edit${details[0].data!.clubName}");
        // log("edit${details[0].data!.clubicon}");
        // log("edit${details[0].data!.clubicon}");
        // log("edit${details[0].data!.community}");
        // // log("edit${details[0].data!.interestedclu}");
        // // log("edit${details[0].data!.communitypersons}");
        // log("edit${details[0].data!.communityTypeisPrivate}");
        return response.data!.id;
      } else {
        return null;
      }
    } catch (e) {
      print("e$e");
      rethrow;
    }
  }

  //for Chat
  Future<void> createUserInFirebase(clubId, ClubCreationModel response) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    //for chat
    final QuerySnapshot result = await firebaseFirestore
        .collection(FirestoreConstants.pathUserCollection)
        .where(FirestoreConstants.id, isEqualTo: clubId)
        .get();

    final List<DocumentSnapshot> document = result.docs;
    if (document.isEmpty) {
      firebaseFirestore
          .collection(FirestoreConstants.pathUserCollection)
          .doc(clubId)
          .set({
        FirestoreConstants.nickname: response.data!.clubName,
        // FirestoreConstants.photoUrl: user.photoURL,
        FirestoreConstants.id: clubId,
        'createdAt': response.data!.createdAt,
        FirestoreConstants.photoUrl: response.data!.clubicon,
        FirestoreConstants.isPrivateGroup:
            response.data!.communityTypeisPrivate,
        FirestoreConstants.communityPersons: response.data!.communitypersons,
        FirestoreConstants.description: response.data!.clubDescription,
        FirestoreConstants.clubAdmin: response.data!.makeBy,
      });
    } else {
      Fluttertoast.showToast(msg: "Something went wrong");
    }
  }
}
