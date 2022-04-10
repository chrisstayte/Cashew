import 'package:flutter/material.dart';

class OverviewScreen extends StatefulWidget {
  const OverviewScreen({Key? key}) : super(key: key);

  @override
  State<OverviewScreen> createState() => _OverviewScreenState();
}

class _OverviewScreenState extends State<OverviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cashew'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              color: Colors.blue.shade300,
              child: Container(
                color: Colors.green.shade200,
                child: Center(
                  child: Text('Pie Chart'),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.red.shade300,
              child: Center(
                child: IconButton(
                  icon: Icon(
                    Icons.list,
                    size: 25,
                  ),
                  onPressed: () =>
                      {Navigator.pushNamed(context, '/categoryDetailed')},
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
