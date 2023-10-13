import 'package:flutter/material.dart';

class History extends StatefulWidget {
  History({super.key, required this.history});

  @override
  State<History> createState() => _HistoryState();

  late List history = [];
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search History"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => Divider(
                height: 15,
              ),
              itemCount: widget.history.length,
              itemBuilder: (BuildContext context, int index) {
                if (widget.history.isNotEmpty) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: SizedBox(
                      width: 100,
                      height: 60,
                      child: ListTile(
                        leading: Icon(
                          Icons.arrow_right,
                          size: 30,
                        ),
                        tileColor: Color.fromARGB(255, 227, 220, 220),
                        title: Text(widget.history[index]),
                      ),
                    ),
                  );
                  if (widget.history.isEmpty) {
                    return Center(
                      child: Text("Search Word to show up here"),
                    );
                  }
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
