import 'package:dictionary/shared/drawer/drawer.dart';
import 'package:flutter/material.dart';

import '../shared/bottomNavBar/bottomNavBar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchItemController = TextEditingController();
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        elevation: 0,
        title: const Text("Malayalam Dictionary"),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(Icons.share),
          )
        ],
      ),
      body: Stack(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 7,
            ),
            Center(
              child: Container(
                width: 400,
                height: 70,
                decoration: BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadiusDirectional.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadiusDirectional.circular(10),
                        ),
                        width: 150,
                        height: 50,
                        child: Center(child: Text("ENG>MAL")),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadiusDirectional.circular(10),
                      ),
                      width: 150,
                      height: 50,
                      child: Center(child: Text("MAL>ENG")),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    title: Text("data"),
                  ),
                  ListTile(
                    title: Text("data"),
                  ),
                  ListTile(
                    title: Text("data"),
                  ),
                  ListTile(
                    title: Text("data"),
                  ),
                ],
              ),
            ),
            SearchBar(searchItemController: searchItemController)
          ],
        ),
      ]),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({
    super.key,
    required this.searchItemController,
  });

  final TextEditingController searchItemController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 70,
          width: 400,
          color: Colors.blue,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.history),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(32),
                ),
                width: 280,
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Type English Word",
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(10),
                  ),
                  controller: searchItemController,
                ),
              ),
              Icon(Icons.mic)
            ],
          ),
        ),
      ),
    );
  }
}
