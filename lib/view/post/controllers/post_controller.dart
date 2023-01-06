import 'dart:io';
import 'dart:math';

import 'package:animagieeui/view/post/models/joined_club_model.dart';
import 'package:animagieeui/view/post/models/my_friends_model.dart';
import 'package:animagieeui/view/post/services/post_service.dart';
import 'package:animagieeui/view/post/views/trimmer_view.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:animagie_image_editor/bemeli_image_editor.dart' as b;

import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:get/get.dart';

class PostController extends GetxController {
//my profile image
  RxString profileImage = "".obs;
  // my userID
  RxString userId = "".obs;
  // my user name
  RxString userName = "".obs;

  Rx<File> filepick = File('').obs;
  RxString fileType = "".obs;
  Rx<PostFilepickerType> imagevideo =
      PostFilepickerType(type: "", url: File('')).obs;
  RxBool isLoadingService = true.obs;
  TextEditingController description = TextEditingController();
  var clint = PostService();
  RxBool isSinglePostLoading = true.obs;
  RxList<bool> tagPeopleList = <bool>[].obs;
  RxList<String> tagPeople = <String>[].obs;
  RxString postType = "".obs;
  String selectedUserList = "";
  RxString selectedClubId = "".obs;
  Future<bool?> individualpost(context) async {
    if (imagevideo.value.url!.path.isEmpty) {
      Fluttertoast.showToast(msg: "Please select photo/video");
    } else {
      isSinglePostLoading(true);
      if (isSinglePostLoading.value) {
        loadingBar(context);
      }
      try {
        selectedUserList = '';
        if (tagPeople.isNotEmpty) {
          for (int i = 0; i < tagPeople.length; i++) {
            if (selectedUserList == '') {
              selectedUserList = tagPeople[i];
            } else {
              selectedUserList = '$selectedUserList,${tagPeople[i]}';
            }
          }
        }
        final res = await clint.createSinglePost(
            posttype: imagevideo.value.type,
            addimageorvideo: imagevideo.value.url!.path,
            description: description.text,
            clubId: postType.value == "single" ? "" : selectedClubId.value,
            tagpeople: selectedUserList.toString());

        if (res != null) {
          filepick(File(""));
          imagevideo(PostFilepickerType(type: "", url: File("")));
          description.clear();
          selectedUserList = "";
          tagPeople.clear();
          fileType("");
          tagPeopleList.clear();
          postType("single");
          selectedClubId("");
          Get.back();
          Fluttertoast.showToast(msg: res.message ?? "");
          isLoadingService(false);
          return true;
        } else {
          Get.back();
          isLoadingService(false);
          return false;
        }
      } catch (e) {
        rethrow;
      }
    }
    return null;
  }

