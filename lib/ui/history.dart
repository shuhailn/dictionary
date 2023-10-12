import 'package:flutter/material.dart';

class History extends StatelessWidget {
  History({super.key, required this.history});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search History"),
      ),
      body: ListView.builder(
        itemCount: history.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(history[index]),
          );
        },
      ),
    );
  }

  late List history = [];
}
