import 'package:flutter/material.dart';
import 'package:dictionary/models/searchwordmodel.dart';
import 'package:hive/hive.dart';

class DataPage extends StatefulWidget {
  @override
  _DataPageState createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  late Future<List<SearchWordModel>> dataFuture;

  @override
  void initState() {
    super.initState();
    dataFuture = readData();
  }

  Future<List<SearchWordModel>> readData() async {
    

    final Box<SearchWordModel> dictionaryBox =
        Hive.box<SearchWordModel>("searchWordBox");
    List<SearchWordModel> data = dictionaryBox.values.toList();
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Page'),
      ),
      body: FutureBuilder<List<SearchWordModel>>(
        future: dataFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text('No data available.'),
            );
          } else {
            // Display your data here
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final item = snapshot.data![index];
                return ListTile(
                  title: Text(item.englishWword),
                  subtitle: Text(item.malayalamWord),
                  trailing: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 163, 160, 150),
                      borderRadius: BorderRadiusDirectional.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        item.wordType,
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                  
                );
              },
            );
          }
        },
      ),
    );
  }
}
