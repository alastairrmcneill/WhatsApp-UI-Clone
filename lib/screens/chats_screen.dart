import 'package:flutter/material.dart';
import 'package:whatsapp_clone/models/message_model.dart';
import 'package:whatsapp_clone/screens/conversation_screen.dart';

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
          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => conversationScreen(user: chat.sender),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10.0,
                right: 10.0,
                top: 12,
                bottom: 12,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(chat.sender.imageUrl),
                        radius: 25.0,
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            chat.sender.name,
                            style: TextStyle(
                              color: Colors.blueGrey.shade700,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: Text(
                              chat.text,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 13.0,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        chat.time,
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 11.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 5),
                      chat.unread
                          ? CircleAvatar(
                              backgroundColor: Colors.green,
                              radius: 10,
                              child: Text(
                                '1',
                                style: TextStyle(color: Colors.white, fontSize: 10.0, fontWeight: FontWeight.w600),
                              ),
                            )
                          : Text(''),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
