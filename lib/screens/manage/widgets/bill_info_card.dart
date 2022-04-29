import 'package:auto_size_text/auto_size_text.dart';
import 'package:cashew/global/global.dart';
import 'package:cashew/providers/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(15.0),
            ),
            border: Border.all(
              color: context.watch<SettingsProvider>().isDarkMode
                  ? Colors.white
                  : Colors.black,
            ),
          ),
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
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(13.0),
                    bottomLeft: Radius.circular(13.0),
                  ),
                  color: context.watch<SettingsProvider>().isDarkMode
                      ? Colors.white
                      : Colors.black,
                ),
                child: Center(
                  child: Text(
                    title,
                    style: TextStyle(
                      color: context.watch<SettingsProvider>().isDarkMode
                          ? Colors.black
                          : Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
