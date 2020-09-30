import 'package:flutter/material.dart';
import 'package:nobel/functions.dart';
import 'package:nobel/models/nobel_prize.model.dart';

import 'widgets/expanding_card.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Map<String, List<NobelPrize>> response = {};
  String nextLink;
  bool isLoading = false;
  updateResponse(NobelPrizeResponse value) {
    value.nobelPrizes.forEach(
      (prize) {
        if (!response.containsKey(prize.awardYear)) {
          response.addEntries([
            MapEntry(prize.awardYear, [prize])
          ]);
        } else {
          response[prize.awardYear].add(prize);
        }
      },
    );
  }

  @override
  void initState() {
    fetchNobelPrizes(url: 'https://api.nobelprize.org/2.0/nobelPrizes').then(
      (value) {
        setState(
          () {
            updateResponse(value);
            nextLink = value.links.next;
          },
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Nobel Prize App',
        ),
      ),
      body: response == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: response.keys.length + 1,
              itemBuilder: (context, index) {
                if (index == response.keys.length) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 50,
                      child: FlatButton(
                        color: Colors.blue,
                        onPressed: () {
                          setState(() {
                            isLoading = true;
                          });
                          fetchNobelPrizes(url: nextLink).then(
                            (value) {
                              setState(
                                () {
                                  updateResponse(value);
                                  nextLink = value.links.next;
                                  isLoading = false;
                                },
                              );
                            },
                          );
                        },
                        child: isLoading
                            ? Container(
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white),
                                  backgroundColor: Colors.transparent,
                                ),
                              )
                            : Text(
                                'Load More',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                      ),
                    ),
                  );
                }
                return ExpandingCard(
                  prizes: response[response.keys.toList()[index]],
                  year: response.keys.toList()[index],
                );
              },
            ),
    );
  }
}
