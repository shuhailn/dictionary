import 'package:dictionary/functions/searchfunction.dart';
import 'package:dictionary/shared/drawer/drawer.dart';
import 'package:dictionary/ui/history.dart';
import 'package:flutter/material.dart';
import 'package:dictionary/models/searchwordmodel.dart';

import '../shared/bottomNavBar/bottomNavBar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<SearchWordModel>> dataFuture = Future.value([]);
  late List history = [];

  @override
  Widget build(BuildContext context) {
    TextEditingController searchItemController = TextEditingController();
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: _appBar(),
      body: Stack(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 7,
            ),
            Center(
              child: Container(
                width: 400,
                height: 70,
                decoration: BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadiusDirectional.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadiusDirectional.circular(10),
                        ),
                        width: 150,
                        height: 50,
                        child: const Center(child: Text("ENG>MAL")),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadiusDirectional.circular(10),
                      ),
                      width: 150,
                      height: 50,
                      child: const Center(child: Text("MAL>ENG")),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder<List<SearchWordModel>>(
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
                              color: Colors.blue[200],
                              borderRadius:
                                  BorderRadiusDirectional.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                item.wordType.toUpperCase(),
                                style: TextStyle(
                                  fontSize: 22,
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
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 70,
                  width: 400,
                  color: Colors.blue,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.history),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => History(
                                      history: history,
                                    )),
                          );
                        },
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(32),
                        ),
                        width: 280,
                        height: 50,
                        child: TextField(
                          decoration: const InputDecoration(
                            hintText: "Type English Word",
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(10),
                          ),
                          controller: searchItemController,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.search),
                        onPressed: () {
                          setState(() {
                            // Update dataFuture with the new search term
                            var searchWordListFuture = getSearchWord(
                                searchItemController.text
                                    .toString()
                                    .toLowerCase(),
                                'contains');
                            history.add(searchItemController.text.toString());
                            dataFuture = searchWordListFuture;
                            print(history);
                          });
                        },
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ]),
      bottomNavigationBar: const BottomNavBar(),
    );
  }

  AppBar _appBar() {
    return AppBar(
      elevation: 0,
      title: const Text("Malayalam Dictionary"),
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 20),
          child: Icon(Icons.share),
        )
      ],
    );
  }
}
