import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        mouseCursor: MaterialStateMouseCursor.textable,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              size: 20,
            ),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.book,
              size: 20,
            ),
            label: "Dictionary",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              size: 20,
            ),
            label: "Settings",
          ),
        ],
        onTap: (int idx) {
          switch (idx) {
            case 0:
              print("0 is pressed");

              break;
            case 1:
              Navigator.pushNamed(context, '/dictionary');
              print("2 pressed");
              break;
            case 2:
              Navigator.pushNamed(context, '/settings');
              print("2 is pressed");
              break;
          }
        });
  }
}
