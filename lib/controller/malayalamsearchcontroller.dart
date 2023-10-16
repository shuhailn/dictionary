import 'package:dictionary/models/searchwordmodel.dart';
import 'package:hive/hive.dart';

import 'dart:core';

Future<List<SearchWordModel>> getSearchWordMalayalam(
    String searchWordMalayalam, String malayalamSearchType) async {
  //create new list  for adding found values
  List<SearchWordModel> foundItemsMalayalamList = [];

  //Open new instance of the search box
  final Box<SearchWordModel> dictionaryBox =
      Hive.box<SearchWordModel>("searchWordBox");
  RegExp regExpStart = RegExp(
    '^$searchWordMalayalam',
    caseSensitive: false,
  );
  RegExp regExpEndWith = RegExp(
    '$searchWordMalayalam\$',
    caseSensitive: false,
  );

  //convert the box values into list
  List<SearchWordModel> meaningWord = dictionaryBox.values.toList();

  switch (malayalamSearchType) {
    case 'start':
      foundItemsMalayalamList = meaningWord
          .where((word) => regExpStart.hasMatch(word.malayalamWord))
          .toList();

    case "contains":
      int idx = 0;
      while (idx < meaningWord.length) {
        if (meaningWord[idx].malayalamWord.contains(searchWordMalayalam)) {
          foundItemsMalayalamList.add(meaningWord[idx]);
        }

        idx++;
      }
      print(malayalamSearchType);
    case "endwith":
      int idx = 0;
      while (idx < meaningWord.length && malayalamSearchType.toString() != '') {
        if (regExpEndWith.hasMatch(meaningWord[idx].malayalamWord)) {
          foundItemsMalayalamList.add(meaningWord[idx]);
        }

        idx++;
      }
  }

  return foundItemsMalayalamList;
}
