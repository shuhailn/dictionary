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
              Icons.radio_button_off,
              size: 20,
            ),
            label: "Start With",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.radio_button_off,
              size: 20,
            ),
            label: "Contains",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.radio_button_off,
              size: 20,
            ),
            label: "End With",
          ),
        ],
        onTap: (int idx) {
          switch (idx) {
            case 0:
              print("0 is pressed");

              break;
            case 1:
              Navigator.pushNamed(context, '/demo');
              print("2 pressed");
              break;
            case 2:
              print("2 is pressed");
              break;
          }
        });
  }
}
