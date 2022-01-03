// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:whatsapp_clone/screens/camera_screen.dart';
import 'package:whatsapp_clone/screens/chats_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text(
            'WhatsApp Clone',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () => {},
              icon: Icon(Icons.search),
              iconSize: 24,
            ),
            IconButton(
              onPressed: () => {},
              icon: Icon(Icons.more_vert),
              iconSize: 24,
            ),
          ],
          bottom: TabBar(
            controller: _tabController,
            indicatorColor: Colors.white,
            labelPadding: EdgeInsets.symmetric(horizontal: 2.0),
            isScrollable: true,
            tabs: [
              Container(
                width: 30,
                height: 50,
                alignment: Alignment.center,
                child: Icon(
                  Icons.camera_alt,
                ),
              ),
              Container(width: 110, height: 50, alignment: Alignment.center, child: Text("CHATS")),
              Container(width: 110, height: 50, alignment: Alignment.center, child: Text("STATUS")),
              Container(width: 110, height: 50, alignment: Alignment.center, child: Text("CALL"))
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            chatsScreen(), // Leaving as is until I can figure out how to get camera working
            chatsScreen(),
            chatsScreen(),
            chatsScreen(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color.fromRGBO(50, 136, 124, 1),
          child: Icon(
            Icons.message,
            color: Colors.white,
          ),
          onPressed: () => {},
        ));
  }
}
