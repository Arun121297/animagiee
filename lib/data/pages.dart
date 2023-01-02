import 'package:get/get.dart';

import '../controller/controller.dart';
import '../view/communitypage/view/communitypage.dart';
import '../view/createpost/view/usercreatepost.dart';
import '../view/doctor/view/doctor.dart';
import '../view/homepage/view/homepagewidget.dart';
import '../view/profilepage/view/myprofile.dart';

Controller controller = Get.put(Controller());
List wid = [
  const Homepage_Wid(),
  const Community_Page_UI(),
  const UserProfileCreatePostUI(),
  const Doctor(),
  const My_Profile_UI()
];
var videoimage_files = [
  {"type": "image", "url": controller.file.path},
];
var image_files = {
  "type": "image",
  "url": controller.file.path,
};
var video_files = {"type": "video", "url": controller.file.path};
