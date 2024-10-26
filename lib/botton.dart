import 'package:flutter/material.dart';

import 'Cartpage.dart';
import 'Homepage.dart';

class bottonbar extends StatefulWidget {
  const bottonbar({super.key});

  @override
  State<bottonbar> createState() => _bottonbarState();
}

class _bottonbarState extends State<bottonbar> {
  int currentindex = 0;
  List Pagelist = [
    Homepage(),
    Cartpage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Color(0xFFFE5150),
          selectedFontSize: 18,
          unselectedItemColor: Colors.black,
          currentIndex: currentindex,
          onTap: (index) {
            setState(() {
              currentindex = index;
            });
          },
          backgroundColor: Colors.white,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ]),
      body: Pagelist[currentindex],
    );
  }
}
