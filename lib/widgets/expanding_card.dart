import 'package:flutter/material.dart';
import 'package:nobel/models/nobel_prize.model.dart';
import 'package:nobel/widgets/details_page.dart';

class ExpandingCard extends StatefulWidget {
  final List<NobelPrize> prizes;
  final String year;
  const ExpandingCard({Key key, this.prizes, this.year}) : super(key: key);
  @override
  _ExpandingCardState createState() => _ExpandingCardState();
}

class _ExpandingCardState extends State<ExpandingCard> {
  bool isExpanded = false;
  double size = 200;
  @override
  Widget build(BuildContext context) {
    return Column(
      key: Key(widget.year),
      children: [
        InkWell(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
              size = isExpanded ? 100 : 200;
            });
          },
          child: Container(
            height: size,
            child: Card(
              child: Center(child: Text(widget.year)),
            ),
          ),
        ),
        isExpanded
            ? Card(
                child: ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) {
                      return Divider();
                    },
                    shrinkWrap: true,
                    itemCount: widget.prizes.length,
                    itemBuilder: (context, index) {
                      NobelPrize prize = widget.prizes[index];
                      return ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => DetailsPage(
                                year: widget.year,
                                nobelPrize: prize,
                              ),
                            ),
                          );
                        },
                        title: Text(prize.categoryFullName.en),
                      );
                    }),
              )
            : Container(),
      ],
    );
  }
}
