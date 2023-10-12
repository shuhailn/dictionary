

import 'package:dictionary/ui/history.dart';
import 'package:dictionary/ui/mdictionary.dart';
import 'package:dictionary/ui/homepage.dart';
import 'package:dictionary/ui/settings.dart';

var appRoutes = {
  '/ ': (context) => const HomePage(),
  '/dictionary': (context) =>  DataPage(),
  '/settings': (context) =>  Settings(),
  // '/history': (icontext) =>  History(history: [],),
  
};
