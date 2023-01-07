import 'dart:io';

import 'package:animagieeui/view/club/models/club_request_list.dart';
import 'package:animagieeui/view/club/service/club_service.dart';
import 'package:animagieeui/view/instancepage/model/club.dart';
import 'package:animagieeui/view/post/models/joined_club_model.dart';
import 'package:animagieeui/view/post/models/my_friends_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:animagieeui/chat/group_chat/allConstents/firestore_constants.dart';
import 'package:animagieeui/view/instancepage/service/club_service.dart';
import 'package:flutter/cupertino.dart';

class ClubController extends GetxController {
  MyClubService service = MyClubService();

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

  // club join request
  Future clubJoinRequest({required clubId}) async {
    try {
      var data = await service.clubJoinRequest(clubId: clubId);
      if (data != null) {}
    } catch (e) {
      rethrow;
    }
  }

// club request accept
  Future clubRequestAccept({required requestId, required index}) async {
    try {
      var data = await service.clubAcceptRequest(requestId: requestId);
      if (data != null) {
        clubRequestList.first.data!.removeAt(index);
      }
    } catch (e) {
      rethrow;
    }
  }

  // club request reject
  Future clubRequestReject({required requestId, required index}) async {
    try {
      var data = await service.clubRejectrequest(requestId: requestId);
      if (data != null) {
        clubRequestList.first.data!.removeAt(index);
      }
    } catch (e) {
      rethrow;
    }
  }

// delete club
  Future deleteClub({required clubId, required index}) async {
    try {
      var data = await service.deleteClub(clubId: clubId);
      if (data != null) {}
    } catch (e) {
      rethrow;
    }
  }

  // leave from club
  Future leaveFromCLub({required clubId, required index}) async {
    try {
      var data = await service.leaveFromClub(clubId: clubId);
      if (data != null) {}
    } catch (e) {
      rethrow;
    }
  }

  final RxList<ClubRequestList> _clubRequestList = <ClubRequestList>[].obs;
  RxList<ClubRequestList> get clubRequestList => _clubRequestList;
  RxBool isClubRequestListLoading = true.obs;
  Future getClubRequestList({required clubId}) async {
    isClubRequestListLoading(true);
    try {
      var data = await service.clubJoinRequestList(clubId: clubId);
      _clubRequestList.clear();
      if (data != null) {
        _clubRequestList.add(data);
        isClubRequestListLoading(false);
      } else {
        isClubRequestListLoading(false);
      }
    } catch (e) {
      rethrow;
    }
  }

  ///////////////////
  /* JOINED CLUB */
  ///////////////////
  final RxList<JoinedClubModel> _joinedClubList = <JoinedClubModel>[].obs;
  RxList<JoinedClubModel> get joinedClubList => _joinedClubList;
  RxBool isJoinedClubLoading = true.obs;
  Future getJoinedClub() async {
    isJoinedClubLoading(true);
    try {
      _joinedClubList.clear();
      var data = await service.getJoinedClub();
      if (data != null) {
        _joinedClubList.add(data);
        isJoinedClubLoading(false);
      } else {
        isJoinedClubLoading(false);
      }
    } catch (e) {
      rethrow;
    }
  }

  RxList<bool> tagPeopleList = <bool>[].obs;
  RxList<String> tagPeople = <String>[].obs;
  String selectedUserList = "";

// get my frineds
  final RxList<MyFriendsModel> _myFriendsList = <MyFriendsModel>[].obs;
  RxList<MyFriendsModel> get myFrinedsList => _myFriendsList;
  RxBool isMyFriendsLoading = true.obs;
  // get my friends
  Future getMyFriends() async {
    // tagPeopleList.clear();
    isMyFriendsLoading(true);
    try {
      _myFriendsList.clear();
      var data = await service.getMyFriends();
      if (data != null) {
        tagPeopleList.clear();

        _myFriendsList.add(data);
        if (data.data!.isNotEmpty) {
          for (var i = 0; i < data.data!.length; i++) {
            tagPeopleList.add(false);
            if (tagPeople.contains(data.data![i].id.toString())) {
              tagPeopleList[i] = true;
            }
          }
        }
        isMyFriendsLoading(false);
      } else {
        isMyFriendsLoading(false);
      }
    } catch (e) {
      rethrow;
    }
  }
}
