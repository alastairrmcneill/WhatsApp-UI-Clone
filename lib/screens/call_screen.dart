// ignore_for_file: prefer_const_constructors

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:whatsapp_clone/models/calls_model.dart';

class CallsScreen extends StatefulWidget {
  const CallsScreen({Key? key}) : super(key: key);

  @override
  _CallsScreenState createState() => _CallsScreenState();
}

class _CallsScreenState extends State<CallsScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: calls.length,
      itemBuilder: (BuildContext context, int index) {
        final Call call = calls[index];

        return Padding(
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
                    backgroundImage: AssetImage(call.caller.imageUrl),
                    radius: 25,
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        call.caller.name,
                        style: TextStyle(
                          color: Colors.blueGrey.shade700,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: call.isInbound
                                ? Icon(
                                    Icons.call_received,
                                    color: Colors.green,
                                    size: 15,
                                  )
                                : Icon(
                                    Icons.call_made,
                                    color: Colors.green,
                                    size: 15,
                                  ),
                          ),
                          SizedBox(width: 3),
                          Text(
                            call.time,
                            style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 13.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
              call.isVideo
                  ? Icon(
                      Icons.videocam_rounded,
                      color: Color.fromRGBO(50, 136, 124, 1),
                    )
                  : Icon(
                      Icons.phone_rounded,
                      color: Color.fromRGBO(50, 136, 124, 1),
                    )
            ],
          ),
        );
      },
    );
  }
}
