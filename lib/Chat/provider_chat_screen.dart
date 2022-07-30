import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/chat_provider.dart';
import '../constant.dart';

final _firestore = FirebaseFirestore.instance;
// late String email;
String? messageText;

class ProviderChatScreen extends StatefulWidget {
  const ProviderChatScreen({Key? key}) : super(key: key);

  @override
  _ProviderChatScreenState createState() => _ProviderChatScreenState();
}

class _ProviderChatScreenState extends State<ProviderChatScreen> {
  var chatMsgTextController = TextEditingController();
  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    // getCurrentUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic>? documents =
        Provider.of<Map<String, dynamic>?>(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: kDarkBlue),
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size(25, 2),
          child: Container(
            child: const LinearProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              backgroundColor: kLightBlue,
            ),
            decoration: const BoxDecoration(
                // color: Colors.blue,
                // borderRadius: BorderRadius.circular(20)
                ),
            constraints: const BoxConstraints.expand(height: 1),
          ),
        ),
        backgroundColor: Colors.white10,
        // leading: Padding(
        //   padding: const EdgeInsets.all(12.0),
        //   child: CircleAvatar(backgroundImage: NetworkImage('https://cdn.clipart.email/93ce84c4f719bd9a234fb92ab331bec4_frisco-specialty-clinic-vail-health_480-480.png'),),
        // ),
        title: const Center(
          child: Text(
            'Inbox',
            style: TextStyle(
                fontFamily: 'Poppins', fontSize: 20, color: kDarkBlue),
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_ios_sharp),
        ),
        actions: <Widget>[
          GestureDetector(
            child: const Padding(
              padding: EdgeInsets.only(right: 24.0),
              child: Icon(
                Icons.keyboard_backspace,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const SellerChatStream(),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Material(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white,
                    elevation: 5,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 8.0, top: 2, bottom: 2),
                      child: TextField(
                        onChanged: (value) {
                          messageText = value;
                          print(value);
                        },
                        controller: chatMsgTextController,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          hintText: 'Type your message here...',
                          hintStyle:
                              TextStyle(fontFamily: 'Poppins', fontSize: 14),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
                MaterialButton(
                    shape: const CircleBorder(),
                    color: kDarkBlue,
                    onPressed: () {
                      if (documents != null) {
                        chatMsgTextController.clear();
                        _firestore
                            .collection('Users')
                            .doc(context.read<ChatProvider>().customerUid)
                            .collection('Chat')
                            .add({
                          'assignReceiverUid':
                              context.read<ChatProvider>().customerUid,
                          'text': messageText,
                          'timestamp': DateTime.now().millisecondsSinceEpoch,
                          'senderUid': FirebaseAuth.instance.currentUser!.uid,
                          'assignReceiverName':
                              context.read<ChatProvider>().customerName,
                          'senderName': documents['userName'].toString(),
                          'senderProfileURL':
                              documents['profileURL'].toString(),
                          'receiverProfileURL': context
                              .read<ChatProvider>()
                              .customerProfileURL
                              .toString(),
                        }).whenComplete(() => print(
                                'added in firebase from worker chat screen.'));
                      }
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Icon(
                        Icons.send,
                        color: Colors.white,
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SellerChatStream extends StatelessWidget {
  const SellerChatStream({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore
          .collection('Buyers')
          .doc(context.read<ChatProvider>().customerUid)
          .collection('messages')
          .orderBy('timestamp')
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(backgroundColor: kDarkBlue),
          );
        }
        print('messages bubbles');
        snapshot.data!.docs.map((e) {
          print(e.get('text'));
        });
        final messages = snapshot.data!.docs.reversed;
        List<SellerMessageBubble> messageWidgets = [];
        final receiverEmail = context.read<ChatProvider>().customerUid;
        for (var message in messages) {
          final msgText = message.get('text');
          final msgSender = message.get('senderUid');
          print('text message: $msgText');
          final assignReceiverEmail = message.get('assignReceiverUid');
          final currentUser = FirebaseAuth.instance.currentUser!.uid;
          final msgBubble = SellerMessageBubble(
            msgText: msgText,
            msgSender: msgSender,
            user: currentUser == msgSender,
          );
          if ((msgSender == FirebaseAuth.instance.currentUser!.uid &&
                  assignReceiverEmail == receiverEmail) ||
              (msgSender == receiverEmail &&
                  assignReceiverEmail ==
                      FirebaseAuth.instance.currentUser!.uid)) {
            // if (assignReceiverEmail == receiverEmail ||
            //     assignReceiverEmail ==
            //         FirebaseAuth.instance.currentUser!.email) {
            messageWidgets.add(msgBubble);
            // }
          }
          // messageWidgets.add(msgBubble);
        }
        return Expanded(
          child: ListView(
            reverse: true,
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            children: messageWidgets,
          ),
        );
      },
    );
    // : Center(
    //     child: CircularProgressIndicator(
    //       color: Colors.lightGreen,
    //     ),
    //   );
  }
}

class SellerMessageBubble extends StatelessWidget {
  final String msgText;
  final String msgSender;
  final bool user;
  const SellerMessageBubble(
      {required this.msgText, required this.msgSender, required this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Column(
        crossAxisAlignment:
            user ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: const Text(
              // msgSender,
              '',
              style: TextStyle(
                  fontSize: 13, fontFamily: 'Poppins', color: Colors.black87),
            ),
          ),
          Material(
            borderRadius: BorderRadius.only(
              bottomLeft: const Radius.circular(50),
              topLeft:
                  user ? const Radius.circular(50) : const Radius.circular(0),
              bottomRight: const Radius.circular(50),
              topRight:
                  user ? const Radius.circular(0) : const Radius.circular(50),
            ),
            color: user ? kDarkBlue : Colors.white,
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                msgText,
                style: TextStyle(
                  color: user ? Colors.white : kDarkBlue,
                  fontFamily: 'Poppins',
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
