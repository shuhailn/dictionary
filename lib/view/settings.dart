import 'package:dictionary/shared/bottomNavBar/bottomNavBar.dart';
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: BottomNavBar(),
      body: Center(
        child: Text("settings"),
      ),
    );
  }
}
