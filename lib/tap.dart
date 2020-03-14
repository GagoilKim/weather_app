import 'package:flutter/material.dart';
import 'home.dart';
import 'list.dart';

class Tappage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TappageState();
}

class _TappageState extends State<Tappage> {
  int _selectionIndex = 0;
  final _pageOptions = [HomePage(), ListPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageOptions[_selectionIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: _onItemTapped,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.black54,),
              backgroundColor: Colors.black54,
              title: Text("Home"),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.list, color: Colors.black54,),
                backgroundColor: Colors.black54,
                title: Text("List")
            )
          ]),
    );
  }

  void _onItemTapped(int value) {
    setState(() {
      _selectionIndex = value;
    });
  }
}

