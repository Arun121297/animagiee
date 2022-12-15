import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/view/chats/controller/chat-1.dart';
import 'package:animagieeui/controller/controller.dart';
import 'package:animagieeui/view/chats/view/chatscreen1.dart';
import 'package:animagieeui/view/chats/view/sendbox.dart';
// import 'package:animagieeui/view/chats/view/singlechatoption.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:grouped_list/grouped_list.dart';
import 'singlechatoption.dart';
import 'Message.dart';
// import 'individualchatcontent.dart';

class Chatting_Screen_UI extends StatefulWidget {
  Chatting_Screen_UI({Key? key}) : super(key: key);

  @override
  State<Chatting_Screen_UI> createState() => _Chatting_Screen_UIState();
}

class _Chatting_Screen_UIState extends State<Chatting_Screen_UI> {
  Controller controller = Get.put(Controller());
  ChatController chatController = Get.put(ChatController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          SizedBox(
            child: Column(
              children: [
                controller.chatscreenapp("Karthi", const Chat_UI(), context),
                Expanded(
                  child:
                      // Message()
                      // SizedBox()
                      SizedBox(
                          child: StreamBuilder(
                              stream: FirebaseFirestore.instance
                                  .collection('data')
                                  .snapshots(),
                              builder: (BuildContext context,
                                  AsyncSnapshot<QuerySnapshot> snapshot) {
                                if (!snapshot.hasData) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else {
                                  return GroupedListView<Message, DateTime>(
                                    useStickyGroupSeparators: true,
                                    floatingHeader: true,
                                    reverse: true,
                                    order: GroupedListOrder.DESC,
                                    padding: const EdgeInsets.all(8),
                                    elements: chatController.messsages.obs,
                                    groupBy: (messsages) => DateTime(
                                        messsages.date.year,
                                        messsages.date.month,
                                        messsages.date.day),
                                    groupHeaderBuilder: (Message message) =>
                                        SizedBox(
                                      height: 40,
                                      child: Center(
                                        child: Card(
                                          color: Colors.blue,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8),
                                            child: Text(DateFormat.yMMMd()
                                                .format(message.date)),
                                          ),
                                        ),
                                      ),
                                    ),
                                    itemBuilder: (context, Message messsages) {
                                      return Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children:
                                            snapshot.data!.docs.map((document) {
                                          return Column(
                                            children: [
                                              Visibility(
                                                  visible:
                                                      !messsages.isSentByMe,
                                                  child: const CircleAvatar(
                                                    backgroundImage:
                                                        ExactAssetImage(
                                                            'images/Cats.jpg'),
                                                  )),
                                              Align(
                                                alignment: messsages.isSentByMe
                                                    ? Alignment.centerRight
                                                    : Alignment.centerLeft,
                                                child: Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 8.0),
                                                    child: Card(
                                                      elevation: 8,
                                                      child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8),
                                                          child: Text(messsages
                                                              .text
                                                              .toString())),
                                                    )),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Container(
                                                  alignment: messsages
                                                          .isSentByMe
                                                      ? Alignment.centerRight
                                                      : Alignment.centerLeft,
                                                  child: Text(
                                                    DateFormat('')
                                                        .add_jms()
                                                        .format(messsages.date),
                                                    style: const TextStyle(
                                                        fontSize: 12),
                                                  ),
                                                ),
                                              )
                                            ],
                                          );
                                        }).toList(),
                                      );
                                    },
                                  );
                                }
                              })),
                  //GroupedListView<Message, DateTime>(
                  //           useStickyGroupSeparators: true,
                  //           floatingHeader: true,
                  //           reverse: true,
                  //           order: GroupedListOrder.ASC,
                  //           padding: const EdgeInsets.all(8),
                  //           elements: chatController.messsages.obs,
                  //           groupBy: (messsages) => DateTime(
                  //               messsages.date.year,
                  //               messsages.date.month,
                  //               messsages.date.day),
                  //           groupHeaderBuilder: (Message message) => SizedBox(
                  //             height: 40,
                  //             child: Center(
                  //               child: Card(
                  //                 color: Colors.blue,
                  //                 child: Padding(
                  //                   padding: const EdgeInsets.all(8),
                  //                   child: Text(DateFormat.yMMMd()
                  //                       .format(message.date)),
                  //                 ),
                  //               ),
                  //             ),
                  //           ),
                  //           itemBuilder: (context, Message messsages) {
                  //             return Column(
                  //               mainAxisAlignment: MainAxisAlignment.start,
                  //               crossAxisAlignment: CrossAxisAlignment.start,
                  //               children: snapshot.data!.docs.map((document) {
                  //                 return Column(
                  //                   children: [
                  //                     Visibility(
                  //                         visible: !messsages.isSentByMe,
                  //                         child: const CircleAvatar(
                  //                           backgroundImage: ExactAssetImage(
                  //                               'images/Cats.jpg'),
                  //                         )),
                  //                     Align(
                  //                       alignment: messsages.isSentByMe
                  //                           ? Alignment.centerRight
                  //                           : Alignment.centerLeft,
                  //                       child: Padding(
                  //                           padding: const EdgeInsets.symmetric(
                  //                               horizontal: 8.0),
                  //                           child: Card(
                  //                             elevation: 8,
                  //                             child: Padding(
                  //                                 padding:
                  //                                     const EdgeInsets.all(8),
                  //                                 child: Text(messsages.text
                  //                                     .toString())),
                  //                           )),
                  //                     ),
                  //                     Padding(
                  //                       padding: const EdgeInsets.all(8.0),
                  //                       child: Container(
                  //                         alignment: messsages.isSentByMe
                  //                             ? Alignment.centerRight
                  //                             : Alignment.centerLeft,
                  //                         child: Text(
                  //                           DateFormat('')
                  //                               .add_jms()
                  //                               .format(messsages.date),
                  //                           style:
                  //                               const TextStyle(fontSize: 12),
                  //                         ),
                  //                       ),
                  //                     )
                  //                   ],
                  //                 );
                  //               }).toList(),
                  //             );
                  //           },
                  //         );
                  //         // ListView(
                  //         //   children: snapshot.data!.docs.map((document) {
                  //         //     return Individual_Chat_Content(
                  //         //         fetchindex: snapshot, doc: document['text']);
                  //         //     // Container(
                  //         //     //   child: Center(child: Text(document['text'])),
                  //         //     // );
                  //         //   }).toList(),
                  //         // );
                  //       }
                  //     },
                  //   ),
                  // ),

                  // ListView.builder(
                  //     itemCount: 5,
                  //     itemBuilder: (context, index) =>
                  //         Individual_Chat_Content(
                  //           fetchindex: index,
                  //         ))
                ),
                Send_Box_UI(),
                SizedBox(height: 2.0.hp
                    //  38,
                    ),
              ],
            ),
          ),
          const Single_Chat_Options_UI(),
        ]),
      ),
    );
  }
}
