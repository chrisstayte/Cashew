import 'package:flutter/material.dart';

class CalculateScreen extends StatelessWidget {
  const CalculateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculate'),
      ),
      body: Center(
        child: Text(
          'Coming soon!\n Common Financial Calculators',
          style: Theme.of(context).textTheme.headline6,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
