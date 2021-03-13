import 'package:flutter/material.dart';
import 'package:wandr_frontend/views/tabs/search.dart';
import 'package:wandr_frontend/views/tabs/event.dart';
import 'package:wandr_frontend/views/tabs/chats.dart';

class searchEvent extends StatefulWidget {

  @override
  _searchEventState createState() => _searchEventState();
}

class _searchEventState extends State<searchEvent> {

  int _currentIndex = 0;

  final List<Widget> _pages = [
    searchPage(),
    eventPage(),
    chatPage(),
  ];
  @override
  Widget build(BuildContext context) {

    final bottomNavBar = BottomNavigationBar(
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.grey.shade300,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          title: Text("Search"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today),
          title: Text("Events"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat),
          title: Text("Chats"),
        )
      ],
      onTap: (index){
        setState(() {
          _currentIndex = index;
        });
      },
    );
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
        ),
      ),

      bottomNavigationBar: bottomNavBar,
      body: _pages[_currentIndex],
    );


  }
}
