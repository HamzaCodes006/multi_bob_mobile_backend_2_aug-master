import 'package:flutter/material.dart';

// final _firestore = FirebaseFirestore.instance;
// User loggedInUser;

class ChatScreen extends StatefulWidget {
  static String id = 'chat_screen';
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final messageTextController = TextEditingController();
  //final _auth = FirebaseAuth.instance;
  String textMessage = '';

  get kMessageContainerDecoration => const BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
        ),
      );

  get kMessageTextFieldDecoration => const InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        hintText: 'Type your message here...',
        border: InputBorder.none,
      );

  get kSendButtonTextStyle => const TextStyle(
        color: Colors.lightBlueAccent,
        fontWeight: FontWeight.bold,
        fontSize: 18.0,
      );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentUser();
  }

  void currentUser() async {
    // try {
    //   final user = await _auth.currentUser;
    //   if (user != null) {
    //     // loggedInUser = user;
    //     // print(loggedInUser.email);
    //   }
    // } catch (e) {
    //   print(e);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                //_auth.signOut();
                //Navigator.pop(context);
              }),
        ],
        title: const Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MessagesStream(),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: messageTextController,
                      onChanged: (value) {
                        textMessage = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      // _firestore.collection('messages').add({
                      //   'sender': loggedInUser.email,
                      //   'text': textMessage,
                      // });
                      messageTextController.clear();
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessagesStream extends StatelessWidget {
  get currentUser => null;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder/*<QuerySnapshot>*/(
        //stream: _firestore.collection('messages').snapshots(),
        builder: (context, snapshot) {
      if (!snapshot.hasData) {
        return const Center(
          child: CircularProgressIndicator(
            backgroundColor: Colors.lightBlueAccent,
          ),
        );
      }
      List<MessageBubble> messageBubbles = [];
      final messages/*= snapshot.data.docs.reversed*/;
      // for (var message in messages) {
      //   final sender = message.get('sender');
      //   final text = message.get('text');
      //   //final currentUser = loggedInUser.email;
      //
      //   final messageBubble = MessageBubble(
      //       text: text, sender: sender, isMe: currentUser == sender);
      //   messageBubbles.add(messageBubble);
      // }
      return Expanded(
        child: ListView(
          reverse: true,
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
          children: messageBubbles,
        ),
      );
    });
  }
}

class MessageBubble extends StatelessWidget {
  MessageBubble({
    required this.text,
    required this.sender,
    required this.isMe,
  });

  final String text;
  final String sender;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            sender,
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.black54,
            ),
          ),
          Material(
            elevation: 5.0,
            borderRadius: isMe
                ? BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                  )
                : BorderRadius.only(
                    topRight: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                  ),
            color: isMe ? Colors.lightBlueAccent : Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                '$text',
                style: TextStyle(
                  color: isMe ? Colors.white : Colors.black54,
                  fontSize: 15.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
