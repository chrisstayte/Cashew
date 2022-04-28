import 'package:auto_size_text/auto_size_text.dart';
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
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Center(
                  child: AutoSizeText(
                    content,
                    style: const TextStyle(fontSize: 36),
                    maxLines: 1,
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
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
