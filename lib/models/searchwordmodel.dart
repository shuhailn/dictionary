// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'searchwordmodel.g.dart';

@HiveType(typeId: 0)
class SearchWordModel {
  @HiveField(0)
  late int? id;

  @HiveField(1)
  late String key;

  @HiveField(2)
  late String englishWword;

  @HiveField(3)
  late String wordType;

  @HiveField(4)
  late String malayalamWord;

  SearchWordModel({
    this.id,
    required this.key,
    required this.englishWword,
    required this.wordType,
    required this.malayalamWord,
  });
}
