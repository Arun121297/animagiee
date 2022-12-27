import 'dart:async';

import '../../config/colorconfig.dart';
import '../group_chat/allConstents/firestore_constants.dart';
import '../group_chat/allModels/message_history_item.dart';
import '../group_chat/chat_page.dart';
import '../group_chat/chat_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../group_chat/allConstents/date_time_extension.dart' as times;

class GroupChatListingSearchScreen extends StatefulWidget {
  final String currentUserId;

  const GroupChatListingSearchScreen(this.currentUserId);

  @override
  _GroupChatListingSearchScreenState createState() =>
      _GroupChatListingSearchScreenState();
}

class _GroupChatListingSearchScreenState
    extends State<GroupChatListingSearchScreen> {
  List<QueryDocumentSnapshot> listMessage = List.from([]);
  List<MessageHistoryItem> listMsg = [];
  List<MessageHistoryItem> totallistMsg = [];
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final StreamController<List<MessageHistoryItem>> _streamController =
      StreamController<List<MessageHistoryItem>>();
  Stream<List<MessageHistoryItem>> get _stream => _streamController.stream;
  late GroupChatProvider chatProvider;
  final int _limit = 20;

  @override
  void initState() {
    super.initState();

    chatProvider = context.read<GroupChatProvider>();

    getChatMessages();
  }

  Future<List<String>> getUserData(String peerId) async {
    List<String> userList = [];
    final DocumentSnapshot result = await firebaseFirestore
        .collection(FirestoreConstants.pathUserCollection)
        .doc(peerId)
        .get();

    String name = result.get('nickname');
    //Have to add image as well

    userList.add(name);

    return userList;
  }

  _searchStream(String searchQuery) {
    if (searchQuery == '') {
      getChatMessages();
      return;
    }
    // print('yes---query---$searchQuery');
    List<MessageHistoryItem> filteredList;
    List<MessageHistoryItem> filteredList2;
    List<MessageHistoryItem> filteredList3;
    filteredList = totallistMsg
        .where((MessageHistoryItem item) =>
            item.lastMessage.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();
    filteredList2 = totallistMsg
        .where((MessageHistoryItem item) =>
            item.peerName.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();
    //remove duplicate items
    filteredList3 = {...filteredList, ...filteredList2}.toList();

    // print('yes----${_filteredList.length}');
    // _filteredList.addAll(_filteredList2);
    listMsg.clear();
    listMsg = filteredList3;
    _streamController.sink.add(listMsg);
  }

  Future<void> getChatMessages() async {
    listMsg.clear();
    totallistMsg.clear();
    QuerySnapshot data = await firebaseFirestore
        .collection(FirestoreConstants.groupHistory)
        .doc(widget.currentUserId)
        .collection(widget.currentUserId)
        // .where(FirestoreConstants.deleteForMe, isNotEqualTo: currentUserId)
        .orderBy(FirestoreConstants.timestamp, descending: true)
        .get();
    for (var doc in data.docs) {
      //       print('yes');
      MessageHistoryItem messageHistoryItem =
          MessageHistoryItem.fromDocument(doc);
      listMsg.add(messageHistoryItem);
      totallistMsg.add(messageHistoryItem);
    }

    _streamController.sink.add(listMsg);
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Column(
          children: [
            //Search Bar
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: mediaQuery.width * 0.03),
                    child: TextField(
                        cursorColor: const Color(0xff818181),
                        autofocus: true,
                        onChanged: (value) {
                          _searchStream(value);
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: mediaQuery.width * 0.035),
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Color(0xff818181),
                          ),
                          hintText: 'Search',
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xff818181),
                            ),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xff818181),
                            ),
                          ),
                          // border: InputBorder.none,
                        )),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: mediaQuery.width * 0.03,
                        vertical: mediaQuery.width * 0.05),
                    child: const Text('cancel'),
                  ),
                ),
              ],
            ),

            //Messages Text
            Container(
              margin: EdgeInsets.only(
                  left: mediaQuery.width * 0.03,
                  top: mediaQuery.width * 0.05,
                  bottom: mediaQuery.width * 0.02),
              child: Row(
                children: [
                  Text(
                    'Messages',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: animagiee_CL,
                        fontSize: mediaQuery.width * 0.05),
                  ),
                ],
              ),
            ),

            //Users List
            Expanded(
                child: StreamBuilder<List<MessageHistoryItem>>(
                    stream: _stream,
                    builder: (BuildContext context,
                        AsyncSnapshot<List<MessageHistoryItem>> snapshot) {
                      if (snapshot.hasData) {
                        if (listMsg.isEmpty) {
                          return Padding(
                            padding: EdgeInsets.only(
                              top: mediaQuery.width * 0.05,
                            ),
                            child: const Text('No messages found!'),
                          );
                        }
                        return ListView.builder(
                            itemCount: listMsg.length,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              // MessageHistoryItem messageHistoryItem =
                              //     MessageHistoryItem.fromDocument(
                              //         listMsg[index]);

                              //Getting username and Image
                              var date = DateTime.fromMillisecondsSinceEpoch(
                                  int.parse(listMsg[index].timestamp));
                              String timeStamp =
                                  times.DateTimeExtension.timeAgo(
                                      numericDates: false, date: date);
                              return InkWell(
                                onTap: () {
                                  Get.to(() => GroupChatPage(
                                        peerNickname: listMsg[index].peerName,
                                        peerAvatar: listMsg[index].peerImage,
                                        peerId: listMsg[index].peerId,
                                        currentUserId: listMsg[index].peerId,
                                      ));
                                },
                                child: Container(
                                  color: Colors.white,
                                  child: Column(
                                    children: [
                                      ListTile(
                                        leading: Container(
                                            height: mediaQuery.width * 0.11,
                                            width: mediaQuery.width * 0.11,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: animagiee_CL,
                                                width:
                                                    mediaQuery.width * 0.0035,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      mediaQuery.width * 0.06),
                                            ),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      mediaQuery.width * 0.06),
                                              child: Image.network(
                                                // 'https://www.rd.com/wp-content/uploads/2017/09/01-shutterstock_476340928-Irina-Bg.jpg',
                                                listMsg[index].peerImage,
                                                loadingBuilder:
                                                    (BuildContext context,
                                                        Widget child,
                                                        ImageChunkEvent?
                                                            loadingProgress) {
                                                  if (loadingProgress == null) {
                                                    return child;
                                                  }
                                                  return Container(
                                                    decoration: BoxDecoration(
                                                      color: animagiee_CL,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(
                                                          mediaQuery.width *
                                                              0.035,
                                                        ),
                                                      ),
                                                    ),
                                                    // width: 50,
                                                    height:
                                                        mediaQuery.width * 0.42,
                                                    child: Center(
                                                      child:
                                                          CircularProgressIndicator(
                                                        color: Colors.white,
                                                        strokeWidth: 2,
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
                                                      'assets/images/img_not_available.jpeg',
                                                      // width: 40,
                                                      height: mediaQuery.width *
                                                          0.42,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  );
                                                },
                                                fit: BoxFit.cover,
                                                // width: mediaQuery.width * 0.25,
                                                // height: mediaQuery.width * 0.42,
                                              ),
                                            )),
                                        title: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              width: mediaQuery.width * 0.55,
                                              child: Text(
                                                listMsg[index].peerName,
                                                // Daniel Smith Daniel Smith Daniel Smith Daniel Smith Daniel Smith
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    color:
                                                        const Color(0xff353535),
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: mediaQuery.width *
                                                        0.04),
                                              ),
                                            ),
                                            Container(
                                              alignment: Alignment.centerRight,
                                              width: mediaQuery.width * 0.20,
                                              child: Text(
                                                timeStamp,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    color:
                                                        const Color(0xff7C7B7B),
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: mediaQuery.width *
                                                        0.023),
                                              ),
                                            ),
                                          ],
                                        ),
                                        subtitle: Text(
                                          listMsg[index].type != 0
                                              ? 'Image'
                                              : listMsg[index].lastMessage,
                                          style: TextStyle(
                                              color: const Color(0xff959595),
                                              fontSize:
                                                  mediaQuery.width * 0.03),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: mediaQuery.width * 0.185,
                                            right: mediaQuery.width * 0.03),
                                        child: SizedBox(
                                          width: double.infinity,
                                          height: 1,
                                          child: Container(
                                            color: const Color(0xffDDDDDD),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            });
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: animagiee_CL,
                          ),
                        );
                      }
                    })),
          ],
        )));
  }
}
