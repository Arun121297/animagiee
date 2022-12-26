import 'dart:async';

import '../chat/allConstents/firestore_constants.dart';
import '../chat/allModels/message_history_item.dart';
import '../chat/chat_listing_searchScreen.dart';
import '../chat/chat_page.dart';
import '../chat/chat_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../chat/allConstents/date_time_extension.dart' as times;
import 'package:shimmer/shimmer.dart';

import '../config/colorconfig.dart';

class ChatListingScreen extends StatefulWidget {
  final String currentUserId;

  const ChatListingScreen(this.currentUserId);

  @override
  _ChatListingScreenState createState() => _ChatListingScreenState();
}

class _ChatListingScreenState extends State<ChatListingScreen> {
  List<QueryDocumentSnapshot> listMessage = List.from([]);
  // List<MessageHistoryItem> listMsg = [];
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final ScrollController listScrollController = ScrollController();
  late ChatProvider chatProvider;
  int _limit = 20;
  final int _limitIncrement = 20;

  @override
  void initState() {
    super.initState();

    chatProvider = context.read<ChatProvider>();

    listScrollController.addListener(_scrollListener);

    //print date
    // final now = DateTime.now();
    // final yesterday = DateTime(now.year, now.month, now.day - 9)
    //     .millisecondsSinceEpoch
    //     .toString();
  }

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

  // Future<void> searchStream
  // StreamController<List<MessageHistoryItem>> _streamController =
  //     StreamController<List<MessageHistoryItem>>();
  // Stream<List<MessageHistoryItem>> get _stream => _streamController.stream;

  // _searchStream(String searchQuery) {
  //   Stream<QuerySnapshot> snapshot =
  //       chatProvider.getChatHistoryListStream(_limit, widget.currentUserId);

  //   snapshot.map(
  //     (qShot) => qShot.docs.map(
  //       (doc) {
  //         MessageHistoryItem messageHistoryItem =
  //                             MessageHistoryItem.fromDocument(doc);
  //         listMsg.add(messageHistoryItem);
  //       }
  //     )
  //   );

  //   listMessage.clear();
  //   listMessage.addAll(snapshot.);

