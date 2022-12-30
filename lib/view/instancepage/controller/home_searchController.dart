import 'package:animagieeui/view/instancepage/model/home_search.dart';
import 'package:animagieeui/view/instancepage/service/search_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SearchHomeController extends GetxController {
  final List<HomeSearchModel> searchUserList = [];

  final List<Datum> userList = [];

  RxBool isLoadingService = true.obs;
  RxBool textFocus = false.obs;
  //var loginData = List<FarmerLoginModel>().obs;
  TextEditingController searchTextController = TextEditingController();
  List<HomeSearchModel> get homeSearchList {
    return [...searchUserList];
  }

  Future<void> searchUserListRequest(String userName) async {
    isLoadingService(false);
    // if (!isLoadingService.value) {
    //   _loadingBar(ctx);
    // }
    searchUserList.clear();
    userList.clear();

    try {
      var homeSearchListData =
          await SearchHomeServices.searchHomeService(userName);

      if (homeSearchListData != null) {
        searchUserList.add(homeSearchListData);
        userList.addAll(searchUserList[0].data!);

        isLoadingService(true);
      } else {
        isLoadingService(true);
      }
    } catch (error) {
      rethrow;
    }
  }
}
