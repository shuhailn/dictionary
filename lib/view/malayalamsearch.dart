import 'package:dictionary/controller/malayalamsearchcontroller.dart';
import 'package:dictionary/models/searchwordmodel.dart';
import 'package:dictionary/shared/bottomNavBar/bottomNavBar.dart';
import 'package:dictionary/shared/drawer/drawer.dart';
import 'package:dictionary/view/history.dart';
import 'package:dictionary/view/history.dart';
import 'package:flutter/material.dart';
import 'package:dictionary/shared/routes/routes.dart';

class MalayalamSearchPage extends StatefulWidget {
  const MalayalamSearchPage({super.key});

  @override
  State<MalayalamSearchPage> createState() => _MalayalamSearchPageState();
}

class _MalayalamSearchPageState extends State<MalayalamSearchPage> {
  late Future<List<SearchWordModel>> dataFutureMalayalam = Future.value([]);
  late List historyMalayalam = [];
  Color startColorMalayalam = Colors.black;
  Color containColorMalayalam = Colors.grey;
  Color endColorMalayalam = Colors.grey;
  String searchWordFilterMalayalam = 'start';
  String searchLanguageMalayalam = 'malayalam';
  Color engColorMalayalam = Colors.grey;
  Color malColorMalayalam = Colors.black;

  @override
  Widget build(BuildContext context) {
    TextEditingController searchItemControllerMalayalam =
        TextEditingController();
    return GestureDetector(
      child: Scaffold(
        drawer: const MainDrawer(),
        appBar: _appBarMalayalam(),
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
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              Navigator.pushNamed(context, '/');
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: engColorMalayalam,
                              borderRadius:
                                  BorderRadiusDirectional.circular(10),
                            ),
                            width: 150,
                            height: 50,
                            child: const Center(
                                child: Text("ENG>MAL",
                                    style: TextStyle(fontSize: 18))),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            searchLanguageMalayalam = "malayalam";
                            engColorMalayalam = Colors.grey;
                            malColorMalayalam = Colors.blue;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: malColorMalayalam,
                            borderRadius: BorderRadiusDirectional.circular(10),
                          ),
                          width: 150,
                          height: 50,
                          child: const Center(
                            child: Text(
                              "MAL>ENG",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: FutureBuilder<List<SearchWordModel>>(
                  future: dataFutureMalayalam,
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
                        child: Text('Search a word '),
                      );
                    } else {
                      // Display your data here
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          final item = snapshot.data![index];
                          return ListTile(
                            title: Text(item.malayalamWord),
                            subtitle: Text(item.englishWword),
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
                                  style: const TextStyle(
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
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 115,
                  child: Column(
                    children: [
                      Container(
                        height: 70,
                        width: 400,
                        color: Colors.black,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                              icon: const Icon(
                                Icons.history,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => History(
                                            history: historyMalayalam,
                                          )),
                                );
                              },
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(32),
                              ),
                              width: 250,
                              height: 50,
                              child: TextField(
                                decoration: const InputDecoration(
                                  hintText: "Type English Word",
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.all(10),
                                ),
                                controller: searchItemControllerMalayalam,
                              ),
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.search,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                setState(() {
                                  // Update dataFutureMalayalam with the new search term
                                  var searchWordListFuture =
                                      getSearchWordMalayalam(
                                          searchItemControllerMalayalam.text
                                              .toString()
                                              .toLowerCase(),
                                          searchWordFilterMalayalam);
                                  if (searchItemControllerMalayalam.text
                                          .toString() !=
                                      "") {
                                    historyMalayalam.add(
                                        searchItemControllerMalayalam.text
                                            .toString());
                                  }
                                  dataFutureMalayalam = searchWordListFuture;
                                  print(historyMalayalam);
                                });
                              },
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              height: 30,
                              width: 60,
                              decoration: BoxDecoration(
                                  color: startColorMalayalam,
                                  borderRadius:
                                      BorderRadiusDirectional.circular(10)),
                              child: TextButton(
                                onPressed: () {
                                  setState(() {
                                    searchWordFilterMalayalam = 'start';
                                    if (searchWordFilterMalayalam == 'start') {
                                      startColorMalayalam = Colors.black;
                                      containColorMalayalam = Colors.grey;
                                      endColorMalayalam = Colors.grey;
                                    }
                                  });
                                },
                                child: Text(
                                  "Start",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            Container(
                              height: 30,
                              width: 70,
                              decoration: BoxDecoration(
                                  color: containColorMalayalam,
                                  borderRadius:
                                      BorderRadiusDirectional.circular(10)),
                              child: TextButton(
                                onPressed: () {
                                  setState(() {
                                    searchWordFilterMalayalam = 'contains';
                                    if (searchWordFilterMalayalam ==
                                        'contains') {
                                      containColorMalayalam = Colors.black;
                                      startColorMalayalam = Colors.grey;
                                      endColorMalayalam = Colors.grey;
                                    }
                                  });
                                  print(searchWordFilterMalayalam);
                                },
                                child: const Text(
                                  "Contains",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            Container(
                              height: 30,
                              width: 60,
                              decoration: BoxDecoration(
                                  color: endColorMalayalam,
                                  borderRadius:
                                      BorderRadiusDirectional.circular(10)),
                              child: TextButton(
                                onPressed: () {
                                  setState(() {
                                    searchWordFilterMalayalam = 'endwith';
                                    if (searchWordFilterMalayalam ==
                                        'endwith') {
                                      endColorMalayalam = Colors.black;
                                      startColorMalayalam = Colors.grey;
                                      containColorMalayalam = Colors.grey;
                                    }
                                  });
                                },
                                child: Text(
                                  "End",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ]),
        bottomNavigationBar: const BottomNavBar(),
      ),
    );
  }

  AppBar _appBarMalayalam() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.black,
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
