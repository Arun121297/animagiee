import 'dart:io';
import 'dart:math';

import '../../config/colorconfig.dart';
import '../group_chat/allConstents/color_constants.dart';
import '../group_chat/allModels/message_chat.dart';
import '../group_chat/allModels/reply_chat.dart';
import '../group_chat/allWidgets/loading_view.dart';
import '../group_chat/allWidgets/pop_block_button.dart';
import '../group_chat/allWidgets/reply_message_widget.dart';
import '../group_chat/chat_controller.dart';
import '../group_chat/chat_provider.dart';
import '../group_chat/allConstents/firestore_constants.dart';
import '../group_chat/full_photo_page.dart';
import '../../config/constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/src/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import '../group_chat/allConstents/date_time_extension.dart' as times;

class GroupChatPage extends StatefulWidget {
  final String peerId;
  final String peerAvatar;
  final String peerNickname;
  String currentUserId;

  GroupChatPage(
      {Key? key,
      required this.peerId,
      required this.peerAvatar,
      required this.peerNickname,
      required this.currentUserId})
      : super(key: key);

  @override
  State createState() => GroupChatPageState(
      peerId: peerId,
      peerAvatar: peerAvatar,
      peerNickname: peerNickname,
      currentUserId: currentUserId);
}

class GroupChatPageState extends State<GroupChatPage> {
  GroupChatPageState(
      {Key? key,
      required this.peerId,
      required this.peerAvatar,
      required this.peerNickname,
      required this.currentUserId});

  String peerId;
  String peerAvatar;
  String peerNickname;
  late String currentUserId;

  List<QueryDocumentSnapshot> listMessage = List.from([]);
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  int _limit = 20;
  final int _limitIncrement = 20;
  String groupChatId = "";

  File? imageFile;
  bool isLoading = false;
  bool isShowSticker = false;
  String imageUrl = "";
  int messageLength = 0;

  final TextEditingController textEditingController = TextEditingController();
  final ScrollController listScrollController = ScrollController();
  final FocusNode focusNode = FocusNode();
  final ChatController chatController = Get.put(ChatController());

  late GroupChatProvider chatProvider;
  // late AuthProvider authProvider;

  static const inputTopRadius = Radius.circular(12);
  static const inputBottomRadius = Radius.circular(24);
  dynamic replyMessageChat;
  dynamic tempDate;
  String onlineStatus = '';
  late DateTime previousDate;
  bool userExists = true;

  @override
  void initState() {
    super.initState();

    chatProvider = context.read<GroupChatProvider>();
    // authProvider = context.read<AuthProvider>();

    focusNode.addListener(onFocusChange);
    listScrollController.addListener(_scrollListener);
    readLocal();
  }

  Future<void> setZeroToUnreadMssg() async {
    //if last item add timestamp
    await firebaseFirestore
        .collection(FirestoreConstants.pathMessageCollection)
        .doc(groupChatId)
        .collection(groupChatId)
        .get()
        .then((value) => messageLength = value.docs.length - 1);
    //if last item add timestamp
    FirebaseFirestore.instance
        .collection(FirestoreConstants.groupHistory)
        .doc(currentUserId)
        .collection(currentUserId)
        .doc(groupChatId)
        .get()
        .then((doc) {
      if (doc.exists) {
        firebaseFirestore
            .collection(FirestoreConstants.groupHistory)
            .doc(currentUserId)
            .collection(currentUserId)
            .doc(groupChatId)
            .update({FirestoreConstants.unseenMessageCount: 0});
      }
    });
  }

  // Future<void> getOnlineStatus() async {
  //   final DocumentSnapshot<Map<String, dynamic>> result =
  //       await firebaseFirestore
  //           .collection(FirestoreConstants.pathUserCollection)
  //           .doc(peerId)
  //           .get();
  //   var val = result.get('onlineStatus');
  //   //get user viewable status
  //   String data = getStatusData(val);
  //   // setState(() {
  //     onlineStatus = 'data';
  //   // });
  // }

  String getStatusData(var data) {
    String result = '';

    //if status is online
    if (data == 'online') {
      result = data;
    } else {
      final now = DateTime.now();
      final today = DateTime(now.year, now.month, now.day);
      final yesterday = DateTime(now.year, now.month, now.day - 1);
      var date = data.toDate();
      final aDate = DateTime(date.year, date.month, date.day);
      if (aDate == today) {
        //if today
        String formattedTime = DateFormat('h:mm a').format(date);
        result = 'last seen today at $formattedTime';
      } else if (aDate == yesterday) {
        //if yesterday
        String formattedTime = DateFormat('h:mm a').format(date);
        result = 'last seen yesterday at $formattedTime';
      } else {
        //if previous than yesterday
        String formattedTime = DateFormat('dd MMM, h:mm a').format(date);
        result = 'last seen $formattedTime';
      }
    }

    return result;
  }

  // Future<void> createUserInFirebase() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String myUserName = await (prefs.getString(Constant.username) ?? '');
  //   String myPhotoUrl = await (prefs.getString(Constant.profileUrl) ?? '');
  //   //for chat
  //   final QuerySnapshot result = await firebaseFirestore
  //       .collection(FirestoreConstants.pathUserCollection)
  //       .where(FirestoreConstants.id, isEqualTo: currentUserId)
  //       .get();
  //   final List<DocumentSnapshot> document = result.docs;
  //   if (document.length == 0) {
  //     firebaseFirestore
  //         .collection(FirestoreConstants.pathUserCollection)
  //         .doc(currentUserId)
  //         .set({
  //       FirestoreConstants.nickname: myUserName,
  //       // FirestoreConstants.photoUrl: user.photoURL,
  //       FirestoreConstants.id: currentUserId,
  //       'createdAt': DateTime.now().millisecondsSinceEpoch.toString(),
  //       FirestoreConstants.photoUrl: myPhotoUrl,
  //       FirestoreConstants.chattingWith: null,
  //       FirestoreConstants.onlineStatus: 'online',
  //     });
  //   } else {
  //     //update image and name
  //     firebaseFirestore
  //         .collection(FirestoreConstants.pathUserCollection)
  //         .doc(currentUserId)
  //         .update({
  //       FirestoreConstants.nickname: myUserName,
  //       FirestoreConstants.photoUrl: myPhotoUrl,
  //     });
  //   }
  // }

  _scrollListener() {
    if (listScrollController.offset >=
            listScrollController.position.maxScrollExtent &&
        !listScrollController.position.outOfRange) {
      // if (messageLength == index + 1)
      setState(() {
        _limit += _limitIncrement;
      });
    }
  }

  void onFocusChange() {
    if (focusNode.hasFocus) {
      isShowSticker = false;
      chatController.isEmojiVisible.value = false;
    }
  }

  void readLocal() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String uid = (prefs.getString(Constant.userId) ?? '');
    if (uid != "") {
      currentUserId = uid;
    }
    // createUserInFirebase();
    // if (authProvider.getUserFirebaseId()?.isNotEmpty == true) {
    //   currentUserId = authProvider.getUserFirebaseId()!;
    // } else {
    //   Navigator.of(context).pushAndRemoveUntil(
    //     MaterialPageRoute(builder: (context) => LoginPage()),
    //     (Route<dynamic> route) => false,
    //   );
    // }

