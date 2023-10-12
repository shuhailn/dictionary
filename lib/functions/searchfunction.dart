import 'package:dictionary/models/searchwordmodel.dart';
import 'package:hive/hive.dart';

Future<List<SearchWordModel>> getSearchWord(
    String searchWord, String searchType) async {
  //create new list  for adding found values
  List<SearchWordModel> foundItems = [];

  //Open new instance of the search box
  final Box<SearchWordModel> dictionaryBox =
      Hive.box<SearchWordModel>("searchWordBox");

  //convert the box values into list
  List<SearchWordModel> meaningWord = dictionaryBox.values.toList();

  switch (searchType) {
    case 'start':
      meaningWord.forEach((element) {
        if (element.englishWword == searchWord) {
          // if the element is found add to the list that we created
          foundItems.add(element);
        }
      });
      print(searchType);
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
      while (idx < meaningWord.length) {
        if (meaningWord[idx].englishWword.contains(searchWord)) {
          foundItems.add(meaningWord[idx]);
        }

        idx++;
      }

      print(searchType);
  }
  //go through the list for chekcing the value
  // meaningWord.forEach((element) {
  //   if (element.englishWword == searchWord) {
  // if the element is found add to the list that we created
  //     foundItems.add(element);
  //   }
  // });

  return foundItems;
}
