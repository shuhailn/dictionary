import 'package:dictionary/database/dataloader.dart';
import 'package:dictionary/controller/searchfunction.dart';
import 'package:dictionary/models/searchwordmodel.dart';
import 'package:dictionary/shared/routes/routes.dart';
import 'package:dictionary/view/homepage.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //initialize hive 
  await Hive.initFlutter();
  //register the type adapter
  Hive.registerAdapter(SearchWordModelAdapter());
  await Hive.openBox<SearchWordModel>("searchWordBox");
  late Box<SearchWordModel> dictionaryBox =
      Hive.box<SearchWordModel>("searchWordBox");
  //check the hive box if it is empty load data from the csv file
  if (dictionaryBox.isEmpty) {
    loadData();
  }
  

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routes: appRoutes,
      home: const HomePage(),
    );
  }
}