  //   List<MessageHistoryItem> _filteredList = _dataFromQuerySnapShot
  //       .where((MessageHistoryItem user) =>
  //           user.name.toLowerCase().contains(searchQuery.toLowerCase()))
  //       .toList();
  //   _streamController.sink.add(_filteredList);
  // }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Column(
          children: [
            //Top Bar
            Stack(
              alignment: Alignment.center,
              children: [
                Text(
                  'Chat',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: mediaQuery.width * 0.05),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      margin: EdgeInsets.all(mediaQuery.width * 0.03),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 5,
                              color: Color.fromARGB(255, 187, 186, 186),
                              spreadRadius: 1)
                        ],
                      ),
                      child: const CircleAvatar(
                        backgroundColor: Colors.white,
                        child: InkWell(
                          child: Icon(
                            Icons.arrow_back,
                            color: animagiee_CL,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                // Align(
                //     alignment: Alignment.centerRight,
                //     child: IconButton(
                //       icon: Icon(Icons.adaptive.more),
                //       onPressed: () {
                //         Future.delayed(
                //             const Duration(seconds: 0),
                //             () => showDialog(
                //                   context: context,
                //                   builder: (BuildContext context) {
                //                     return AlertDialog(
                //                       title: InkWell(
                //                         child: Text('Blocked List'),
                //                         onTap: () async {
                //                           DocumentSnapshot snap =
                //                               await firebaseFirestore
                //                                   .collection(FirestoreConstants
                //                                       .pathUserCollection)
                //                                   .doc(widget.currentUserId)
                //                                   .get();

                //                           List blockedList = (snap.data()!
                //                                   as dynamic)[
                //                               FirestoreConstants.blockedList];
                //                           Navigator.of(context).pop();
                //                           Future.delayed(
                //                               const Duration(seconds: 0),
                //                               () => showDialog(
                //                                     context: context,
                //                                     builder:
                //                                         (BuildContext context) {
                //                                       return AlertDialog(
                //                                         title: Text(
                //                                             'Blocked List'),
                //                                         content: blockedList
                //                                                     .length ==
                //                                                 0
                //                                             ? Center(
                //                                                 child: Text(
                //                                                     'Blocked list is empty'),
                //                                               )
                //                                             : ListView.builder(
                //                                                 itemCount:
                //                                                     blockedList
                //                                                         .length,
                //                                                 itemBuilder:
                //                                                     ((context,
                //                                                         index) {
                //                                                   log(blockedList
                //                                                       .length
                //                                                       .toString());
                //                                                   return ListTile(
                //                                                     title: Text(
                //                                                         blockedList[
                //                                                             index]),
                //                                                   );
                //                                                 })),
                //                                         actions: [
                //                                           TextButton(
                //                                             child: const Text(
                //                                                 'Back'),
                //                                             onPressed: () {
                //                                               Navigator.of(
                //                                                       context)
                //                                                   .pop();
                //                                             },
                //                                           ),
                //                                         ],
                //                                       );
                //                                     },
                //                                   ));
                //                         },
                //                       ),
                //                     );
                //                   },
                //                 ));
                //       },
                //     ))
              ],
            ),

            //Search Bar
            InkWell(
              onTap: () {
                Get.to(
                  ChatListingSearchScreen(widget.currentUserId),
                );
              },
              child: Container(
                margin:
                    EdgeInsets.symmetric(horizontal: mediaQuery.width * 0.03),
                child: TextField(
                    cursorColor: const Color(0xff818181),
                    enabled: false,
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
                child: StreamBuilder<QuerySnapshot>(
                    stream: chatProvider.getChatHistoryListStream(
                        _limit, widget.currentUserId),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasData) {
                        listMessage.clear();
                        listMessage.addAll(snapshot.data!.docs);
                        if (listMessage.isEmpty) {
                          return Padding(
                            padding: EdgeInsets.only(
                              top: mediaQuery.width * 0.05,
                            ),
                            child: const Text('No messages found!'),
                          );
                        }
                        return ListView.builder(
                            itemCount: listMessage.length,
                            physics: const BouncingScrollPhysics(),
                            controller: listScrollController,
                            itemBuilder: (context, index) {
                              MessageHistoryItem messageHistoryItem =
                                  MessageHistoryItem.fromDocument(
                                      listMessage[index]);

                              //Getting username and Image
                              return FutureBuilder(
                                  future:
                                      getUserData(messageHistoryItem.peerId),
                                  builder: (context, AsyncSnapshot snapshot) {
                                    if (!snapshot.hasData) {
                                      return Container(
                                        child: Shimmer.fromColors(
                                            baseColor: Colors.grey[300]!,
                                            highlightColor: Colors.grey[100]!,
                                            child: Card(
                                              elevation: 1.0,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                              ),
                                              child: Container(
                                                height: mediaQuery.width * 0.15,
                                              ),
                                            )),
                                      );
                                    } else {
                                      var date = DateTime
                                          .fromMillisecondsSinceEpoch(int.parse(
                                              messageHistoryItem.timestamp));
                                      String timeStamp =
                                          times.DateTimeExtension.timeAgo(
                                              numericDates: false, date: date);
                                      return InkWell(
                                        onTap: () {
                                          Get.to(() => ChatPage(
                                                peerNickname:
                                                    messageHistoryItem.peerName,
                                                peerAvatar: messageHistoryItem
                                                    .peerImage,
                                                peerId:
                                                    messageHistoryItem.peerId,
                                              ));
                                        },
                                        child: Container(
                                          color: Colors.white,
                                          child: Column(
                                            children: [
                                              ListTile(
                                                leading: Container(
                                                    height:
                                                        mediaQuery.width * 0.11,
                                                    width:
                                                        mediaQuery.width * 0.11,
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                        color: animagiee_CL,
                                                        width:
                                                            mediaQuery.width *
                                                                0.0035,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              mediaQuery.width *
                                                                  0.06),
                                                    ),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              mediaQuery.width *
                                                                  0.06),
                                                      child: Image.network(
                                                        // 'https://www.rd.com/wp-content/uploads/2017/09/01-shutterstock_476340928-Irina-Bg.jpg',
                                                        messageHistoryItem
                                                            .peerImage,
                                                        loadingBuilder:
                                                            (BuildContext
                                                                    context,
                                                                Widget child,
                                                                ImageChunkEvent?
                                                                    loadingProgress) {
                                                          if (loadingProgress ==
                                                              null) {
                                                            return child;
                                                          }
                                                          return Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  animagiee_CL,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .all(
                                                                Radius.circular(
                                                                  mediaQuery
                                                                          .width *
                                                                      0.035,
                                                                ),
                                                              ),
                                                            ),
                                                            // width: 50,
                                                            height: mediaQuery
                                                                    .width *
                                                                0.42,
                                                            child: Center(
                                                              child:
                                                                  CircularProgressIndicator(
                                                                color: Colors
                                                                    .white,
                                                                strokeWidth: 2,
                                                                value: loadingProgress.expectedTotalBytes !=
                                                                            null &&
                                                                        loadingProgress.expectedTotalBytes !=
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
                                                        errorBuilder: (context,
                                                            object,
                                                            stackTrace) {
                                                          return Material(
                                                            borderRadius:
                                                                const BorderRadius
                                                                    .all(
                                                              Radius.circular(
                                                                  8),
                                                            ),
                                                            clipBehavior:
                                                                Clip.hardEdge,
                                                            child: Image.asset(
                                                              'assets/images/img_not_available.jpeg',
                                                              // width: 40,
                                                              height: mediaQuery
                                                                      .width *
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
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    SizedBox(
                                                      width: mediaQuery.width *
                                                          0.55,
                                                      child: Text(
                                                        // snapshot.data[0],
                                                        messageHistoryItem
                                                            .peerName,
                                                        // Daniel Smith Daniel Smith Daniel Smith Daniel Smith Daniel Smith
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(
                                                            color: const Color(
                                                                0xff353535),
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: mediaQuery
                                                                    .width *
                                                                0.04),
                                                      ),
                                                    ),
                                                    Container(
                                                      alignment:
                                                          Alignment.centerRight,
                                                      width: mediaQuery.width *
                                                          0.20,
                                                      child: Text(
                                                        timeStamp,
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(
                                                            color: const Color(
                                                                0xff7C7B7B),
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: mediaQuery
                                                                    .width *
                                                                0.023),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                subtitle: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Flexible(
                                                      child: Text(
                                                        messageHistoryItem
                                                                    .type !=
                                                                0
                                                            ? 'Image'
                                                            : messageHistoryItem
                                                                .lastMessage,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        maxLines: 2,
                                                        style: TextStyle(
                                                            color: const Color(
                                                                0xff959595),
                                                            fontSize: mediaQuery
                                                                    .width *
                                                                0.03,
                                                            fontWeight:
                                                                messageHistoryItem
                                                                            .unseenMessageCount !=
                                                                        0
                                                                    ? FontWeight
                                                                        .bold
                                                                    : FontWeight
                                                                        .normal),
                                                      ),
                                                    ),
                                                    if (messageHistoryItem
                                                            .unseenMessageCount !=
                                                        0)
                                                      Container(
                                                          decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.all(
                                                                  Radius.circular(
                                                                      mediaQuery
                                                                              .width *
                                                                          0.03)),
                                                              color:
                                                                  animagiee_CL),
                                                          padding: EdgeInsets.symmetric(
                                                              vertical: mediaQuery
                                                                      .width *
                                                                  0.008,
                                                              horizontal:
                                                                  mediaQuery
                                                                          .width *
                                                                      0.02),
                                                          child: Text(
                                                            // '10000',
                                                            '${messageHistoryItem.unseenMessageCount}',
                                                            style:
                                                                const TextStyle(
                                                                    color: Colors
                                                                        .white),
                                                          )),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: mediaQuery.width *
                                                        0.185,
                                                    right: mediaQuery.width *
                                                        0.03),
                                                child: SizedBox(
                                                  width: double.infinity,
                                                  height: 1,
                                                  child: Container(
                                                    color:
                                                        const Color(0xffDDDDDD),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    }
                                  });
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
