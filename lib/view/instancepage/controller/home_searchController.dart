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
  List<HomeSearchModel> get bemeliUserList {
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
      var bemeliUserListData =
          await SearchHomeServices.searchHomeService(userName);

      if (bemeliUserListData != null) {
        searchUserList.add(bemeliUserListData);
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
