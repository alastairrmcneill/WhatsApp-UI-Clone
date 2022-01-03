// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:whatsapp_clone/models/message_model.dart';
import 'package:whatsapp_clone/models/user_model.dart';

class conversationScreen extends StatefulWidget {
  final User user;

  conversationScreen({required this.user});

  @override
  _conversationScreenState createState() => _conversationScreenState();
}

class _conversationScreenState extends State<conversationScreen> {
  Widget _buildMessage(Message message, bool isMe) {
    return Container(
      margin: isMe
          ? EdgeInsets.only(
              left: 80,
              right: 8,
              top: 8,
              bottom: 8,
            )
          : EdgeInsets.only(
              left: 8,
              right: 80,
              top: 8,
              bottom: 8,
            ),
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
      decoration: BoxDecoration(
        color: isMe ? Color.fromRGBO(231, 254, 214, 1) : Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            message.time,
            style: TextStyle(
              color: Colors.blueGrey,
              fontSize: 10,
              fontWeight: FontWeight.w300,
            ),
          ),
          SizedBox(height: 5.0),
          Text(
            message.text,
            style: TextStyle(
              color: Colors.grey.shade700,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageComposer() {
    return Container(
      height: 70,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.white,
                ),
                height: 40,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.emoji_emotions_outlined, color: Colors.grey),
                    ),
                    Expanded(
                      child: TextField(
                        textCapitalization: TextCapitalization.sentences,
                        decoration: InputDecoration.collapsed(hintText: 'Message', hintStyle: TextStyle(color: Colors.grey.shade500)),
                      ),
                    ),
                    Icon(Icons.attach_file_outlined, color: Colors.grey),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.camera_alt_rounded, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
          ),
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.green,
            child: Icon(
              Icons.mic,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Transform.translate(
          offset: Offset(-30.0, 0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundImage: AssetImage(widget.user.imageUrl),
                ),
              ),
              Text(
                widget.user.name,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 24,
                ),
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Icon(Icons.videocam),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Icon(Icons.call_rounded),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/whatsapp_background.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  padding: EdgeInsets.only(bottom: 0),
                  reverse: true,
                  itemCount: messages.length,
                  itemBuilder: (BuildContext context, int index) {
                    final message = messages[index];
                    bool isMe = message.sender.id == currentUser.id;
                    return _buildMessage(message, isMe);
                  }),
            ),
            _buildMessageComposer(),
          ],
        ),
      ),
    );
  }
}
