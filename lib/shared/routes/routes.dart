

import 'package:dictionary/view/history.dart';
import 'package:dictionary/view/malayalamsearch.dart';
import 'package:dictionary/view/mdictionary.dart';
import 'package:dictionary/view/homepage.dart';
import 'package:dictionary/view/settings.dart';

var appRoutes = {
  '/ ': (context) => const HomePage(),
  '/dictionary': (context) =>  DataPage(),
  '/settings': (context) =>  Settings(),
  // '/malayalamsearch': (context) => MalayalamSearchPage(),
  // '/history': (icontext) =>  History(history: [],),
  
};
