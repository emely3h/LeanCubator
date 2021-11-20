import 'package:flutter/material.dart';

import 'chat_bubble.dart';

class ChatContainer extends StatefulWidget {
  const ChatContainer({Key? key}) : super(key: key);

  @override
  _ChatContainerState createState() => _ChatContainerState();
}

class _ChatContainerState extends State<ChatContainer> {
  final view_controller = ScrollController();
  final myController = TextEditingController();
  bool current_user(index) {
    if (index / 2 == 0) {
      print(index / 2);
      return true;
    } else {
      return false;
    }
  }
  double pos = 0;

  List<String> messages = [
    'asdfasdfasdfasdfasdfasfdasdf',
    'adfasdfasdfasdfasdfasdf',
    'asdfasdfasdfasdfasdfasfdasdf',
    'asdfasdfasdfasdfasdfasfdasdf',
    'asdfasdfasdfasdfasdfasfdasdf',
    'asdfasdfasdfasdfasdfasfdasdf',
    'asdfasdfasdfasdfasdfasfdasdf',
    'asdfasdfasdfasdfasdfasfdasdf',
    'asdfasdfasdfasdfasdfasfdasdf',
    'asdfasdfasdfasdfasdfasfdasdf',
  ];

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  void send_message(String message) {
    myController.clear();
    setState(() {
      messages = [...messages, message];
    });
    view_controller.jumpTo(view_controller.position.maxScrollExtent);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 390,
            child: ListView.builder(
              itemCount: messages.length,
              controller: view_controller,
              itemBuilder: (BuildContext context, int index) {
                return ChatBubble(
                  text: messages[index],
                  isCurrentUser: current_user(index),
                );
              },
            ),
          ),
          Row(
            children: [
              Container(
                width: 900,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextField(
                    controller: myController,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter your message'),
                  ),
                ),
              ),
              FloatingActionButton(
                onPressed: () {
                  print('länge: ' + messages.length.toString());
                  send_message(myController.text);
                  print('länge: ' + messages.length.toString());
                  view_controller.jumpTo(pos+=250);
                },
                child: Icon(Icons.send),
              )
            ],
          ),
        ],
      ),
    );
  }
}
