import 'package:dictionary/models/searchwordmodel.dart';
import 'package:hive/hive.dart';

List getSearchWord(String searchWord) {
  List<SearchWordModel> foundItems = [];

  final Box<SearchWordModel> dictionaryBox =
      Hive.box<SearchWordModel>("searchWordBox");
  List<SearchWordModel> meaningWord = dictionaryBox.values.toList();
  print(meaningWord);
  print(meaningWord.length);
  meaningWord.forEach((element) {
    if (element.englishWword == searchWord) {
      foundItems.add(element);
    }
  });
  print(foundItems);
  print(foundItems.length);
  return foundItems;
}
