import 'package:dictionary/models/searchwordmodel.dart';
import 'package:hive/hive.dart';

import 'dart:core';

Future<List<SearchWordModel>> getSearchWord(
    String searchWord, String searchType) async {
  //create new list  for adding found values
  List<SearchWordModel> foundItems = [];

  //Open new instance of the search box
  final Box<SearchWordModel> dictionaryBox =
      Hive.box<SearchWordModel>("searchWordBox");
  RegExp regExpStart = RegExp(
    '^$searchWord',
    caseSensitive: false,
  );
  RegExp regExpEndWith = RegExp(
    '$searchWord\$',
    caseSensitive: false,
  );

  //convert the box values into list
  List<SearchWordModel> meaningWord = dictionaryBox.values.toList();

  switch (searchType) {
    case 'start':
      // int idx1 = 0;
      // while (idx1 < meaningWord.length) {
      //   int _counter = 0;
      //   if (regExpStart.hasMatch(meaningWord[idx1].englishWword) &&
      //       _counter <= 25) {
      //     // if the element is found add to the list that we created
      //     foundItems.add(meaningWord[idx1]);
      //     _counter++;
      //   }
      // }
      foundItems = meaningWord
          .where((word) => regExpStart.hasMatch(word.englishWword))
          .toList();


    case "contains":
      int idx = 0;
      while (idx < meaningWord.length) {
        if (meaningWord[idx].englishWword.contains(searchWord)) {
          foundItems.add(meaningWord[idx]);
        }

        idx++;
      }
      print(searchType);
    case "endwith":
      int idx = 0;
      while (idx < meaningWord.length && searchType.toString() != '') {
        if (regExpEndWith.hasMatch(meaningWord[idx].englishWword)) {
          foundItems.add(meaningWord[idx]);
        }

        idx++;
      }

      print(searchType);
  }

  return foundItems;
}
