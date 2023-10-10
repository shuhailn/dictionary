import 'package:csv/csv.dart';
import 'package:dictionary/models/searchwordmodel.dart';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';

Future<void> loadData() async {
  // Define the path to the CSV file
  final String csvPath = "assets/dataset/dictionary.csv";

  // Load the CSV file from the assets
  final myData = await rootBundle.load(csvPath);

  // Decode the CSV data
  String content = utf8.decode(myData.buffer.asUint8List());

  // Create a new instance of the created box
  late Box<SearchWordModel> dictionaryBox =
      Hive.box<SearchWordModel>("searchWordBox");

  // Convert the CSV data into a list using the csv package
  List<List<dynamic>> fields = const CsvToListConverter().convert(content);

  // Iterate through the list
  fields.forEach((element) {
    final word = SearchWordModel(
      englishWword: element[1].toString(),
      key: element[0].toString(),
      wordType: element[2].toString(),
      malayalamWord: element[3].toString(),
    );
    dictionaryBox.add(word);
  });
  print("datalodaer function is called");
}
