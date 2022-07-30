import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skilled_bob_app_web/Chat/customer_chat_screen.dart';
import 'package:skilled_bob_app_web/Chat/provider_chat_screen.dart';
import 'package:skilled_bob_app_web/constant.dart';

import '../Providers/chat_provider.dart';

class CustomerMainChatScreen extends StatefulWidget {
  const CustomerMainChatScreen({Key? key}) : super(key: key);

  @override
  _CustomerMainChatScreenState createState() => _CustomerMainChatScreenState();
}

class _CustomerMainChatScreenState extends State<CustomerMainChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kLightBlue,
        title: const Text(
          'Chat',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collectionGroup('Chat')
                    .orderBy(
                      'timestamp',
                      descending: true,
                    )
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    print(snapshot.error);
                    // print(snapshot.hasError);
                    return const Center(child: Text('Something went wrong'));
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Text("Loading");
                  }
                  // if(snapshot.hasData){
                  //   // Map<String, dynamic> map={
                  //   //   'assignReceiverUid':snapshot.data.docs.first.get('assignReceiverUid'),
                  //   //   'senderUid':snapshot.data.docs.first.get('senderUid'),
                  //   //   'text':snapshot.data.docs.first.get('text'),
                  //   //   'timestamp':snapshot.data.docs.first.get('timestamp'),
                  //   // };
                  //   // map.addAll({'newEntries':'ss'});
                  //   // snapshot.data.docs.forEach((element) {
                  //   //   list.add(element.get('assignReceiverUid'));
                  //   // });
                  // }
                  //snapshot.data.docs.forEach((element) {print(element.id);});
                  final listReceiver = [];
                  final listSender = [];
                  final profileURL = [];
                  final userName = [];
                  bool check = true;
                  return ListView(
                    shrinkWrap: true,
                    children:
                        snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> data =
                          document.data() as Map<String, dynamic>;
                      if (listSender.isEmpty) {
                        if ((data['assignReceiverUid'] ==
                                    FirebaseAuth.instance.currentUser!.uid &&
                                data['senderUid'] !=
                                    FirebaseAuth.instance.currentUser!.uid) ||
                            (data['assignReceiverUid'] !=
                                    FirebaseAuth.instance.currentUser!.uid &&
                                data['senderUid'] ==
                                    FirebaseAuth.instance.currentUser!.uid)) {
                          if (data['senderUid'] ==
                              FirebaseAuth.instance.currentUser!.uid) {
                            userName.add(data['assignReceiverName']);
                          } else {
                            userName.add(data['senderName']);
                          }
                          print('sssssssss');
                          listReceiver.add(data['assignReceiverUid']);
                          listSender.add(data['senderUid']);
                          profileURL
                              .add(data['receiverProfileURL'] ?? 'default');
                          check = false;
                        } else {}
                      } else {
                        for (int i = 0; i < listReceiver.length; i++) {
                          if (listReceiver[i] == data['assignReceiverUid'] &&
                              listSender[i] == data['senderUid']) {
                            print('upper if');
                            check = true;
                          }
                        }
                        if (check == false) {
                          if ((data['assignReceiverUid'] ==
                                      FirebaseAuth.instance.currentUser!.uid &&
                                  data['senderUid'] !=
                                      FirebaseAuth.instance.currentUser!.uid) ||
                              (data['assignReceiverUid'] !=
                                      FirebaseAuth.instance.currentUser!.uid &&
                                  data['senderUid'] ==
                                      FirebaseAuth.instance.currentUser!.uid)) {
                            print('lower if');
                            if (data['senderUid'] ==
                                FirebaseAuth.instance.currentUser!.uid) {
                              userName.add(data['assignReceiverName']);
                            } else {
                              userName.add(data['senderName']);
                            }
                            listReceiver.add(data['assignReceiverUid']);
                            listSender.add(data['senderUid']);
                            profileURL
                                .add(data['receiverProfileURL'] ?? 'default');
                            check = false;
                          } else {
                            print('lower else');
                            check = true;
                          }
                        }
                      }

                      // if (list.contains(data['assignReceiverUid'])) {
                      //   check = true;
                      // } else {
                      //   // if (data['assignReceiverUid'] ==
                      //   //     FirebaseAuth.instance.currentUser!.uid) {
                      //   //   profileURL.add(data['senderProfileURL']);
                      //   // }
                      //   if (data['assignReceiverUid'] ==
                      //           FirebaseAuth.instance.currentUser!.uid &&
                      //       data['senderUid'] !=
                      //           FirebaseAuth.instance.currentUser!.uid) {
                      //     list.add(data['assignReceiverUid']);
                      //     profileURL.add(data['receiverProfileURL']);
                      //     check = false;
                      //   } else {
                      //     check = true;
                      //   }
                      // }
                      return check == false
                          ? Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 5),
                              child: Card(
                                elevation: 10,
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 10),
                                  child: Row(
                                    children: [
                                      const SizedBox(
                                        width:
                                            // MediaQuery.of(context).size.width /
                                            10,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          // Navigator.push(
                                          //   context,
                                          //   MaterialPageRoute(
                                          //       builder: (context) =>
                                          //           WorkerRequestDetailPage()),
                                          // );
                                        },
                                        child: Row(
                                          children: [
                                            data['receiverProfileURL']
                                                        .toString() ==
                                                    'default'
                                                ? const ClipOval(
                                                    child: Icon(
                                                      Icons.person,
                                                      size: 50,
                                                      color: Colors.grey,
                                                    ),
                                                  )
                                                : Image.network(
                                                    data['receiverProfileURL']
                                                        .toString(),
                                                    width: 50,
                                                    height: 50,
                                                  ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                userName.isNotEmpty
                                                    ? Text(
                                                        "${userName.last}",
                                                        style: const TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                      )
                                                    : const Text(
                                                        "null",
                                                        style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                      ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                SizedBox(
                                                  width: 180,
                                                  child: Text(
                                                    "Last Message: ${document.get('text')}",
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Spacer(),
                                      const SizedBox(
                                        width:
                                            // MediaQuery.of(context).size.width /
                                            10,
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          if (data['assignReceiverUid'] ==
                                              FirebaseAuth
                                                  .instance.currentUser!.uid) {
                                            context
                                                .read<ChatProvider>()
                                                .setProviderUidAndEmail(
                                                    data['senderUid']);
                                          } else {
                                            context
                                                .read<ChatProvider>()
                                                .setProviderUidAndEmail(
                                                    data['assignReceiverUid']);
                                          }

                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const CustomerChatScreen()));
                                        },
                                        icon: const Icon(
                                          Icons.chat,
                                          size: 35,
                                          color: kLightBlue,
                                        ),
                                      ),
                                      const SizedBox(
                                        width:
                                            // MediaQuery.of(context).size.width /
                                            20,
                                      ),
                                      // ElevatedButton(
                                      //   onPressed: () {
                                      //     showDialog(
                                      //       context: context,
                                      //       builder: (BuildContext context) {
                                      //         return AlertDialog(
                                      //           title:
                                      //               Text("Request Completed?"),
                                      //           content: Text(
                                      //               "Are you sure to complete (Close) this request?"),
                                      //           actions: [
                                      //             TextButton(
                                      //               style: TextButton.styleFrom(
                                      //                 primary: Colors.red,
                                      //                 backgroundColor:
                                      //                     Colors.red,
                                      //               ),
                                      //               child: Text(
                                      //                 "Yes Sure",
                                      //                 style: TextStyle(
                                      //                     color: Colors.white),
                                      //               ),
                                      //               onPressed: () {
                                      //                 // await FirebaseFirestore
                                      //                 //     .instance
                                      //                 //     .collection("User")
                                      //                 //     .doc(
                                      //                 //         "${data["userUid"]}")
                                      //                 //     .collection(
                                      //                 //         "Requests")
                                      //                 //     .doc(FirebaseAuth
                                      //                 //         .instance
                                      //                 //         .currentUser
                                      //                 //         .uid)
                                      //                 //     .update({
                                      //                 //   "Status": "Completed"
                                      //                 // }).then((value) => {
                                      //                 //           Navigator.pop(
                                      //                 //               context),
                                      //                 //         });
                                      //               },
                                      //             ),
                                      //           ],
                                      //         );
                                      //       },
                                      //     );
                                      //   },
                                      //   style: ElevatedButton.styleFrom(
                                      //     primary: Colors.green,
                                      //   ),
                                      //   child: Text("Completed"),
                                      // )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          : Container();
                    }).toList(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
