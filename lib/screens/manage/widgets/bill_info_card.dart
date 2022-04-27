import 'package:cashew/global/global.dart';
import 'package:flutter/material.dart';

class BillInfoCard extends StatelessWidget {
  const BillInfoCard({
    Key? key,
    required this.title,
    required this.content,
    required this.iconData,
  }) : super(key: key);

  final String title;
  final String content;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Card(
      // decoration: BoxDecoration(
      //   color: Theme.of(context).cardColor,
      //   borderRadius: BorderRadius.circular(25),
      // ),
      child: Column(children: [
        Expanded(
          child: Container(
            child: Center(
              child: Text(
                content,
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
          ),
        ),
        Container(
          height: 45,
          decoration: BoxDecoration(
            color: Global.colors.lightIconColorDarker,
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        )
      ]),
    ));
  }
}
