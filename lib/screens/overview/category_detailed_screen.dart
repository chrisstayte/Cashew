import 'package:flutter/material.dart';

class CategoryDetailedScreen extends StatefulWidget {
  const CategoryDetailedScreen({Key? key}) : super(key: key);

  @override
  State<CategoryDetailedScreen> createState() => _CategoryDetailedScreenState();
}

class _CategoryDetailedScreenState extends State<CategoryDetailedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CATEGORY DETAILED')),
      body: Container(
        child: Center(
          child: TextButton(
            child: Text('DEEPER'),
            onPressed: () => Navigator.pushNamed(context, '/categoryDetailed'),
          ),
        ),
      ),
    );
  }
}
