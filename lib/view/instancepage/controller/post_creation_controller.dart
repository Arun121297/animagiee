import 'dart:io';
import 'package:animagieeui/view/instancepage/model/post_creation/post_creation_model.dart';
import 'package:animagieeui/view/instancepage/model/post_creation/select_group.dart';
import 'package:animagieeui/view/instancepage/service/post_crreation/post_creation_service.dart';
import 'package:animagieeui/view/instancepage/service/post_crreation/select_group.dart';

import 'package:get/get.dart';

class PostCreatioController extends GetxController {

  RxBool posttype_bool = true.obs;

  final selectgroup = <Data2>[].obs;

  RxList<SelectGroup> groupvalue = <SelectGroup>[].obs;
  var select = GroupService();
  Future selectgroupcontroller() async {
    final response = await GroupService.groupService();

    try {
      groupvalue.clear();
      if (response != null) {
        groupvalue.add(response);
        selectgroup.value = response.data;
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }

  var emogi = <String>[
    "images/emogi_1.png",
    "images/emoji_2.png",
    "images/emoji_3.png",
    "images/emoji_4.png",
    "images/emoji_5.png",
    "images/emoji_6.png",
    "images/emoji_7.png",
  ].obs;

  RxBool Load = false.obs;

  File file = File("");

  Rx<FilepickerType1> imagevideo = FilepickerType1(type: "", url: "").obs;

//  RxBool updateinstanceloadingindicator = false.obs;
  // RxList<PostCreation> postbutton =
  //     <PostCreation>[].obs;
  // var clint = PostCreation1Service();
  // Future updateinstancecontroller({instancelist}) async {
  //   var response = await clint.postCreationService(instancelist: instancelist);
  //   try {
  //     if (response != null) {
  //       postbutton.clear();
  //       postbutton.add(response);

  //       // updateinstanceloadingindicator(false);

  //     } else {
  //       // updateinstanceloadingindicator(false);
  //     }
  //   } catch (e) {
  //     rethrow;
  //   }
  // }




  File pFprofileimage = File("");

  RxList<PostCreation> postbutton = <PostCreation>[].obs;
  final postdata = <Data1>[].obs;

  FilepickerType1 addImagesOrVideos = FilepickerType1();




  // TextEditingController groupName = TextEditingController();
  // TextEditingController clubDescription = TextEditingController();
  // TextEditingController clubName = TextEditingController();
  // RxBool communityTypeisPrivate = false.obs;
  String id = '';
  // RxString communityTypeisPrivat = ''.obs;
  var clint = PostCreation1Service();
  Future postbutton1() async {
    try {
      var response;
      response = await clint.postCreationService(

        // addImagesOrVideos:
        // posttype: 
        // indiviual: 
        // club:
        // description:
        // tagPeople:



        // clubDescription: clubDescription.text,
        // clubName: clubName.text,
        // community: id,
        // communityTypeisPrivate: communityTypeisPrivate.value,
        // file: pFprofileimage.path,
        // groupName: groupName.text,
      );
      if (response != null) {
        // clubcreationdata.clear();
        // clubcreationdata.add(response);
      } else {
        return null;
      }
    } catch (e) {
      print("e$e");
      rethrow;
    }
  }


}

class FilepickerType1 {
  String? type;
  String? url;
  FilepickerType1({this.type, this.url});
}


 
