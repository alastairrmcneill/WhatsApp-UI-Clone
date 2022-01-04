// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:whatsapp_clone/screens/call_screen.dart';
import 'package:whatsapp_clone/screens/camera_screen.dart';
import 'package:whatsapp_clone/screens/chats_screen.dart';
import 'package:whatsapp_clone/screens/status_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int selectedIndex = 1;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this, initialIndex: 1);
    _tabController.addListener(() {
      setState(() {
        selectedIndex = _tabController.index;
      });
    });
  }

  FloatingActionButton _buildFAB() {
    if (selectedIndex == 1) {
      return FloatingActionButton(
        backgroundColor: Color.fromRGBO(50, 136, 124, 1),
        child: Icon(
          Icons.message,
          color: Colors.white,
        ),
        onPressed: () => {},
      );
    } else {
      return FloatingActionButton(
        backgroundColor: Color.fromRGBO(50, 136, 124, 1),
        child: Icon(
          Icons.add_call,
          color: Colors.white,
        ),
        onPressed: () => {},
      );
    }
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
          CameraScreen(),
          chatsScreen(),
          StatusScreen(),
          CallsScreen(),
        ],
      ),
      floatingActionButton: _buildFAB(),
    );
  }
}
