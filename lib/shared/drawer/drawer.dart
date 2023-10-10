import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: SafeArea(
        child: Column(
          children: [
            Container(
              color: Colors.black,
              height: 70,
              child: Center(
                child: Text(
                  "English <-> Malayalam  Dictionary",
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    title: Text("Tools"),
                  ),
                  ListTile(
                    title: Text("Poems"),
                  ),
                  ListTile(
                    title: Text("Proverbs"),
                  ),
                  ListTile(
                    title: Text("Riddles"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
