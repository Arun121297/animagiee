import 'package:get/get.dart';

import '../Service/clubcreateservice.dart';
import '../model/createclubmodel.dart';

class CreatedClubController extends GetxController {
  RxBool clubcreatedloadingindicator = true.obs;
  RxList<CreatedClubModel> getcreateclubdata = <CreatedClubModel>[].obs;
  var clint = ClubCreatedService();
  Future clubcreatedcontroller() async {
    var response = await clint.createdclubservice();
    try {
      if (response != null) {
        getcreateclubdata.clear();
        getcreateclubdata.add(response);

        clubcreatedloadingindicator(false);
      } else {
        clubcreatedloadingindicator(false);
      }
    } catch (e) {
      rethrow;
    }
  }
}
