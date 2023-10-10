import 'package:flutter/material.dart';

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
