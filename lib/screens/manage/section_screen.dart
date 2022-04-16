import 'package:flutter/material.dart';

class SectionScreen extends StatelessWidget {
  final String title;

  const SectionScreen({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
        ),
      ),
    );
  }
}
