import 'package:get/get.dart';

import '../controller/controller.dart';
import '../view/communitypage/communitypage.dart';
import '../view/createpost/usercreatepost.dart';
import '../view/doctor/doctor.dart';
import '../view/homepage/homepagewidget.dart';
import '../view/profilepage/myprofile.dart';

Controller controller = Get.put(Controller());
List wid = [
  Homepage_Wid(),
  Community_Page_UI(),
  UserProfile_CreatePost_UI(),
  Doctor(),
  My_Profile_UI()
];
var videoimage_files = [
  {"type": "image", "url": controller.file.path},
];
var image_files = {
  "type": "image",
  "url": controller.file.path,
};
var video_files = {"type": "video", "url": controller.file.path};