    if (currentUserId.hashCode <= peerId.hashCode) {
      groupChatId = '$currentUserId-$peerId';
    } else {
      groupChatId = '$peerId-$currentUserId';
    }
    // //set unread messages to 0
    // setZeroToUnreadMssg();

    setState(() {});
    // Fluttertoast.showToast(msg: '$groupChatId');

    chatProvider.updateDataFirestore(FirestoreConstants.pathUserCollection,
        currentUserId, {FirestoreConstants.chattingWith: peerId});
  }

  Future getImage() async {
    focusNode.unfocus();
    ImagePicker imagePicker = ImagePicker();
    PickedFile? pickedFile;

    pickedFile = await imagePicker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      if (imageFile != null) {
        setState(() {
          isLoading = true;
        });
        compressImage();
        // uploadFile();
      }
    }
  }

  void getSticker() {
    focusNode.unfocus();
    setState(() {
      isShowSticker = !isShowSticker;
    });
  }

  Future<void> compressImage() async {
    final dir = await path_provider.getTemporaryDirectory();
    final result = await FlutterImageCompress.compressAndGetFile(
      imageFile!.path,
      "${dir.path}${Random().nextInt(100000).toString().padLeft(6, '0')}.jpg",
      quality: 30,
    );

    if (result != null) {
      uploadFile(result);
    }
  }

  Future uploadFile(File? imgFile) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    UploadTask uploadTask = chatProvider.uploadFile(imgFile!, fileName);
    try {
      TaskSnapshot snapshot = await uploadTask;
      imageUrl = await snapshot.ref.getDownloadURL();
      setState(() {
        isLoading = false;
        onSendMessage(imageUrl, TypeMessage.image);
      });
    } on FirebaseException catch (e) {
      setState(() {
        isLoading = false;
      });
      Fluttertoast.showToast(msg: e.message ?? e.toString());
    }
  }

  void onSendMessage(String content, int type) {
    if (content.trim().isNotEmpty) {
      textEditingController.clear();
      chatProvider.sendMessage(
          content: content,
          type: type,
          groupChatId: groupChatId,
          currentUserId: currentUserId,
          peerId: peerId,
          reply: replyMessageChat != null
              ? ReplyChat(
                  content: replyMessageChat.content,
                  type: replyMessageChat.type,
                  timestamp: DateTime.now().millisecondsSinceEpoch.toString(),
                  idFrom: currentUserId,
                  idTo: replyMessageChat.idFrom,
                )
              : null);
      cancelReply();
      listScrollController.animateTo(0,
          duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
    } else {
      Fluttertoast.showToast(msg: 'Nothing to send');
    }
  }

  bool isLastMessageLeft(int index) {
    if ((index > 0 &&
            listMessage[index - 1].get(FirestoreConstants.idFrom) ==
                currentUserId) ||
        index == 0) {
      return true;
    } else {
      return false;
    }
  }

  bool isLastMessageRight(int index) {
    if ((index > 0 &&
            listMessage[index - 1].get(FirestoreConstants.idFrom) !=
                currentUserId) ||
        index == 0) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> onBackPress() {
    // if (isShowSticker) {
    //   setState(() {
    //     isShowSticker = false;
    //   });
    // }
    if (chatController.isEmojiVisible.value) {
      chatController.isEmojiVisible.value = false;
    } else {
      chatProvider.updateDataFirestore(
        FirestoreConstants.pathUserCollection,
        currentUserId,
        {FirestoreConstants.chattingWith: null},
      );
      Navigator.pop(context);
    }
    return Future.value(false);
  }

  void _callPhoneNumber(String callPhoneNumber) async {
    var url = 'tel://$callPhoneNumber';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Error occurred';
    }
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: isWhite ? Colors.white : Colors.black,
      backgroundColor: const Color(0xffEDECED),
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme:
            IconThemeData(color: Colors.black, size: mediaQuery.width * 0.05),
        // leading: ,
        titleSpacing: (Platform.isAndroid) ? -10.0 : -mediaQuery.width * 0.01,
        centerTitle: false,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Icon(Icons.arrow_back),
            SizedBox(
                height: mediaQuery.width * 0.10,
                width: mediaQuery.width * 0.10,
                // radius: 18,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(mediaQuery.width * 0.05),
                  child: Image.network(
                    widget.peerAvatar,
                    fit: BoxFit.cover,
                  ),
                )),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  peerNickname,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: mediaQuery.width * 0.037,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: mediaQuery.width * 0.01,
                ),
                /*   Container(
                  // width: SizeConfig.blockSizeHorizontal!*40,
                  child: StreamBuilder<DocumentSnapshot>(
                    stream: chatProvider.getOnlineStatus(peerId),
                    builder: (BuildContext context,
                        AsyncSnapshot<DocumentSnapshot> snapshot) {
                      if (!snapshot.hasData) {
                        return Text(
                          'updating...',
                          style: TextStyle(
                            color: Colors.green[600],
                            fontSize: mediaQuery.width * 0.030,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      } else {
                        String data = getStatusData(snapshot.data!
                            .get(FirestoreConstants.onlineStatus));
                        return Text(
                          data,
                          style: TextStyle(
                            color: (data == 'online')
                                ? Colors.green[600]
                                : Colors.grey,
                            fontSize: mediaQuery.width * 0.030,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      }
                    },
                  ),
                ),
               */
              ],
            ),
          ],
        ),
        actions: [
          PopUpBlockButton(
              firebaseFirestore: firebaseFirestore,
              currentUserId: currentUserId,
              peerId: peerId,
              peerNickname: peerNickname,
              chatProvider: chatProvider)
        ],
        // centerTitle: true,
        // actions: [
        //   IconButton(
        //     icon: Icon(
        //       Icons.phone_iphone,
        //       size: 30,
        //       color: ColorConstants.primaryColor,
        //     ),
        //     onPressed: () {

        //       SettingProvider settingProvider;
        //       settingProvider = context.read<SettingProvider>();
        //       String callPhoneNumber =
        //           settingProvider.getPref(FirestoreConstants.phoneNumber) ?? "";
        //       _callPhoneNumber(callPhoneNumber);
        //     },
        //   )
        // ],
      ),
      body: WillPopScope(
        onWillPop: onBackPress,
        child: Stack(
          children: [
            Column(
              children: [
                buildListMessage(),
                isShowSticker ? buildSticker() : const SizedBox.shrink(),
                buildInput(),
              ],
            ),
            buildLoading()
          ],
        ),
      ),
    );
  }

  Widget buildSticker() {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
            border: Border(
                top: BorderSide(color: ColorConstants.greyColor2, width: 0.5)),
            color: Colors.white),
        padding: const EdgeInsets.all(5),
        height: 180,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () => onSendMessage('mimi1', TypeMessage.sticker),
                  child: Image.asset('images/mimi1.gif',
                      width: 50, height: 50, fit: BoxFit.cover),
                ),
                TextButton(
                  onPressed: () => onSendMessage('mimi2', TypeMessage.sticker),
                  child: Image.asset('images/mimi2.gif',
                      width: 50, height: 50, fit: BoxFit.cover),
                ),
                TextButton(
                  onPressed: () => onSendMessage('mimi3', TypeMessage.sticker),
                  child: Image.asset('images/mimi3.gif',
                      width: 50, height: 50, fit: BoxFit.cover),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () => onSendMessage('mimi4', TypeMessage.sticker),
                  child: Image.asset('images/mimi4.gif',
                      width: 50, height: 50, fit: BoxFit.cover),
                ),
                TextButton(
                  onPressed: () => onSendMessage('mimi5', TypeMessage.sticker),
                  child: Image.asset('images/mimi5.gif',
                      width: 50, height: 50, fit: BoxFit.cover),
                ),
                TextButton(
                  onPressed: () => onSendMessage('mimi6', TypeMessage.sticker),
                  child: Image.asset('images/mimi6.gif',
                      width: 50, height: 50, fit: BoxFit.cover),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () => onSendMessage('mimi7', TypeMessage.sticker),
                  child: Image.asset('images/mimi7.gif',
                      width: 50, height: 50, fit: BoxFit.cover),
                ),
                TextButton(
                  onPressed: () => onSendMessage('mimi8', TypeMessage.sticker),
                  child: Image.asset('images/mimi8.gif',
                      width: 50, height: 50, fit: BoxFit.cover),
                ),
                TextButton(
                  onPressed: () => onSendMessage('mimi9', TypeMessage.sticker),
                  child: Image.asset('images/mimi9.gif',
                      width: 50, height: 50, fit: BoxFit.cover),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildLoading() {
    return Positioned(
      child: isLoading ? LoadingView() : const SizedBox.shrink(),
    );
  }

  //For input of user
  Widget buildReply() {
    var mediaQuery = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(mediaQuery.width * 0.015),
      decoration: const BoxDecoration(
        color: Color(0xff9E8CB6),
        borderRadius: BorderRadius.only(
          topLeft: inputTopRadius,
          topRight: inputTopRadius,
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(mediaQuery.width * 0.015),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: inputTopRadius,
            topRight: inputTopRadius,
          ),
        ),
        child: ReplyMessageWidget(
          peerName: (replyMessageChat.idFrom == currentUserId)
              ? 'You'
              : widget.peerNickname,
          message: replyMessageChat.content,
          type: replyMessageChat.type,
          onCancelReply: cancelReply,
        ),
      ),
    );
  }

  Widget buildInput() {
    var mediaQuery = MediaQuery.of(context).size;
    final isReplying = replyMessageChat != null;
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: mediaQuery.width * 0.02,
          vertical: mediaQuery.width * 0.02),
      child: Column(
        children: [
          // if (isReplying) buildReply(),
          isReplying ? buildReply() : Container(),
          Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(
              mediaQuery.width * 0.03,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: mediaQuery.width * 0.015,
                    ),
                    width: double.infinity,
                    // height: mediaQuery.width * 0.15,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          mediaQuery.width * 0.03,
                        ),
                        // border: Border(
                        //     top: BorderSide(
                        //         color: ColorConstants.greyColor2, width: 0.7)),
                        color: Colors.white),
                    child: Row(
                      children: [
                        Material(
                          borderRadius: BorderRadius.circular(
                            mediaQuery.width * 0.03,
                          ),
                          color: Colors.white,
                          child: Container(
                            child: SizedBox(
                              height: mediaQuery.width * 0.1,
                              width: mediaQuery.width * 0.1,
                              child: IconButton(
                                icon: const Icon(Icons.camera_enhance),
                                onPressed: getImage,
                                color: animagiee_CL,
                              ),
                            ),
                          ),
                        ),
                        Material(
                          borderRadius: BorderRadius.circular(
                            mediaQuery.width * 0.03,
                          ),
                          color: Colors.white,
                          child: Container(
                            child: SizedBox(
                              height: mediaQuery.width * 0.1,
                              width: mediaQuery.width * 0.1,
                              child: IconButton(
                                icon: const Icon(Icons.face_retouching_natural),
                                // onPressed: getSticker,
                                onPressed: () {
                                  chatController.isEmojiVisible.value =
                                      !chatController.isEmojiVisible.value;
                                  focusNode.unfocus();
                                  focusNode.canRequestFocus = true;
                                },
                                color: animagiee_CL,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: mediaQuery.width * 0.12,
                          child: Container(
                            color: ColorConstants.greyColor,
                            width: 1,
                          ),
                        ),
                        SizedBox(
                          width: mediaQuery.width * 0.018,
                        ),
                        Flexible(
                          child: TextField(
                            onSubmitted: (value) {
                              onSendMessage(
                                  textEditingController.text, TypeMessage.text);
                            },
                            style: const TextStyle(
                                color: animagiee_CL, fontSize: 15),
                            controller: textEditingController,
                            // decoration: InputDecoration(
                            //   hintText: 'Type your message...',
                            //   hintStyle: TextStyle(color: ColorConstants.greyColor),
                            // ),
                            decoration: const InputDecoration.collapsed(
                              hintText: 'Type your message...',
                              hintStyle:
                                  TextStyle(color: ColorConstants.greyColor),
                            ),
                            focusNode: focusNode,
                            keyboardType: TextInputType.multiline,
                            minLines: 1,
                            maxLines: 5,
                          ),
                        ),
                        Material(
                          borderRadius: BorderRadius.circular(
                            mediaQuery.width * 0.03,
                          ),
                          color: Colors.white,
                          child: Container(
                            margin: EdgeInsets.only(
                              right: mediaQuery.width * 0.02,
                            ),
                            child: CircleAvatar(
                              backgroundColor: animagiee_CL,
                              child: IconButton(
                                icon: const Icon(Icons.send),
                                onPressed: () async {
                                  DocumentSnapshot snapshotBlockedByList =
                                      await firebaseFirestore
                                          .collection(FirestoreConstants
                                              .pathUserCollection)
                                          .doc(currentUserId)
                                          .get();

                                  List blockedByList = [];
                                  // TODO:remove block comment
                                  // (snapshotBlockedByList
                                  //     .data()! as dynamic)["blockedBy"];

                                  DocumentSnapshot snapshotBlockedList =
                                      await firebaseFirestore
                                          .collection(FirestoreConstants
                                              .pathUserCollection)
                                          .doc(currentUserId)
                                          .get();

                                  List blockedList = [];
                                  // (snapshotBlockedList
                                  //     .data()! as dynamic)["blockedList"];

                                  if (blockedByList.contains(peerId)) {
                                    Future.delayed(
                                        const Duration(seconds: 0),
                                        () => showDialog(
                                              context: context,
                                              // user must tap button!
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: const Text(
                                                      'You have been blocked.You cannot send or recieve messages.'),
                                                  actions: <Widget>[
                                                    TextButton(
                                                      child: const Text('Ok'),
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                    ),
                                                  ],
                                                );
                                              },
                                            ));
                                  } else if (blockedList.contains(peerId)) {
                                    Future.delayed(
                                        const Duration(seconds: 0),
                                        () => showDialog(
                                              context: context,
                                              // user must tap button!
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: const Text(
                                                      'You cannot send messages.Unblock user to send messages'),
                                                  actions: <Widget>[
                                                    TextButton(
                                                      child: const Text('Ok'),
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                    ),
                                                  ],
                                                );
                                              },
                                            ));
                                  } else {
                                    onSendMessage(textEditingController.text,
                                        TypeMessage.text);
                                  }
                                },
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Obx(
            () => Offstage(
              offstage: !chatController.isEmojiVisible.value,
              child: SizedBox(
                height: 250,
                child: EmojiPicker(
                  onEmojiSelected: (category, emoji) {
                    textEditingController.text =
                        textEditingController.text + emoji.emoji;
                  },
                  onBackspacePressed: () {},
                  config: const Config(
                      columns: 8,
                      verticalSpacing: 0,
                      horizontalSpacing: 0,
                      initCategory: Category.SMILEYS,
                      bgColor: Color(0xFFF2F2F2),
                      indicatorColor: Colors.blue,
                      iconColor: Colors.grey,
                      iconColorSelected: Colors.blue,
                      // progressIndicatorColor: Colors.blue,
                      showRecentsTab: true,
                      recentsLimit: 28,
                      // noRecentsText: "No Recents",
                      // noRecentsStyle:
                      //     const TextStyle(fontSize: 20, color: Colors.black26),
                      // tabIndicatorAnimDuration: kTabScrollDuration,
                      categoryIcons: CategoryIcons(),
                      buttonMode: ButtonMode.MATERIAL),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildReplyMessage(String message, String from) {
    var mediaQuery = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Text(
        //   name,
        //   style: TextStyle(fontWeight: FontWeight.bold),
        // ),
        // const SizedBox(
        //   height: 8,
        // ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(mediaQuery.width * 0.03),
            child: Text(
              message,
              style: TextStyle(
                  color:
                      (from == 'me') ? const Color(0xff656A6A) : Colors.white,
                  fontSize: mediaQuery.width * 0.037),
            ),
          ),
        )
      ],
    );
  }

  Widget buildReplyImage(
      String name, String message, dynamic type, String from) {
    var mediaQuery = MediaQuery.of(context).size;
    return
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        // Column(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        // Text(
        //   name,
        //   style: TextStyle(fontWeight: FontWeight.bold),
        // ),
        // const SizedBox(
        //   height: 8,
        // ),
        // Row(
        //   children: [
        //     Row(
        //       children: [
        //         Icon(
        //           (type == TypeMessage.image)
        //               ? Icons.camera_alt_rounded
        //               : Icons.sticky_note_2_rounded,
        //           size: 15,
        //         ),
        //         const SizedBox(
        //           width: 3,
        //         ),
        //         Text(
        //           (type == TypeMessage.image) ? 'Image' : 'Sticker',
        //           style: TextStyle(color: Colors.black54),
        //         ),
        //       ],
        //     ),
        //   ],
        // ),
        //   ],
        // ),
        (type == TypeMessage.image)
            ? Container(
                // color: Colors.red,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(mediaQuery.width * 0.035),
                    topRight: Radius.circular(mediaQuery.width * 0.035),
                    bottomRight: (from == 'me')
                        ? Radius.circular(mediaQuery.width * 0.035)
                        : const Radius.circular(0),
                    bottomLeft: (from == 'me')
                        ? const Radius.circular(0)
                        : Radius.circular(mediaQuery.width * 0.035),
                  ),
                  child: Image.network(
                    message,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Container(
                        decoration: BoxDecoration(
                          color: ColorConstants.greyColor2,
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              mediaQuery.width * 0.035,
                            ),
                          ),
                        ),
                        // width: 50,
                        height: mediaQuery.width * 0.42,
                        child: Center(
                          child: CircularProgressIndicator(
                            color: ColorConstants.themeColor,
                            value: loadingProgress.expectedTotalBytes != null &&
                                    loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                                : null,
                          ),
                        ),
                      );
                    },
                    errorBuilder: (context, object, stackTrace) {
                      return Material(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8),
                        ),
                        clipBehavior: Clip.hardEdge,
                        child: Image.asset(
                          'assets/images/img_not_available.jpeg',
                          // width: 40,
                          height: mediaQuery.width * 0.42,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                    fit: BoxFit.cover,
                    // width: mediaQuery.width * 0.25,
                    height: mediaQuery.width * 0.42,
                  ),
                ),
              )
            : Image.asset('images/$message.gif',
                width: 40, height: 40, fit: BoxFit.cover);
    //   ],
    // );
  }

  Widget buildItem(
    int index,
    DocumentSnapshot? document,
  ) {
    bool isDateChanged = false;
    bool isDateChangedLast = false;
    String timeStamps = '';
    String timeStampsLast = '';
    var mediaQuery = MediaQuery.of(context).size;
    if (document != null) {
      MessageChat messageChat = MessageChat.fromDocument(document);
      //discludes first item
      if (index != 0) {
        //prev msg
        MessageChat prevMessageChat =
            MessageChat.fromDocument(listMessage[index - 1]);
        var prevDay = DateFormat('EEEE').format(
            DateTime.fromMillisecondsSinceEpoch(
                int.parse(prevMessageChat.timestamp)));
        var currentDay = DateFormat('EEEE').format(
            DateTime.fromMillisecondsSinceEpoch(
                int.parse(messageChat.timestamp)));
        //20 tuesday 1654082515958
        //21 wednesday 1654082535965

        if (prevDay != currentDay) {
          //if date changed and previous date not equals current date
          timeStamps = times.DateTimeExtension.getTimeStamp(
              DateTime.fromMillisecondsSinceEpoch(
                  int.parse(prevMessageChat.timestamp)));
          isDateChanged = true;
        }

        if (messageChat.idFrom == currentUserId) {
          if (messageLength == index + 1) {
            timeStampsLast = times.DateTimeExtension.getTimeStamp(
                DateTime.fromMillisecondsSinceEpoch(
                    int.parse(messageChat.timestamp)));
            isDateChangedLast = true;
          }
        } else {
          if (messageLength == index) {
            timeStampsLast = times.DateTimeExtension.getTimeStamp(
                DateTime.fromMillisecondsSinceEpoch(
                    int.parse(messageChat.timestamp)));
            isDateChangedLast = true;
          }
        }
      }

      // //timestamp (today, yesterday)
      // var date = DateTime.fromMillisecondsSinceEpoch(
      //     int.parse(messageChat.timestamp) * 1000);
      // previousDate = date;
      // //timestamp (today, yesterday)

      if (messageChat.idFrom == currentUserId) {
        // MessageChat prevMessageChat;
        // if (index != 0) {
        //   prevMessageChat = MessageChat.fromDocument(listMessage[index - 1]);
        // }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            if (isDateChangedLast)
              Container(
                margin: EdgeInsets.only(bottom: mediaQuery.width * 0.08),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(
                        mediaQuery.width * 0.005,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          mediaQuery.width * 0.009,
                        ),
                      ),
                      child: Text(
                        timeStampsLast,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: const Color.fromARGB(255, 77, 76, 76),
                            fontSize: mediaQuery.width * 0.035),
                      ),
                    )
                  ],
                ),
              ),
            if (messageChat.reply != null)
              //reply
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 0, mediaQuery.width * 0.055,
                        mediaQuery.width * 0.01),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          (messageChat.reply.idTo == currentUserId)
                              ? 'You replied'
                              : '${widget.peerNickname} replied',
                          style: TextStyle(
                              color: const Color(0xff8E8F92),
                              fontSize: mediaQuery.width * 0.025),
                          // fontStyle: FontStyle.italic
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(mediaQuery.width * 0.035),
                    width: (messageChat.reply.type == TypeMessage.text)
                        ? mediaQuery.width * 0.53
                        : mediaQuery.width * 0.42,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        mediaQuery.width * 0.035,
                      ),
                    ),
                    margin: EdgeInsets.only(
                      right: mediaQuery.width * 0.025,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xffDCDCDC),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(mediaQuery.width * 0.035),
                          topRight: Radius.circular(mediaQuery.width * 0.035),
                          bottomRight:
                              Radius.circular(mediaQuery.width * 0.035),
                          // bottomLeft: messageChat.reply.type == TypeMessage.text
                          //     ? Radius.circular(0)
                          //     : Radius.circular(mediaQuery.width * 0.045),
                        ),
                      ),
                      child: IntrinsicHeight(
                        child: Row(
                          children: [
                            // Container(
                            //   color: Colors.green,
                            //   width: 4,
                            // ),
                            // const SizedBox(
                            //   width: 8,
                            // ),
                            Expanded(
                                child:
                                    (messageChat.reply.type == TypeMessage.text)
                                        ? buildReplyMessage(
                                            messageChat.reply.content, 'me')
                                        : buildReplyImage(
                                            (messageChat.reply.idTo ==
                                                    currentUserId)
                                                ? 'You'
                                                : widget.peerNickname,
                                            messageChat.reply.content,
                                            messageChat.reply.type,
                                            'me')),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            if (messageChat.reply != null)
              SizedBox(
                height: mediaQuery.width * 0.02,
              ),
            Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                width: mediaQuery.width * 0.6,
                // color: Colors.red,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    messageChat.type == TypeMessage.text
                        ? Expanded(
                            // width: mediaQuery.width * 0.6,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  padding: EdgeInsets.fromLTRB(
                                    mediaQuery.width * 0.05,
                                    mediaQuery.width * 0.05,
                                    mediaQuery.width * 0.05,
                                    mediaQuery.width * 0.05,
                                  ),
                                  // width: mediaQuery.width * 0.3,
                                  decoration: BoxDecoration(
                                    color: animagiee_CL.withOpacity(0.9),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(
                                          mediaQuery.width * 0.035),
                                      bottomRight: Radius.circular(
                                          mediaQuery.width * 0.035),
                                      topLeft: Radius.circular(
                                          mediaQuery.width * 0.035),
                                    ),
                                  ),
                                  margin: EdgeInsets.only(
                                      bottom: mediaQuery.width * 0.01,
                                      right: mediaQuery.width * 0.025),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          '${messageChat.content}              ',
                                          // messageChat.content,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize:
                                                  mediaQuery.width * 0.037),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(
                                      0,
                                      0,
                                      mediaQuery.width * 0.09,
                                      mediaQuery.width * 0.06),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            DateFormat('hh:mm a').format(
                                                DateTime
                                                    .fromMillisecondsSinceEpoch(
                                                        int.parse(messageChat
                                                            .timestamp))),
                                            style: TextStyle(
                                                color: const Color(0xff8E8F92),
                                                fontSize:
                                                    mediaQuery.width * 0.025),
                                            // fontStyle: FontStyle.italic
                                          ),
                                          StreamBuilder<DocumentSnapshot>(
                                            stream:
                                                chatProvider.getUserSeenStatus(
                                                    peerId, groupChatId),
                                            builder: (BuildContext context,
                                                AsyncSnapshot<DocumentSnapshot>
                                                    snapshot) {
                                              if (!snapshot.hasData) {
                                                return Container();
                                              } else {
                                                int data = snapshot.data!.get(
                                                    FirestoreConstants
                                                        .unseenMessageCount);

                                                return Text(
                                                  (index == 0 && data == 0)
                                                      ? 'seen'
                                                      : '',
                                                  style: TextStyle(
                                                    fontSize: mediaQuery.width *
                                                        0.028,
                                                    fontWeight: FontWeight.bold,
                                                    color: const Color.fromARGB(
                                                        255, 102, 102, 104),
                                                  ),
                                                );
                                              }
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        : messageChat.type == TypeMessage.image
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                        bottom: mediaQuery.width * 0.01,
                                        right: mediaQuery.width * 0.025),
                                    child: InkWell(
                                      child: Stack(
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                              mediaQuery.width * 0.035,
                                            ),
                                            child: Image.network(
                                              messageChat.content,
                                              loadingBuilder:
                                                  (BuildContext context,
                                                      Widget child,
                                                      ImageChunkEvent?
                                                          loadingProgress) {
                                                if (loadingProgress == null) {
                                                  return child;
                                                }
                                                return Container(
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: ColorConstants
                                                        .greyColor2,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(8),
                                                    ),
                                                  ),
                                                  width:
                                                      mediaQuery.width * 0.57,
                                                  height:
                                                      mediaQuery.width * 0.8,
                                                  child: Center(
                                                    child:
                                                        CircularProgressIndicator(
                                                      color: ColorConstants
                                                          .themeColor,
                                                      value: loadingProgress
                                                                      .expectedTotalBytes !=
                                                                  null &&
                                                              loadingProgress
                                                                      .expectedTotalBytes !=
                                                                  null
                                                          ? loadingProgress
                                                                  .cumulativeBytesLoaded /
                                                              loadingProgress
                                                                  .expectedTotalBytes!
                                                          : null,
                                                    ),
                                                  ),
                                                );
                                              },
                                              errorBuilder: (context, object,
                                                  stackTrace) {
                                                return Material(
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                    Radius.circular(8),
                                                  ),
                                                  clipBehavior: Clip.hardEdge,
                                                  child: Image.asset(
                                                    'images/img_not_available.jpeg',
                                                    width:
                                                        mediaQuery.width * 0.57,
                                                    height:
                                                        mediaQuery.width * 0.8,
                                                    fit: BoxFit.cover,
                                                  ),
                                                );
                                              },
                                              width: mediaQuery.width * 0.57,
                                              height: mediaQuery.width * 0.8,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ],
                                      ),
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => FullPhotoPage(
                                              url: messageChat.content,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(
                                        0,
                                        0,
                                        mediaQuery.width * 0.09,
                                        mediaQuery.width * 0.06),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              DateFormat('hh:mm a').format(
                                                  DateTime
                                                      .fromMillisecondsSinceEpoch(
                                                          int.parse(messageChat
                                                              .timestamp))),
                                              style: TextStyle(
                                                  color:
                                                      const Color(0xff8E8F92),
                                                  fontSize:
                                                      mediaQuery.width * 0.025),
                                              // fontStyle: FontStyle.italic
                                            ),
                                            StreamBuilder<DocumentSnapshot>(
                                              stream: chatProvider
                                                  .getUserSeenStatus(
                                                      peerId, groupChatId),
                                              builder: (BuildContext context,
                                                  AsyncSnapshot<
                                                          DocumentSnapshot>
                                                      snapshot) {
                                                if (!snapshot.hasData) {
                                                  return Container();
                                                } else {
                                                  int data = snapshot.data!.get(
                                                      FirestoreConstants
                                                          .unseenMessageCount);

                                                  return Text(
                                                    (index == 0 && data == 0)
                                                        ? 'seen'
                                                        : '',
                                                    style: TextStyle(
                                                      fontSize:
                                                          mediaQuery.width *
                                                              0.028,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color:
                                                          const Color.fromARGB(
                                                              255,
                                                              102,
                                                              102,
                                                              104),
                                                    ),
                                                  );
                                                }
                                              },
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              )
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                        bottom:
                                            isLastMessageRight(index) ? 20 : 10,
                                        right: 10),
                                    child: Image.asset(
                                      'images/${messageChat.content}.gif',
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Text(
                                      DateFormat('hh:mm a').format(
                                          DateTime.fromMillisecondsSinceEpoch(
                                              int.parse(
                                                  messageChat.timestamp))),
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 10,
                                          fontStyle: FontStyle.italic),
                                    ),
                                  ),
                                ],
                              )
                  ],
                ),
              ),
            ),
            if (isDateChanged)
              Container(
                margin: EdgeInsets.only(bottom: mediaQuery.width * 0.08),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(
                        mediaQuery.width * 0.005,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          mediaQuery.width * 0.009,
                        ),
                      ),
                      child: Text(
                        timeStamps,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: const Color.fromARGB(255, 77, 76, 76),
                            fontSize: mediaQuery.width * 0.035),
                      ),
                    )
                  ],
                ),
              ),
          ],
        );
      } else {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (isDateChangedLast)
              Container(
                margin: EdgeInsets.only(bottom: mediaQuery.width * 0.08),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(
                        mediaQuery.width * 0.005,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          mediaQuery.width * 0.009,
                        ),
                      ),
                      child: Text(
                        timeStampsLast,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: const Color.fromARGB(255, 77, 76, 76),
                            fontSize: mediaQuery.width * 0.035),
                      ),
                    )
                  ],
                ),
              ),

            if (messageChat.reply != null)
              //reply
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(
                      mediaQuery.width * 0.055,
                      0,
                      0,
                      mediaQuery.width * 0.01,
                    ),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          (messageChat.reply.idTo == currentUserId)
                              ? 'replied to you'
                              : 'replied to ${widget.peerNickname}',
                          style: TextStyle(
                              color: const Color(0xff8E8F92),
                              fontSize: mediaQuery.width * 0.025),
                          // fontStyle: FontStyle.italic
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(mediaQuery.width * 0.035),
                    width: (messageChat.reply.type == TypeMessage.text)
                        ? mediaQuery.width * 0.53
                        : mediaQuery.width * 0.42,
                    decoration: BoxDecoration(
                      color: const Color(0xffBEBDBD).withOpacity(0.3),
                      borderRadius: BorderRadius.circular(
                        mediaQuery.width * 0.035,
                      ),
                    ),
                    margin: EdgeInsets.only(
                      left: mediaQuery.width * 0.025,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: animagiee_CL.withOpacity(0.7),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(mediaQuery.width * 0.045),
                          topRight: Radius.circular(mediaQuery.width * 0.045),
                          bottomLeft: Radius.circular(mediaQuery.width * 0.045),
                          // bottomLeft: messageChat.reply.type == TypeMessage.text
                          //     ? Radius.circular(0)
                          //     : Radius.circular(mediaQuery.width * 0.045),
                        ),
                      ),
                      child: IntrinsicHeight(
                        child: Row(
                          children: [
                            // Container(
                            //   color: Colors.green,
                            //   width: 4,
                            // ),
                            // const SizedBox(
                            //   width: 8,
                            // ),
                            Expanded(
                                child:
                                    (messageChat.reply.type == TypeMessage.text)
                                        ? buildReplyMessage(
                                            messageChat.reply.content, 'opp')
                                        : buildReplyImage(
                                            (messageChat.reply.idTo ==
                                                    currentUserId)
                                                ? 'You'
                                                : widget.peerNickname,
                                            messageChat.reply.content,
                                            messageChat.reply.type,
                                            'opp')),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            if (messageChat.reply != null)
              SizedBox(
                height: mediaQuery.width * 0.02,
              ),
            Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                width: mediaQuery.width * 0.6,
                child: Row(
                  children: [
                    messageChat.type == TypeMessage.text
                        ? Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.fromLTRB(
                                    mediaQuery.width * 0.05,
                                    mediaQuery.width * 0.05,
                                    mediaQuery.width * 0.05,
                                    mediaQuery.width * 0.05,
                                  ),
                                  // width: mediaQuery.width * 0.6,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(
                                          mediaQuery.width * 0.035),
                                      bottomRight: Radius.circular(
                                          mediaQuery.width * 0.035),
                                      topRight: Radius.circular(
                                          mediaQuery.width * 0.035),
                                    ),
                                  ),
                                  margin: EdgeInsets.only(
                                      bottom: mediaQuery.width * 0.01,
                                      left: mediaQuery.width * 0.025),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          '${messageChat.content}              ',
                                          style: TextStyle(
                                              color: Colors.black,
                                              // color: Colors.black,
                                              fontSize:
                                                  mediaQuery.width * 0.035),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(
                                      mediaQuery.width * 0.09,
                                      0,
                                      0,
                                      mediaQuery.width * 0.05),
                                  child: Row(
                                    // mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        DateFormat('hh:mm a').format(
                                            DateTime.fromMillisecondsSinceEpoch(
                                                int.parse(
                                                    messageChat.timestamp))),
                                        style: TextStyle(
                                            color: const Color(0xff8E8F92),
                                            fontSize: mediaQuery.width * 0.025),
                                        // fontStyle: FontStyle.italic
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        : messageChat.type == TypeMessage.image
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                        bottom: mediaQuery.width * 0.01,
                                        left: mediaQuery.width * 0.025),
                                    child: InkWell(
                                      child: Stack(
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                              mediaQuery.width * 0.035,
                                            ),
                                            child: Image.network(
                                              messageChat.content,
                                              loadingBuilder:
                                                  (BuildContext context,
                                                      Widget child,
                                                      ImageChunkEvent?
                                                          loadingProgress) {
                                                if (loadingProgress == null) {
                                                  return child;
                                                }
                                                return Container(
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: ColorConstants
                                                        .greyColor2,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(8),
                                                    ),
                                                  ),
                                                  width:
                                                      mediaQuery.width * 0.57,
                                                  height:
                                                      mediaQuery.width * 0.8,
                                                  child: Center(
                                                    child:
                                                        CircularProgressIndicator(
                                                      color: ColorConstants
                                                          .themeColor,
                                                      value: loadingProgress
                                                                      .expectedTotalBytes !=
                                                                  null &&
                                                              loadingProgress
                                                                      .expectedTotalBytes !=
                                                                  null
                                                          ? loadingProgress
                                                                  .cumulativeBytesLoaded /
                                                              loadingProgress
                                                                  .expectedTotalBytes!
                                                          : null,
                                                    ),
                                                  ),
                                                );
                                              },
                                              errorBuilder: (context, object,
                                                  stackTrace) {
                                                return Material(
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                    Radius.circular(8),
                                                  ),
                                                  clipBehavior: Clip.hardEdge,
                                                  child: Image.asset(
                                                    'images/img_not_available.jpeg',
                                                    width:
                                                        mediaQuery.width * 0.57,
                                                    height:
                                                        mediaQuery.width * 0.8,
                                                    fit: BoxFit.cover,
                                                  ),
                                                );
                                              },
                                              width: mediaQuery.width * 0.57,
                                              height: mediaQuery.width * 0.8,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ],
                                      ),
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => FullPhotoPage(
                                              url: messageChat.content,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(
                                        mediaQuery.width * 0.09,
                                        0,
                                        0,
                                        mediaQuery.width * 0.06),
                                    child: Row(
                                      // mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          DateFormat('hh:mm a').format(DateTime
                                              .fromMillisecondsSinceEpoch(
                                                  int.parse(
                                                      messageChat.timestamp))),
                                          style: TextStyle(
                                              color: const Color(0xff8E8F92),
                                              fontSize:
                                                  mediaQuery.width * 0.025),
                                          // fontStyle: FontStyle.italic
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              )
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                        bottom:
                                            isLastMessageRight(index) ? 20 : 10,
                                        right: 10),
                                    child: Image.asset(
                                      'images/${messageChat.content}.gif',
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Text(
                                    DateFormat('hh:mm a').format(
                                        DateTime.fromMillisecondsSinceEpoch(
                                            int.parse(messageChat.timestamp))),
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 10,
                                        fontStyle: FontStyle.italic),
                                  ),
                                ],
                              )
                  ],
                ),
              ),
            ),
            //     ? Container(
            //         child: Text(
            //           DateFormat('dd MMM yyyy, hh:mm a').format(
            //               DateTime.fromMillisecondsSinceEpoch(
            //                   int.parse(messageChat.timestamp))),
            //           style: TextStyle(
            //               color: ColorConstants.greyColor,
            //               fontSize: 12,
            //               fontStyle: FontStyle.italic),
            //         ),
            //         margin: EdgeInsets.only(left: 50, top: 5, bottom: 5),
            //       )
            // isLastMessageLeft(index)
            //     ? Container(
            //         child: Text(
            //           DateFormat('dd MMM yyyy, hh:mm a').format(
            //               DateTime.fromMillisecondsSinceEpoch(
            //                   int.parse(messageChat.timestamp))),
            //           style: const TextStyle(
            //               color: ColorConstants.greyColor,
            //               fontSize: 12,
            //               fontStyle: FontStyle.italic),
            //         ),
            //         margin: EdgeInsets.only(left: 10, top: 5, bottom: 5),
            //       )
            //     : SizedBox.shrink()
            if (isDateChanged)
              Container(
                margin: EdgeInsets.only(bottom: mediaQuery.width * 0.08),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(
                        mediaQuery.width * 0.005,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          mediaQuery.width * 0.009,
                        ),
                      ),
                      child: Text(
                        timeStamps,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: const Color.fromARGB(255, 77, 76, 76),
                            fontSize: mediaQuery.width * 0.035),
                      ),
                    )
                  ],
                ),
              ),
          ],
        );
      }
    } else {
      return const SizedBox.shrink();
    }
  }

  void setReplyMessage(int index, DocumentSnapshot? document) {
    if (document != null) {
      // replyMessageChat = messageChat;
      setState(() {
        replyMessageChat = MessageChat.fromDocument(document);
      });
    } else {
      Fluttertoast.showToast(msg: 'Something went wrong!');
    }
  }

  void cancelReply() {
    setState(() {
      replyMessageChat = null;
    });
  }

  void deleteForEveryoneMessage(
      {AsyncSnapshot<QuerySnapshot>? snapshot,
      int? index,
      String? from}) async {
    MessageChat messageChat =
        MessageChat.fromDocument(snapshot!.data!.docs[index!]);

    // //delete for everyone is only applicable if message is sent less or equal to 15mins
    // DateTime currentTime = DateTime.now();
    // DateTime messageTime =
    //     DateTime.fromMillisecondsSinceEpoch(int.parse(messageChat.timestamp));

    // var diff = currentTime.difference(messageTime).inMinutes;

    // if (from != '') {
    if (messageChat.type == 1) {
      //if it is a image
      await FirebaseStorage.instance
          .refFromURL(messageChat.content)
          .delete()
          .then((value) async {
        await FirebaseFirestore.instance
            .runTransaction((Transaction myTransaction) async {
          myTransaction.delete(snapshot.data!.docs[index].reference);
        }).then((value) =>
                Fluttertoast.showToast(msg: "Message deleted successfully."));
      });
    } else {
      //if not an image
      await FirebaseFirestore.instance
          .runTransaction((Transaction myTransaction) async {
        myTransaction.delete(snapshot.data!.docs[index].reference);
      }).then((value) =>
              Fluttertoast.showToast(msg: "Message deleted successfully."));
    }
    // } else {
    //   Fluttertoast.showToast(msg: "Your message is no longer deletable!");
    // }
  }

  void deleteForMe({AsyncSnapshot<QuerySnapshot>? snapshot, int? index}) async {
    MessageChat messageChats =
        MessageChat.fromDocument(snapshot!.data!.docs[index!]);

    //if opp user deleted the message, do everyone delete logic
    if (messageChats.deleteForMe != "") {
      deleteForEveryoneMessage(
          snapshot: snapshot, index: index, from: 'deleteForMe');
      return;
    } else {
      //else add that id to it.
      await firebaseFirestore
          .collection(FirestoreConstants.pathMessageCollection)
          .doc(groupChatId)
          .collection(groupChatId)
          .doc(messageChats.timestamp)
          .update({FirestoreConstants.deleteForMe: currentUserId}).then(
              (value) {
        Fluttertoast.showToast(msg: "Message deleted successfully.");
        setState(() {});
      });
    }
  }

  Widget buildListMessage() {
    var mediaQuerry = MediaQuery.of(context).size;
    return Flexible(
        child: groupChatId.isNotEmpty
            ? StreamBuilder<QuerySnapshot>(
                stream: chatProvider.getChatStream(
                    groupChatId, _limit, currentUserId),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  // chatProvider.isStatusUpdated(false);
                  // getOnlineStatus().then((value) {
                  //   // Future.delayed(Duration(seconds: 5), () {
                  //   //   chatProvider.isStatusUpdated(true);
                  //   // });
                  // });
                  //set unread messages to 0
                  setZeroToUnreadMssg();

                  listMessage.clear();
                  if (snapshot.hasData) {
                    for (var element in snapshot.data!.docs) {
                      if (element.get("deleteForMe") != currentUserId) {
                        listMessage.add(element);
                      }
                    }
                    // listMessage.addAll(snapshot.data!.docs);
                    return ListView.builder(
                      padding: const EdgeInsets.all(10),
                      itemBuilder: (context, index) {
                        return Dismissible(
                          key: UniqueKey(),
                          direction: DismissDirection.startToEnd,
                          // dismissThresholds: const {
                          //   DismissDirection.startToEnd: 0.1,
                          //   // _isNotFirstIndex ? 0.05 : 2.00,
                          // },
                          resizeDuration: const Duration(milliseconds: 150),
                          confirmDismiss: (direction) async {
                            setReplyMessage(
                                index,
                                // snapshot.data?.docs[index]
                                listMessage[index]);
                            focusNode.requestFocus();
                            return false;
                          },
                          child: Column(
                            children: [
                              InkWell(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onLongPress: () {
                                  focusNode.unfocus();
                                  MessageChat messageChat =
                                      MessageChat.fromDocument(
                                          // snapshot.data!.docs[index]
                                          listMessage[index]);
                                  //others message

                                  //delete for everyone is only applicable if message is sent less or equal to 15mins
                                  DateTime currentTime = DateTime.now();
                                  DateTime messageTime =
                                      DateTime.fromMillisecondsSinceEpoch(
                                          int.parse(messageChat.timestamp));

                                  var diff = currentTime
                                      .difference(messageTime)
                                      .inMinutes;

                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          StatefulBuilder(
                                              builder: (context, setState) {
                                            return Dialog(
                                              child: SizedBox(
                                                height: (messageChat.idFrom ==
                                                            currentUserId &&
                                                        diff <= 15)
                                                    ? MediaQuery.of(context)
                                                            .size
                                                            .height /
                                                        4.8
                                                    : MediaQuery.of(context)
                                                            .size
                                                            .height /
                                                        6,
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      decoration:
                                                          const BoxDecoration(
                                                        color: animagiee_CL,
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomLeft:
                                                              inputTopRadius,
                                                          bottomRight:
                                                              inputTopRadius,
                                                        ),
                                                      ),
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height /
                                                              18,
                                                      width: double.infinity,
                                                      child: Align(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Padding(
                                                          padding: EdgeInsets.only(
                                                              left: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.04),
                                                          child: Text(
                                                            'Delete Message?',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    0.045,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    if (messageChat.idFrom ==
                                                            currentUserId &&
                                                        diff <= 15)
                                                      SizedBox(
                                                        height:
                                                            mediaQuerry.width *
                                                                0.05,
                                                      ),
                                                    if (messageChat.idFrom ==
                                                            currentUserId &&
                                                        diff <= 15)
                                                      InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () {
                                                          Navigator.pop(
                                                              context);
                                                          deleteForEveryoneMessage(
                                                              snapshot:
                                                                  snapshot,
                                                              index: index,
                                                              from: '');
                                                        },
                                                        child: Container(
                                                          padding: EdgeInsets.only(
                                                              left: mediaQuerry
                                                                      .width *
                                                                  0.04),
                                                          child: Align(
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            child: Text(
                                                              'Delete for everyone',
                                                              style: TextStyle(
                                                                  color:
                                                                      animagiee_CL,
                                                                  fontSize: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width *
                                                                      0.04,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    SizedBox(
                                                      height:
                                                          mediaQuerry.width *
                                                              0.04,
                                                    ),
                                                    InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: Container(
                                                        padding: EdgeInsets.only(
                                                            left: mediaQuerry
                                                                    .width *
                                                                0.04),
                                                        child: Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Text(
                                                            'Cancel',
                                                            style: TextStyle(
                                                                color:
                                                                    animagiee_CL,
                                                                fontSize: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    0.04,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height:
                                                          mediaQuerry.width *
                                                              0.04,
                                                    ),
                                                    InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () {
                                                        Navigator.pop(context);
                                                        deleteForMe(
                                                            snapshot: snapshot,
                                                            index: index);
                                                      },
                                                      child: Container(
                                                        padding: EdgeInsets.only(
                                                            left: mediaQuerry
                                                                    .width *
                                                                0.04),
                                                        child: Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Text(
                                                            'Delete for me',
                                                            style: TextStyle(
                                                                color:
                                                                    animagiee_CL,
                                                                fontSize: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    0.04,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            );
                                          }));

                                  // showModalBottomSheet<void>(
                                  //   // context and builder are
                                  //   // required properties in this widget
                                  //   context: context,
                                  //   builder: (BuildContext context) {
                                  //     // we set up a container inside which
                                  //     // we create center column and display text
                                  //     return Container(
                                  //       height: (messageChat.idFrom ==
                                  //                   currentUserId &&
                                  //               diff <= 15)
                                  //           ? mediaQuerry.height / 4.5
                                  //           : mediaQuerry.height / 6.5,
                                  //       child: Column(
                                  //         children: [
                                  //           SizedBox(
                                  //             height: mediaQuerry.height / 25,
                                  //           ),
                                  //           if (messageChat.idFrom ==
                                  //                   currentUserId &&
                                  //               diff <= 15)
                                  //             ElevatedButton(
                                  //               onPressed: () {
                                  //                 Navigator.pop(context);
                                  //                 deleteForEveryoneMessage(
                                  //                     snapshot: snapshot,
                                  //                     index: index,
                                  //                     from: '');
                                  //               },
                                  //               style: ElevatedButton.styleFrom(
                                  //                   primary: bg_color1,
                                  //                   textStyle: TextStyle(
                                  //                     fontSize:
                                  //                         mediaQuerry.width /
                                  //                             15,
                                  //                   )),
                                  //               child: Text(
                                  //                 'Delete for Everyone',
                                  //                 textAlign: TextAlign.center,
                                  //                 style: TextStyle(
                                  //                   color: Colors.white,
                                  //                   fontSize:
                                  //                       mediaQuerry.width / 20,
                                  //                 ),
                                  //               ),
                                  //             ),
                                  //           ElevatedButton(
                                  //             onPressed: () {
                                  //               Navigator.pop(context);
                                  //               deleteForMe(
                                  //                   snapshot: snapshot,
                                  //                   index: index);
                                  //             },
                                  //             style: ElevatedButton.styleFrom(
                                  //                 primary: bg_color1,
                                  //                 textStyle: TextStyle(
                                  //                   fontSize:
                                  //                       mediaQuerry.width / 15,
                                  //                 )),
                                  //             child: Text(
                                  //               'Delete for Me',
                                  //               textAlign: TextAlign.center,
                                  //               style: TextStyle(
                                  //                 color: Colors.white,
                                  //                 fontSize:
                                  //                     mediaQuerry.width / 20,
                                  //               ),
                                  //             ),
                                  //           ),
                                  //           SizedBox(
                                  //             height: mediaQuerry.height / 25,
                                  //           ),
                                  //         ],
                                  //       ),
                                  //     );
                                  //   },
                                  // );
                                },
                                child: buildItem(
                                    index,
                                    // snapshot.data?.docs[index]
                                    listMessage[index]),
                              ),
                            ],
                          ),
                        );
                      },
                      itemCount:
                          // snapshot.data?.docs.length,
                          listMessage.length,
                      reverse: true,
                      controller: listScrollController,
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: ColorConstants.themeColor,
                      ),
                    );
                  }
                },
              )
            : const Center(
                child: CircularProgressIndicator(
                  color: ColorConstants.themeColor,
                ),
              ));
  }
}
