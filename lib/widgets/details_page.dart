import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nobel/models/nobel_prize.model.dart';

class DetailsPage extends StatelessWidget {
  final String year;
  final NobelPrize nobelPrize;
  const DetailsPage({Key key, this.year, this.nobelPrize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(year + '-' + nobelPrize.categoryFullName.en),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Container(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Prize Amount'),
                          Text('\$' + nobelPrize.prizeAmount.toString())
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Adjusted Prize Amount'),
                          Text('\$' + nobelPrize.prizeAmountAdjusted.toString())
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Laureates"),
          ),
          Container(
            child: Card(
              child: Column(
                children: nobelPrize.laureates.map((laureate) {
                  return ListTile(
                    title: Text(laureate.knownName.en),
                    subtitle: Text('Motivation: ' + laureate.motivation.en),
                    isThreeLine: true,
                  );
                }).toList(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
