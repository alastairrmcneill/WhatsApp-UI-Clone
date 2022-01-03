import 'package:flutter/material.dart';
import 'package:whatsapp_clone/models/message_model.dart';

class chatsScreen extends StatefulWidget {
  const chatsScreen({Key? key}) : super(key: key);

  @override
  _chatsScreenState createState() => _chatsScreenState();
}

class _chatsScreenState extends State<chatsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (BuildContext context, int index) {
          final Message chat = chats[index];
          return Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(chat.sender.imageUrl),
                radius: 30.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(chat.sender.name),
                  Text(chat.text),
                ],
              ),
              Column(
                children: [
                  Text(chat.time),
                  Text(chat.unread.toString()),
                ],
              ),
              // Column(
              //   children: [
              //     Row(
              //       children: [
              //         Text(chat.sender.name),

              //         Text(chat.time),
              //       ],
              //     ),
              //     Row(
              //       children: [
              //         Icon(Icons.check),
              //         Text(chat.text),
              //       ],
              //     )
              //   ],
              // ),
            ],
          );
        },
      ),
    );
  }
}