  final RxList<MyFriendsModel> _myFriendsList = <MyFriendsModel>[].obs;
  RxList<MyFriendsModel> get myFrinedsList => _myFriendsList;
  RxBool isMyFriendsLoading = true.obs;
  // get my friends
  Future getMyFriends() async {
    // tagPeopleList.clear();
    isMyFriendsLoading(true);
    try {
      _myFriendsList.clear();
      var data = await clint.getMyFriends();
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

  // pick image /video from gallery

  Future pickFileFromGallery(Function generateThumbnail, FileType type) async {
    FilePickerResult? pickedFile =
        await FilePicker.platform.pickFiles(type: type);

    if (pickedFile != null) {
      PlatformFile file = pickedFile.files.first;

      filepick(File(file.path.toString()));

      // controller.file = File(result.path);
      file.extension == "jpg" ||
              file.extension == "jpeg" ||
              file.extension == "png"
          ? imagevideo(PostFilepickerType(type: "image", url: filepick.value))
          : imagevideo(PostFilepickerType(type: "video", url: filepick.value));

      if (imagevideo.value.type == "image") {
        fileType("file");
        final dir = await path_provider.getApplicationDocumentsDirectory();

        final file = File(imagevideo.value.url!.path);

        final result = await FlutterImageCompress.compressAndGetFile(
          file.absolute.path,
          '${dir.path}/' +
              Random().nextInt(100000).toString().padLeft(6, '0') +
              ".jpg",
          quality: 30,
        );

        if (result != null) {
          print('this file -->$result');
          var f = await Get.to(() => b.ImageEditor(
                image: result,
              ));

          if (f != null) {
            File file = f;
            imagevideo(PostFilepickerType(type: "image", url: file));
            var decodedImage = await decodeImageFromList(
                imagevideo.value.url!.readAsBytesSync());

            // mediaWidth(decodedImage.width);
            // mediaHeight(decodedImage.height);
            // generateThumbnailForVideo(image.value.path);
          }
          // cropImage(result);
        }
      } else {
        final videoFile = File(filepick.value.path);
        final dir = await path_provider.getTemporaryDirectory();
        File path = videoFile.renameSync(
            "${dir.path}${Random().nextInt(100000).toString().padLeft(6, '0')}.mp4");

        // PlatformFile fileV = result.files.first;

        // getFileSize(path.path);

        Get.to(() => TrimmerView(
                  file: path,
                  duration: 30,
                ))!
            .then((value) {
          generateThumbnail();
        });
      }
    } else {
      return null;
      // User canceled the picker
    }
  }

  Future pickCamera() async {
    final ImagePicker imagePicker = ImagePicker();

    final pickedImage = await imagePicker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      imagevideo(
          PostFilepickerType(type: "image", url: File(pickedImage.path)));
      fileType("camera");
      if (imagevideo.value.type == "image") {
        final dir = await path_provider.getApplicationDocumentsDirectory();

        final file = File(imagevideo.value.url!.path);

        final result = await FlutterImageCompress.compressAndGetFile(
          file.absolute.path,
          '${dir.path}/' +
              Random().nextInt(100000).toString().padLeft(6, '0') +
              ".jpg",
          quality: 30,
        );

        if (result != null) {
          print('this file -->$result');
          var f = await Get.to(() => b.ImageEditor(
                image: result,
              ));

          if (f != null) {
            File file = f;
            imagevideo(PostFilepickerType(type: "image", url: file));
            var decodedImage = await decodeImageFromList(
                imagevideo.value.url!.readAsBytesSync());

            // mediaWidth(decodedImage.width);
            // mediaHeight(decodedImage.height);
            // generateThumbnailForVideo(image.value.path);
          }
          // cropImage(result);
        }
      }
      // filepick(File(result.path));
      // log(controller.filepick.value.path);
      // clubController.pFprofileimage = File(result.path);
      // log("${clubController.pFprofileimage.path}");
      // controller.file = File(result.path);
      // homescreenCreatePost
      //     .imagevideo(PostFilepickerType(type: "image", url: result.path));
      // homescreenCreatePost
      //     .imagevideo(PostFilepickerType(type: "video", url: result.path));
      // controller.imagevideo(FilepickerType(type: "image", url: result.path));

    } else {
      return null;
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
      var data = await clint.getJoinedClub();
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
}

class PostFilepickerType {
  String? type;
  File? url;
  PostFilepickerType({this.type, this.url});
}

// loading animation
void loadingBar(BuildContext ctx) {
  showDialog(
      barrierDismissible: false,
      context: ctx,
      builder: (BuildContext context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      });
}

// class TagPeopleList {
//   bool? select;
//   String? userId;
//   TagPeopleList({required this.select, required this.userId});
// }
getFileSize(String filepath) async {
  var file = File(filepath);
  int bytes = await file.length();
  if (bytes <= 0) return "0 B";
  const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
  var i = (log(bytes) / log(1024)).floor();
  var value = '${(bytes / pow(1024, i)).toStringAsFixed(2)} ${suffixes[i]}';
}
